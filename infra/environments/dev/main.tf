# Configuración específica para el entorno de desarrollo
# Superficie de práctica: el estudiante debe completar la invocación de módulos

terraform {
  required_version = ">= 1.9.0"
}

# Módulo de Networking
module "networking" {
  source = "../../modules/networking"

  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  environment           = var.environment
  project_name          = var.project_name

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
}

# Módulo de Database
module "database" {
  source = "../../modules/database"

  db_instance_class          = var.db_instance_class
  db_engine                  = var.db_engine
  db_engine_version          = var.db_engine_version
  db_name                    = var.db_name
  db_username                = var.db_username
  db_password                = var.db_password
  db_subnet_group_name       = "pedidos-db-subnet-group"
  db_allocated_storage       = var.db_allocated_storage
  db_max_allocated_storage   = var.db_max_allocated_storage
  db_backup_retention_period = 7
  db_multi_az                = var.db_multi_az
  db_skip_final_snapshot     = var.db_skip_final_snapshot
  db_deletion_protection     = var.db_deletion_protection
  environment                = var.environment
  project_name               = var.project_name
  vpc_security_group_ids     = [module.networking.database_security_group_id]
}

# Módulo de Storage
module "storage" {
  source = "../../modules/storage"

  bucket_name            = var.bucket_name
  environment            = var.environment
  project_name           = var.project_name
  versioning_enabled     = var.versioning_enabled
  block_public_access    = var.block_public_access
  server_side_encryption = var.server_side_encryption
  sse_algorithm          = var.sse_algorithm
  logging_enabled        = var.logging_enabled
  log_bucket             = "pedidos-app-logs"
  log_prefix             = "s3-access-logs/"
}

# Módulo de Compute
module "compute" {
  source = "../../modules/compute"

  instance_type      = var.instance_type
  ami_id             = var.ami_id
  key_name           = "pedidos-app-key"
  min_size           = 1
  max_size           = 2
  desired_capacity   = 1
  public_subnet_ids  = module.networking.public_subnet_ids
  security_group_ids = [module.networking.api_security_group_id]
  environment        = var.environment
  project_name       = var.project_name
  health_check_path  = "/health"
  api_port           = 3000
  target_group_arns  = [module.networking.target_group_arn]

  user_data = <<-EOF
              #!/bin/bash
              cd /var/www/pedidos-api
              npm install
              npm run migrate
              npm start
              EOF
}

# Outputs del entorno
output "environment" {
  value = var.environment
}

output "vpc_id" {
  value = module.networking.vpc_id
}

output "database_endpoint" {
  value     = module.database.endpoint
  sensitive = true
}

output "database_name" {
  value = var.db_name
}

output "api_endpoint" {
  value = "http://${module.compute.api_url}"
}

output "api_url" {
  value = module.compute.api_url
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.networking.private_subnet_ids
}