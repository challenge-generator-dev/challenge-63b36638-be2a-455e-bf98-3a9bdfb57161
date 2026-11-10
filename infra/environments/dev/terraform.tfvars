# Valores de variables para el entorno de desarrollo
# Estas variables sobrescriben los valores por defecto de variables.tf

aws_region   = "us-east-1"
environment  = "dev"
project_name = "pedidos-app"

# Red
vpc_cidr              = "10.0.0.0/16"
public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs  = ["10.0.3.0/24", "10.0.4.0/24"]
database_subnet_cidrs = ["10.0.5.0/24", "10.0.6.0/24"]

# Compute
instance_type = "t3.micro"
ami_id        = "ami-0c55b159cbfafe1f0"

# Database
db_instance_class        = "db.t3.micro"
db_engine                = "postgres"
db_engine_version        = "13.4"
db_name                  = "pedidosdb"
db_username              = "admin"
db_password              = "dev-password-change-in-prod"
db_allocated_storage     = 20
db_max_allocated_storage = 100
db_multi_az              = false
db_skip_final_snapshot   = true
db_deletion_protection   = false

# Storage
bucket_name            = "pedidos-app-dev-storage"
versioning_enabled     = true
block_public_access    = true
server_side_encryption = true
sse_algorithm          = "AES256"
logging_enabled        = true

# Tags
tags = {
  Environment = "dev"
  Project     = "pedidos-app"
  ManagedBy   = "terraform"
}