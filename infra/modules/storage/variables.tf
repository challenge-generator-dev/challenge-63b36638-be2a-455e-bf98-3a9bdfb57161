# Variables específicas para el módulo de storage

variable "bucket_name" {
  description = "Nombre del bucket S3 para almacenamiento"
  type        = string
  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 && can(regex("^[a-z0-9.-]*$", var.bucket_name))
    error_message = "El nombre del bucket debe tener entre 3 y 63 caracteres y solo puede contener letras minúsculas, números, puntos y guiones."
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

variable "versioning_enabled" {
  description = "Habilitar versionado de objetos en el bucket"
  type        = bool
  default     = true
}

variable "block_public_access" {
  description = "Bloquear todo acceso público al bucket"
  type        = bool
  default     = true
}

variable "server_side_encryption" {
  description = "Habilitar cifrado del lado del servidor"
  type        = bool
  default     = true
}

variable "sse_algorithm" {
  description = "Algoritmo de cifrado para el lado del servidor"
  type        = string
  default     = "AES256"
  validation {
    condition     = contains(["AES256", "aws:kms"], var.sse_algorithm)
    error_message = "Algoritmo de cifrado no soportado. Valores válidos: AES256, aws:kms."
  }
}

variable "lifecycle_rules" {
  description = "Reglas de ciclo de vida para los objetos del bucket"
  type = list(object({
    id      = string
    enabled = bool
    prefix  = string
    transition = list(object({
      days          = number
      storage_class = string
    }))
    expiration = object({
      days = number
    })
  }))
  default = [
    {
      id      = "log-files"
      enabled = true
      prefix  = "logs/"
      transition = [
        {
          days          = 30
          storage_class = "STANDARD_IA"
        },
        {
          days          = 90
          storage_class = "GLACIER"
        }
      ]
      expiration = {
        days = 365
      }
    }
  ]
}

variable "cors_rules" {
  description = "Reglas CORS para el bucket"
  type = list(object({
    allowed_headers = list(string)
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = list(string)
    max_age_seconds = number
  }))
  default = [
    {
      allowed_headers = ["*"]
      allowed_methods = ["GET", "PUT", "POST", "DELETE", "HEAD"]
      allowed_origins = ["https://pedidos-app.com", "https://*.pedidos-app.com"]
      expose_headers  = ["ETag"]
      max_age_seconds = 3000
    }
  ]
}

variable "logging_enabled" {
  description = "Habilitar logging de acceso al bucket"
  type        = bool
  default     = true
}

variable "log_bucket" {
  description = "Nombre del bucket para almacenar logs de acceso"
  type        = string
  default     = "pedidos-app-logs"
}

variable "log_prefix" {
  description = "Prefijo para los logs de acceso"
  type        = string
  default     = "s3-access-logs/"
}