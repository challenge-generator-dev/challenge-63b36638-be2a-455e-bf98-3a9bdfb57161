terraform {
  required_version = ">= 1.9.0"
}

# Configuracion de zonas de disponibilidad para recursos de alta disponibilidad
data "aws_availability_zones" "available" {
  state = "available"
}

# Obtener la cuenta actual de AWS
data "aws_caller_identity" "current" {}

# Obtener la informacion de la region
data "aws_region" "current" {}