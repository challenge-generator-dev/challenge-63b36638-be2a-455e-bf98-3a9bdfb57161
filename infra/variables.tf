# Variables globales para la configuración de la infraestructura de la API de pedidos

variable "aws_region" {
  description = "Región de AWS donde se desplegará la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Nombre del proyecto para etiquetar recursos"
  type        = string
  default     = "pedidos-app"
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Bloques CIDR para las subredes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Bloques CIDR para las subredes privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "database_subnet_cidrs" {
  description = "Bloques CIDR para las subredes de la base de datos"
  type        = list(string)
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para el backend"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
}

variable "db_instance_class" {
  description = "Clase de instancia para la base de datos RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "db_engine" {
  description = "Motor de la base de datos"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "Versión del motor de la base de datos"
  type        = string
  default     = "13.4"
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
  default     = "pedidosdb"
}

variable "db_username" {
  description = "Usuario maestro de la base de datos"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Contraseña maestra de la base de datos"
  type        = string
  sensitive   = true
}

variable "bucket_name" {
  description = "Nombre del bucket S3 para almacenamiento"
  type        = string
  default     = "pedidos-app-storage"
}

variable "tags" {
  description = "Etiquetas comunes para todos los recursos"
  type        = map(string)
  default = {
    Project     = "pedidos-app"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}