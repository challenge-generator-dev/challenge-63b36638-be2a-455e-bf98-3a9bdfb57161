# Outputs del módulo de networking
# Exponen información crítica para otros módulos

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "Bloque CIDR de la VPC"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = module.vpc.private_subnets
}

output "database_subnet_ids" {
  description = "IDs de las subnets de base de datos"
  value       = module.vpc.database_subnets
}

output "public_subnet_arns" {
  description = "ARNs de las subnets públicas"
  value       = module.vpc.public_subnet_arns
}

output "private_subnet_arns" {
  description = "ARNs de las subnets privadas"
  value       = module.vpc.private_subnet_arns
}

output "database_subnet_arns" {
  description = "ARNs de las subnets de base de datos"
  value       = module.vpc.database_subnet_arns
}

output "api_security_group_id" {
  description = "ID del security group de la API"
  value       = aws_security_group.api_sg.id
}

output "alb_security_group_id" {
  description = "ID del security group del ALB"
  value       = aws_security_group.alb_sg.id
}

output "database_security_group_id" {
  description = "ID del security group de la base de datos"
  value       = aws_security_group.database_sg.id
}

output "alb_arn" {
  description = "ARN del Application Load Balancer"
  value       = aws_lb.api_alb.arn
}

output "alb_dns_name" {
  description = "DNS name del ALB"
  value       = aws_lb.api_alb.dns_name
}

output "alb_zone_id" {
  description = "Zone ID del ALB para Route 53"
  value       = aws_lb.api_alb.zone_id
}

output "api_url" {
  description = "URL pública de la API"
  value       = "http://${aws_lb.api_alb.dns_name}"
}

output "target_group_arn" {
  description = "ARN del target group de la API"
  value       = aws_lb_target_group.api_tg.arn
}

output "target_group_name" {
  description = "Nombre del target group de la API"
  value       = aws_lb_target_group.api_tg.name
}