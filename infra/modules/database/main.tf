# Recursos de base de datos
# Este archivo define:
# - RDS PostgreSQL/MySQL para datos transaccionales
# - Grupo de subnets para RDS
# - Security group para la base de datos

# Obtener las subnets de base de datos del módulo de networking
data "terraform_remote_state" "networking" {
  backend = "s3"
  config = {
    bucket = "pedidos-app-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_db_subnet_group" "main" {
  name       = var.db_subnet_group_name
  subnet_ids = data.terraform_remote_state.networking.outputs.database_subnet_ids

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-db-subnet-group"
    }
  )
}

resource "aws_security_group" "database" {
  name        = "${var.project_name}-${var.environment}-rds-sg"
  description = "Security group para RDS"
  vpc_id      = data.terraform_remote_state.networking.outputs.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
    description = "PostgreSQL from VPC"
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-rds-sg"
    }
  )
}

resource "aws_db_instance" "main" {
  identifier     = "${var.project_name}-${var.environment}-db"
  engine         = var.db_engine
  engine_version = var.db_engine_version
  instance_class = var.db_instance_class

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  allocated_storage     = var.db_allocated_storage
  max_allocated_storage = var.db_max_allocated_storage

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = concat([aws_security_group.database.id], var.vpc_security_group_ids)

  backup_retention_period = var.db_backup_retention_period
  multi_az                = var.db_multi_az
  skip_final_snapshot     = var.db_skip_final_snapshot
  deletion_protection     = var.db_deletion_protection

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-rds"
    }
  )
}