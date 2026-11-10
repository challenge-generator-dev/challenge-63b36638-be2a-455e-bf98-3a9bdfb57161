# Outputs del módulo de compute
# Este archivo debe exponer:
# - URLs de las APIs desplegadas
# - IPs públicas de las instancias
# - Endpoints de salud

output "api_url" {
  description = "URL pública de la API"
  value       = "http://${aws_launch_template.api_lt.id}:3000"
}

output "public_ip" {
  description = "Dirección IP pública de la instancia"
  value       = aws_autoscaling_group.api_asg.availability_zones
}

output "instance_id" {
  description = "ID de la instancia EC2"
  value       = aws_autoscaling_group.api_asg.id
}

output "security_group_id" {
  description = "ID del security group"
  value       = var.security_group_ids[0]
}