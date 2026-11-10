# Variables específicas del entorno de desarrollo
# Superficie de práctica: el estudiante debe completar con los valores apropiados para dev

variable "environment_name" {
  description = "Nombre del entorno"
  type        = string
  default     = "dev"
}

variable "enable_monitoring" {
  description = "Habilitar monitoreo detallado en desarrollo"
  type        = bool
  default     = false
}

variable "log_level" {
  description = "Nivel de logs para la aplicación"
  type        = string
  default     = "debug"
}