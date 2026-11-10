# Pedidos App - Infraestructura Terraform

## Descripción

Este proyecto contiene la infraestructura como código (IaC) necesaria para desplegar el backend de la aplicación móvil de pedidos. La infraestructura está construida con Terraform y sigue una arquitectura modular.

## Estructura del Proyecto

```
.
├── main.tf                    # Orquestador principal de módulos
├── variables.tf               # Variables globales del proyecto
├── outputs.tf                 # Outputs globales
├── versions.tf                # Requerimientos de Terraform y providers
├── providers.tf               # Configuración de providers
├── README.md                  # Este archivo
├── modules/
│   ├── networking/            # Módulo de red (VPC, subnets, gateways)
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── compute/               # Módulo de computo (EC2, ASG, Load Balancer)
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── database/              # Módulo de base de datos (RDS PostgreSQL)
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── storage/               # Módulo de almacenamiento (S3)
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── environments/
    └── dev/                   # Entorno de desarrollo
        ├── main.tf
        ├── variables.tf
        └── terraform.tfvars
```

## Requisitos Previos

- **Terraform** >= 1.9.0
- **AWS CLI** configurado con credenciales
- **Cuenta de AWS** con permisos para crear recursos

## Configuración Inicial

### 1. Configurar credenciales de AWS

```bash
aws configure
```

O configurar variables de entorno:

```bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_REGION="us-east-1"
```

### 2. Inicializar Terraform

```bash
terraform init
```

Este comando descarga los providers y módulos necesarios.

### 3. Validar la configuración

```bash
terraform validate
```

### 4. Ver el plan de ejecución

```bash
terraform plan
```

Esto muestra los recursos que se crearán, modificarán o destroyán.

## Desplegar la Infraestructura

### Entorno de Desarrollo

```bash
cd environments/dev
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

### Aprobación Automática

```bash
terraform apply -var-file="terraform.tfvars" -auto-approve
```

## Destruir la Infraestructura

**⚠️ Advertencia**: Esta acción eliminará todos los recursos creados. Asegúrate de tener backups de datos importantes.

```bash
cd environments/dev
terraform destroy -var-file="terraform.tfvars"
```

### Destrucción Automática

```bash
terraform destroy -var-file="terraform.tfvars" -auto-approve
```

## Recursos Aprovisionados

### Networking
- VPC con CIDR 10.0.0.0/16
- Subnets públicas y privadas
- NAT Gateway para salida a Internet
- Internet Gateway
- Tablas de enrutamiento

### Compute
- Instancias EC2 o Auto Scaling Group
- Application Load Balancer
- Security Groups para HTTP/HTTPS
- Health checks en /health

### Database
- RDS PostgreSQL
- Multi-AZ (opcional)
--backup automatizados
- Encryption at rest

### Storage
- S3 Bucket para archivos estáticos y uploads
- Versioning habilitado
- Server-side encryption (AES256)
- Lifecycle policies
- Access logging

## Variables Principales

| Variable | Descripción | Valor por defecto |
|----------|-------------|-------------------|
| aws_region | Región de AWS | us-east-1 |
| environment | Entorno de despliegue | dev |
| project_name | Nombre del proyecto | pedidos-app |
| instance_type | Tipo de instancia EC2 | t3.micro |
| db_instance_class | Clase de instancia RDS | db.t3.micro |
| bucket_name | Nombre del bucket S3 | pedidos-app-storage |

## Endpoints de la API

Una vez desplegada la infraestructura, la API estará disponible en:

- **Health Check**: `http://<alb-dns>/health`
- **Orders API**: `http://<alb-dns>/api/orders`

El DNS del Load Balancer se obtiene del output `alb_dns_name`.

## Mantenimiento

### Actualizar Infraestructura

1. Modificar los archivos .tf necesarios
2. Ejecutar `terraform plan` para ver cambios
3. Ejecutar `terraform apply` para aplicar cambios

### State Remoto

Este proyecto está configurado para usar S3 como backend remoto:

```hcl
terraform {
  backend "s3" {
    bucket         = "pedidos-app-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "pedidos-app-terraform-locks"
  }
}
```

**Nota**: Debes crear el bucket de state y la tabla DynamoDB antes de usar el backend remoto.

## Seguridad

- Las credenciales de base de datos se manejan via variables
- Los recursos tienen tagging para auditoría
- S3 bucket con acceso bloqueado públicamente
- RDS con deletion protection habilitado
- Security Groups con reglas restrictivas

## Troubleshooting

### Error de autenticación

Verificar credenciales de AWS:

```bash
aws sts get-caller-identity
```

### Error de estado bloqueado

Si el estado está bloqueado, esperar o verificar DynamoDB:

```bash
aws dynamodb describe-table --table-name pedidos-app-terraform-locks
```

### Recursos orphans

Si hay recursos huérfanos en AWS:

```bash
terraform state list
terraform state rm <recurso>
```

## Referencias

- [Documentación de Terraform](https://www.terraform.io/docs/)
- [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws)
- [Módulos de Terraform AWS](https://registry.terraform.io/namespaces/terraform-aws-modules)