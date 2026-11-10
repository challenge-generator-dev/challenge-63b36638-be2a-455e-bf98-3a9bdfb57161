# Configuración de proveedores y backend para Terraform
# Este archivo define la configuración global de providers y el backend remoto

terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.64.0"
    }
  }
  backend "s3" {
    bucket         = "pedidos-app-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "pedidos-app-terraform-locks"
    encrypt        = true
  }
}