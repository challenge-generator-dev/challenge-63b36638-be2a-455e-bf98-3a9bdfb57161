# Punto de entrada principal de Terraform para la aplicación de pedidos
# Este archivo orquesta los módulos de infraestructura por entorno

terraform {
  required_version = ">= 1.9.0"
}

# Proveedor AWS - única configuración default en el root module
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.tags
  }
}

# Carga la configuración del entorno de desarrollo
# El módulo de entorno (environments/dev) recibe las variables de infraestructura
# directamente y las pasa a los módulos correspondientes

module "dev_environment" {
  source = "./environments/dev"

  environment_name  = var.environment
  enable_monitoring = var.enable_monitoring
  log_level         = var.log_level
}