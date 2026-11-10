# Módulo de almacenamiento S3 para la aplicación de pedidos
# Superficie de práctica: el estudiante debe implementar los recursos de almacenamiento

# TODO: Implementar recurso aws_s3_bucket
# El bucket debe usar las variables: bucket_name, environment, project_name, tags

# TODO: Configurar versionamiento del bucket
# Usar variable: versioning_enabled

# TODO: Configurar acceso público
# Usar variable: block_public_access

# TODO: Configurar cifrado del lado del servidor
# Usar variables: server_side_encryption, sse_algorithm

# TODO: Configurar lifecycle rules para transición de objetos
# Usar variable: lifecycle_rules

# TODO: Configurar CORS si es necesario
# Usar variable: cors_rules

# TODO: Configurar logging de acceso
# Usar variables: logging_enabled, log_bucket, log_prefix

# Ejemplo de estructura esperada:
# resource "aws_s3_bucket" "this" {
#   bucket = var.bucket_name
#   tags   = var.tags
# }

# resource "aws_s3_bucket_versioning" "this" {
#   bucket = aws_s3_bucket.this.id
#   versioning_configuration {
#     status = var.versioning_enabled ? "Enabled" : "Disabled"
#   }
# }