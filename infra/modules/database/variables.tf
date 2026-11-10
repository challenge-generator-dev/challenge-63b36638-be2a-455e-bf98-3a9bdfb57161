# Variables específicas para el módulo de base de datos

variable "db_instance_class" {
  description = "Clase de instancia para la base de datos RDS"
  type        = string
  validation {
    condition     = contains(["db.t3.micro", "db.t3.small", "db.t3.medium", "db.m5.large"], var.db_instance_class)
    error_message = "Clase de instancia no permitida. Valores válidos: db.t3.micro, db.t3.small, db.t3.medium, db.m5.large."
  }
}

variable "db_engine" {
  description = "Motor de la base de datos"
  type        = string
  validation {
    condition     = contains(["postgres", "mysql", "aurora-postgresql"], var.db_engine)
    error_message = "Motor de base de datos no soportado. Valores válidos: postgres, mysql, aurora-postgresql."
  }
}

variable "db_engine_version" {
  description = "Versión del motor de la base de datos"
  type        = string
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
  validation {
    condition     = length(var.db_name) <= 63 && length(var.db_name) >= 3
    error_message = "El nombre de la base de datos debe tener entre 3 y 63 caracteres."
  }
}

variable "db_username" {
  description = "Usuario maestro de la base de datos"
  type        = string
  validation {
    condition     = length(var.db_username) <= 16 && length(var.db_username) >= 3
    error_message = "El usuario debe tener entre 3 y 16 caracteres."
  }
}

variable "db_password" {
  description = "Contraseña maestra de la base de datos"
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.db_password) >= 8 && length(var.db_password) <= 41
    error_message = "La contraseña debe tener entre 8 y 41 caracteres."
  }
}

variable "db_subnet_group_name" {
  description = "Nombre del grupo de subredes para la base de datos"
  type        = string
  default     = "pedidos-db-subnet-group"
}

variable "db_allocated_storage" {
  description = "Almacenamiento asignado a la base de datos en GB"
  type        = number
  default     = 20
}

variable "db_max_allocated_storage" {
  description = "Almacenamiento máximo asignado a la base de datos en GB"
  type        = number
  default     = 100
}

variable "db_backup_retention_period" {
  description = "Período de retención de backups en días"
  type        = number
  default     = 7
}

variable "db_multi_az" {
  description = "Habilitar despliegue multi-AZ para alta disponibilidad"
  type        = bool
  default     = false
}

variable "db_skip_final_snapshot" {
  description = "Omitir snapshot final al eliminar la base de datos"
  type        = bool
  default     = false
}

variable "db_deletion_protection" {
  description = "Proteger la base de datos contra eliminación accidental"
  type        = bool
  default     = true
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

variable "vpc_security_group_ids" {
  description = "IDs de los security groups asociados a la base de datos"
  type        = list(string)
  validation {
    condition     = length(var.vpc_security_group_ids) >= 1
    error_message = "Debe proporcionarse al menos un security group para la base de datos."
  }
}