# Outputs del módulo de base de datos
# Este archivo debe exponer:
# - Endpoint de conexión
# - Puerto
# - Nombre de la base de datos
# - Credentials (de forma segura)

# TODO: Implementar los outputs necesarios para exponer
# la información de la base de datos creada

output "endpoint" {
  description = "Endpoint de conexión a la base de datos"
  value       = aws_db_instance.main.endpoint
  sensitive   = true
}

output "port" {
  description = "Puerto de la base de datos"
  value       = aws_db_instance.main.port
}

output "db_name" {
  description = "Nombre de la base de datos"
  value       = var.db_name
}

output "db_instance_id" {
  description = "ID de la instancia RDS"
  value       = aws_db_instance.main.id
}

output "db_instance_arn" {
  description = "ARN de la instancia RDS"
  value       = aws_db_instance.main.arn
}

output "security_group_id" {
  description = "ID del security group de la base de datos"
  value       = aws_security_group.database.id
}