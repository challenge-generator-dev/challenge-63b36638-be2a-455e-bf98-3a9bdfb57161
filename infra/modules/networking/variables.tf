# Variables específicas para el módulo de networking

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Bloques CIDR para las subredes públicas"
  type        = list(string)
  validation {
    condition     = length(var.public_subnet_cidrs) >= 2
    error_message = "Deben definirse al menos 2 subredes públicas para alta disponibilidad."
  }
}

variable "private_subnet_cidrs" {
  description = "Bloques CIDR para las subredes privadas"
  type        = list(string)
  validation {
    condition     = length(var.private_subnet_cidrs) >= 2
    error_message = "Deben definirse al menos 2 subredes privadas para alta disponibilidad."
  }
}

variable "database_subnet_cidrs" {
  description = "Bloques CIDR para las subredes de la base de datos"
  type        = list(string)
  validation {
    condition     = length(var.database_subnet_cidrs) >= 2
    error_message = "Deben definirse al menos 2 subredes para la base de datos para alta disponibilidad."
  }
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Nombre del proyecto para etiquetar recursos"
  type        = string
}

variable "enable_nat_gateway" {
  description = "Habilitar NAT Gateway para salida a Internet en subredes privadas"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Usar un único NAT Gateway para todas las subredes privadas"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Habilitar nombres de host DNS en la VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Habilitar soporte DNS en la VPC"
  type        = bool
  default     = true
}