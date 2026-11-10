# Variables específicas para el módulo compute

variable "instance_type" {
  description = "Tipo de instancia EC2 para el backend"
  type        = string
  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium", "m5.large"], var.instance_type)
    error_message = "Tipo de instancia no permitido. Valores válidos: t3.micro, t3.small, t3.medium, m5.large."
  }
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
  validation {
    condition     = length(var.ami_id) > 4 && substr(var.ami_id, 0, 4) == "ami-"
    error_message = "El ID de AMI debe comenzar con 'ami-'."
  }
}

variable "key_name" {
  description = "Nombre de la clave SSH para acceder a las instancias"
  type        = string
  default     = "pedidos-app-key"
}

variable "min_size" {
  description = "Tamaño mínimo del grupo de autoescalado"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Tamaño máximo del grupo de autoescalado"
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "Capacidad deseada del grupo de autoescalado"
  type        = number
  default     = 1
}

variable "public_subnet_ids" {
  description = "IDs de las subredes públicas donde se desplegarán las instancias"
  type        = list(string)
  validation {
    condition     = length(var.public_subnet_ids) >= 2
    error_message = "Deben proporcionarse al menos 2 IDs de subredes públicas."
  }
}

variable "security_group_ids" {
  description = "IDs de los security groups asociados a las instancias"
  type        = list(string)
  validation {
    condition     = length(var.security_group_ids) >= 1
    error_message = "Debe proporcionarse al menos un security group."
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

variable "tags" {
  description = "Etiquetas adicionales para los recursos"
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "Script de user data para configurar las instancias al inicio"
  type        = string
  default     = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y docker
                service docker start
                docker run -d -p 80:3000 --name pedidos-api pedidos-app/api:latest
                EOF
}

variable "health_check_path" {
  description = "Ruta para el health check de las instancias"
  type        = string
  default     = "/health"
}

variable "api_port" {
  description = "Puerto donde escucha la API"
  type        = number
  default     = 3000
}