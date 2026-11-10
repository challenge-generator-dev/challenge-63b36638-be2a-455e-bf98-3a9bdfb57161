# Outputs del root de Terraform
# Expone los valores de los módulos para consumo externo

# Outputs generales del entorno
output "environment" {
  description = "Nombre del entorno"
  value       = var.environment
}

output "project_name" {
  description = "Nombre del proyecto"
  value       = var.project_name
}

output "aws_region" {
  description = "Region de AWS"
  value       = var.aws_region
}

# Declaración de módulos (requeridos para outputs)
module "networking" {
  source = "./modules/networking"

  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  environment           = var.environment
  project_name          = var.project_name
  enable_nat_gateway    = true
  single_nat_gateway    = true
  enable_dns_hostnames  = true
  enable_dns_support    = true
}

module "database" {
  source = "./modules/database"

  db_instance_class          = var.db_instance_class
  db_engine                  = var.db_engine
  db_engine_version          = var.db_engine_version
  db_name                    = var.db_name
  db_username                = var.db_username
  db_password                = var.db_password
  db_subnet_group_name       = "${var.project_name}-${var.environment}-db-subnet-group"
  db_allocated_storage       = 20
  db_max_allocated_storage   = 100
  db_backup_retention_period = 7
  db_multi_az                = false
  db_skip_final_snapshot     = false
  db_deletion_protection     = true
  environment                = var.environment
  project_name               = var.project_name
  tags                       = var.tags
  vpc_security_group_ids     = [module.networking.database_security_group_id]
}

module "storage" {
  source = "./modules/storage"

  bucket_name            = var.bucket_name
  environment            = var.environment
  project_name           = var.project_name
  tags                   = var.tags
  versioning_enabled     = true
  block_public_access    = true
  server_side_encryption = true
  sse_algorithm          = "AES256"
  logging_enabled        = true
  log_bucket             = "${var.bucket_name}-logs"
  log_prefix             = "s3-access-logs/"
}

module "compute" {
  source = "./modules/compute"

  instance_type      = var.instance_type
  ami_id             = var.ami_id
  min_size           = 1
  max_size           = 2
  desired_capacity   = 1
  public_subnet_ids  = module.networking.public_subnet_ids
  security_group_ids = [module.networking.api_security_group_id]
  environment        = var.environment
  project_name       = var.project_name
  tags               = var.tags
  health_check_path  = "/health"
  api_port           = 3000
}

# Outputs de networking
output "vpc_id" {
  description = "ID de la VPC"
  value       = module.networking.vpc_id
}

output "vpc_cidr_block" {
  description = "Bloque CIDR de la VPC"
  value       = module.networking.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subnets publicas"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = module.networking.private_subnet_ids
}

output "database_subnet_ids" {
  description = "IDs de las subnets de base de datos"
  value       = module.networking.database_subnet_ids
}

output "alb_dns_name" {
  description = "Nombre DNS del Application Load Balancer"
  value       = module.networking.alb_dns_name
}

output "alb_zone_id" {
  description = "Zone ID del ALB para Route 53"
  value       = module.networking.alb_zone_id
}

output "api_security_group_id" {
  description = "ID del security group de la API"
  value       = module.networking.api_security_group_id
}

# Outputs de base de datos
output "database_endpoint" {
  description = "Endpoint de la base de datos RDS"
  value       = module.database.endpoint
  sensitive   = true
}

output "database_port" {
  description = "Puerto de la base de datos"
  value       = module.database.port
}

output "database_name" {
  description = "Nombre de la base de datos"
  value       = var.db_name
}

output "database_instance_id" {
  description = "ID de la instancia RDS"
  value       = module.database.db_instance_id
}

# Outputs de almacenamiento
output "bucket_name" {
  description = "Nombre del bucket S3"
  value       = var.bucket_name
}

output "bucket_arn" {
  description = "ARN del bucket S3"
  value       = "arn:aws:s3:::${var.bucket_name}"
}

# Outputs de compute
output "api_url" {
  description = "URL publica de la API"
  value       = "http://${module.networking.alb_dns_name}"
}

output "api_endpoint" {
  description = "Endpoint de la API (para consumo interno)"
  value       = module.compute.api_url
}

output "api_health_endpoint" {
  description = "Endpoint de health check de la API"
  value       = "${module.compute.api_url}/health"
}

output "orders_api_endpoint" {
  description = "Endpoint para obtener pedidos (GET /api/orders)"
  value       = "${module.compute.api_url}/api/orders"
}

output "instance_id" {
  description = "ID de la instancia EC2"
  value       = module.compute.instance_id
}

output "public_ip" {
  description = "IP publica de la instancia EC2"
  value       = module.compute.public_ip
}

# Outputs de cuenta AWS
output "aws_account_id" {
  description = "ID de la cuenta de AWS"
  value       = data.aws_caller_identity.current.account_id
}

output "aws_region_name" {
  description = "Nombre de la region de AWS"
  value       = data.aws_region.current.name
}