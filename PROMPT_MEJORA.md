# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `infra/versions.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/networking/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/networking/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/networking/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/database/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/database/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/database/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/storage/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/storage/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/storage/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `client` | `client/` | chapter, support | client | Flutter | Flutter |

## Orden de arranque

1. `cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate` — componente `infra` (practice).
2. `cd client && flutter pub get && flutter analyze` — componente `client` (chapter, support).

### Contratos entre componentes

- `infra` expone http (api: http://${module.compute.api_url}):
  - `GET /api/orders`
  - `GET /health`
- `client` expone http (api: http://${module.compute.api_url}):
  - `GET /api/orders`

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Como saber que terminaste

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd client && flutter pub get && flutter analyze)
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Movil, Especialidad Desarrollador, Tecnología Flutter, Senior L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform para la app movil (corrida e2e 20261110090352996), Aprovisiona con Terraform los recursos que consume la aplicacion movil

### Misión / candidato
Desplegar la API de la app de pedidos

### Reto
- Tema: Infraestructura como codigo para el backend de una app movil
- Seniority: senior-l2
- Tipo: practical
- Título: Despliegue de la API de la app de pedidos usando Terraform
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Exploración del dominio y definición de recursos — objetivo: Identificar los recursos necesarios para la API de la app de pedidos y definirlos en Terraform. — entregable (NO resolver): Un archivo de Terraform que define los recursos necesarios para la API de la app de pedidos.
- Fase 2: Aprovisionamiento de recursos y validación — objetivo: Aprovisionar los recursos definidos en Terraform y validar su correcto funcionamiento. — entregable (NO resolver): Un informe que documenta el proceso de aprovisionamiento y los resultados de las pruebas.
- Fase 3: Optimización y refactorización — objetivo: Optimizar y refactorizar el código de Terraform para mejorar la eficiencia y la mantenibilidad. — entregable (NO resolver): Un archivo de Terraform refactorizado y un documento que explica los cambios realizados y las decisiones tomadas.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: infra/variables.tf ===
# Variables globales para la configuración de la infraestructura de la API de pedidos

variable "aws_region" {
  description = "Región de AWS donde se desplegará la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Nombre del proyecto para etiquetar recursos"
  type        = string
  default     = "pedidos-app"
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Bloques CIDR para las subredes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Bloques CIDR para las subredes privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "database_subnet_cidrs" {
  description = "Bloques CIDR para las subredes de la base de datos"
  type        = list(string)
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para el backend"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
}

variable "db_instance_class" {
  description = "Clase de instancia para la base de datos RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "db_engine" {
  description = "Motor de la base de datos"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "Versión del motor de la base de datos"
  type        = string
  default     = "13.4"
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
  default     = "pedidosdb"
}

variable "db_username" {
  description = "Usuario maestro de la base de datos"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Contraseña maestra de la base de datos"
  type        = string
  sensitive   = true
}

variable "bucket_name" {
  description = "Nombre del bucket S3 para almacenamiento"
  type        = string
  default     = "pedidos-app-storage"
}

variable "tags" {
  description = "Etiquetas comunes para todos los recursos"
  type        = map(string)
  default = {
    Project     = "pedidos-app"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

// === ARCHIVO: infra/providers.tf ===
# Configuración de proveedores y backend para Terraform
# Este archivo define la configuración global de providers y el backend remoto

terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.64.0"
    }
  }
  backend "s3" {
    bucket         = "pedidos-app-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "pedidos-app-terraform-locks"
    encrypt        = true
  }
}

// === ARCHIVO: infra/modules/networking/variables.tf ===
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

// === ARCHIVO: infra/modules/compute/variables.tf ===
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

// === ARCHIVO: infra/modules/database/variables.tf ===
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

// === ARCHIVO: infra/modules/storage/variables.tf ===
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

// === ARCHIVO: infra/environments/dev/variables.tf ===
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

// === ARCHIVO: infra/environments/dev/terraform.tfvars ===
# Valores de variables para el entorno de desarrollo
# Estas variables sobrescriben los valores por defecto de variables.tf

aws_region   = "us-east-1"
environment  = "dev"
project_name = "pedidos-app"

# Red
vpc_cidr              = "10.0.0.0/16"
public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs  = ["10.0.3.0/24", "10.0.4.0/24"]
database_subnet_cidrs = ["10.0.5.0/24", "10.0.6.0/24"]

# Compute
instance_type = "t3.micro"
ami_id        = "ami-0c55b159cbfafe1f0"

# Database
db_instance_class        = "db.t3.micro"
db_engine                = "postgres"
db_engine_version        = "13.4"
db_name                  = "pedidosdb"
db_username              = "admin"
db_password              = "dev-password-change-in-prod"
db_allocated_storage     = 20
db_max_allocated_storage = 100
db_multi_az              = false
db_skip_final_snapshot   = true
db_deletion_protection   = false

# Storage
bucket_name            = "pedidos-app-dev-storage"
versioning_enabled     = true
block_public_access    = true
server_side_encryption = true
sse_algorithm          = "AES256"
logging_enabled        = true

# Tags
tags = {
  Environment = "dev"
  Project     = "pedidos-app"
  ManagedBy   = "terraform"
}

// === ARCHIVO: infra/environments/dev/main.tf ===
# Configuración específica para el entorno de desarrollo
# Superficie de práctica: el estudiante debe completar la invocación de módulos

terraform {
  required_version = ">= 1.9.0"
}

# Módulo de Networking
module "networking" {
  source = "../../modules/networking"

  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  environment           = var.environment
  project_name          = var.project_name

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
}

# Módulo de Database
module "database" {
  source = "../../modules/database"

  db_instance_class          = var.db_instance_class
  db_engine                  = var.db_engine
  db_engine_version          = var.db_engine_version
  db_name                    = var.db_name
  db_username                = var.db_username
  db_password                = var.db_password
  db_subnet_group_name       = "pedidos-db-subnet-group"
  db_allocated_storage       = var.db_allocated_storage
  db_max_allocated_storage   = var.db_max_allocated_storage
  db_backup_retention_period = 7
  db_multi_az                = var.db_multi_az
  db_skip_final_snapshot     = var.db_skip_final_snapshot
  db_deletion_protection     = var.db_deletion_protection
  environment                = var.environment
  project_name               = var.project_name
  vpc_security_group_ids     = [module.networking.database_security_group_id]
}

# Módulo de Storage
module "storage" {
  source = "../../modules/storage"

  bucket_name            = var.bucket_name
  environment            = var.environment
  project_name           = var.project_name
  versioning_enabled     = var.versioning_enabled
  block_public_access    = var.block_public_access
  server_side_encryption = var.server_side_encryption
  sse_algorithm          = var.sse_algorithm
  logging_enabled        = var.logging_enabled
  log_bucket             = "pedidos-app-logs"
  log_prefix             = "s3-access-logs/"
}

# Módulo de Compute
module "compute" {
  source = "../../modules/compute"

  instance_type      = var.instance_type
  ami_id             = var.ami_id
  key_name           = "pedidos-app-key"
  min_size           = 1
  max_size           = 2
  desired_capacity   = 1
  public_subnet_ids  = module.networking.public_subnet_ids
  security_group_ids = [module.networking.api_security_group_id]
  environment        = var.environment
  project_name       = var.project_name
  health_check_path  = "/health"
  api_port           = 3000
  target_group_arns  = [module.networking.target_group_arn]

  user_data = <<-EOF
              #!/bin/bash
              cd /var/www/pedidos-api
              npm install
              npm run migrate
              npm start
              EOF
}

# Outputs del entorno
output "environment" {
  value = var.environment
}

output "vpc_id" {
  value = module.networking.vpc_id
}

output "database_endpoint" {
  value     = module.database.endpoint
  sensitive = true
}

output "database_name" {
  value = var.db_name
}

output "api_endpoint" {
  value = "http://${module.compute.api_url}"
}

output "api_url" {
  value = module.compute.api_url
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.networking.private_subnet_ids
}

// === ARCHIVO: infra/modules/networking/main.tf ===
# Módulo de networking para la aplicación de pedidos
# Define recursos de red: VPC, subnets, security groups, load balancers

# VPC principal
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = "${var.project_name}-vpc-${var.environment}"
  cidr = var.vpc_cidr

  azs              = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnets   = var.public_subnet_cidrs
  private_subnets  = var.private_subnet_cidrs
  database_subnets = var.database_subnet_cidrs

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.single_nat_gateway ? false : true
}

# Security group para la API (instancias compute)
resource "aws_security_group" "api_sg" {
  name        = "${var.project_name}-api-sg-${var.environment}"
  description = "Security group para la API de pedidos"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP para API"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS para API"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Salida allow all"
  }

  tags = {
    Name = "${var.project_name}-api-sg-${var.environment}"
  }
}

# Security group para Load Balancer
resource "aws_security_group" "alb_sg" {
  name        = "${var.project_name}-alb-sg-${var.environment}"
  description = "Security group para el Application Load Balancer"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Salida allow all"
  }

  tags = {
    Name = "${var.project_name}-alb-sg-${var.environment}"
  }
}

# Security group para base de datos
resource "aws_security_group" "database_sg" {
  name        = "${var.project_name}-database-sg-${var.environment}"
  description = "Security group para RDS PostgreSQL"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.api_sg.id]
    description     = "PostgreSQL desde API"
  }

  tags = {
    Name = "${var.project_name}-database-sg-${var.environment}"
  }
}

# Application Load Balancer
resource "aws_lb" "api_alb" {
  name               = "${var.project_name}-alb-${var.environment}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = module.vpc.public_subnets

  enable_deletion_protection = false

  tags = {
    Name = "${var.project_name}-alb-${var.environment}"
  }
}

# Target group para la API
resource "aws_lb_target_group" "api_tg" {
  name     = "${var.project_name}-api-tg-${var.environment}"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/health"
    matcher             = "200"
  }

  tags = {
    Name = "${var.project_name}-api-tg-${var.environment}"
  }
}

# Listener HTTP
resource "aws_lb_listener" "api_http" {
  load_balancer_arn = aws_lb.api_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api_tg.arn
  }
}

# Datos de disponibilidad de zonas
data "aws_availability_zones" "available" {
  state = "available"
}

// === ARCHIVO: infra/modules/networking/outputs.tf ===
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

// === ARCHIVO: infra/modules/compute/main.tf ===
# Módulo de compute para la aplicación de pedidos
# Superficie de práctica: definir instancias, clusters, funciones serverless para la API

# Variable para los ARNs de los target groups
variable "target_group_arns" {
  type        = list(string)
  description = "ARNs de los target groups para el Auto Scaling Group"
  default     = []
}

# Launch template para Auto Scaling Group
resource "aws_launch_template" "api_lt" {
  name_prefix   = "${var.project_name}-api-lt-${var.environment}-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = base64encode(var.user_data)

  vpc_security_group_ids = var.security_group_ids

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = merge(var.tags, {
      Name = "${var.project_name}-api-${var.environment}"
    })
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "api_asg" {
  name                      = "${var.project_name}-api-asg-${var.environment}"
  vpc_zone_identifier       = var.public_subnet_ids
  desired_capacity          = var.desired_capacity
  min_size                  = var.min_size
  max_size                  = var.max_size
  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.api_lt.id
    version = "$Latest"
  }

  target_group_arns = var.target_group_arns

  tag {
    key                 = "Name"
    value               = "${var.project_name}-api-${var.environment}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = var.project_name
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Scaling policies
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${var.project_name}-scale-up-${var.environment}"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.api_asg.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "${var.project_name}-scale-down-${var.environment}"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.api_asg.name
}

# CloudWatch metric alarm for scale up
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${var.project_name}-cpu-high-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "70"
  alarm_description   = "This metric monitors CPU utilization for ASG scale up"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.api_asg.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_up.arn]
  ok_actions    = [aws_autoscaling_policy.scale_down.arn]
}

# CloudWatch metric alarm for scale down
resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "${var.project_name}-cpu-low-${var.environment}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"
  alarm_description   = "This metric monitors CPU utilization for ASG scale down"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.api_asg.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_down.arn]
}

# IAM role para las instancias
resource "aws_iam_role" "api_instance_role" {
  name = "${var.project_name}-api-instance-role-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Policy para SSM
resource "aws_iam_role_policy_attachment" "ssm_managed" {
  role       = aws_iam_role.api_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Policy para CloudWatch
resource "aws_iam_role_policy_attachment" "cloudwatch_agent" {
  role       = aws_iam_role.api_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

# Instance profile
resource "aws_iam_instance_profile" "api_instance_profile" {
  name = "${var.project_name}-api-instance-profile-${var.environment}"
  role = aws_iam_role.api_instance_role.name

  lifecycle {
    create_before_destroy = true
  }
}

// === ARCHIVO: infra/modules/compute/outputs.tf ===
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

// === ARCHIVO: infra/modules/database/main.tf ===
# Recursos de base de datos
# Este archivo define:
# - RDS PostgreSQL/MySQL para datos transaccionales
# - Grupo de subnets para RDS
# - Security group para la base de datos

# Obtener las subnets de base de datos del módulo de networking
data "terraform_remote_state" "networking" {
  backend = "s3"
  config = {
    bucket = "pedidos-app-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_db_subnet_group" "main" {
  name       = var.db_subnet_group_name
  subnet_ids = data.terraform_remote_state.networking.outputs.database_subnet_ids

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-db-subnet-group"
    }
  )
}

resource "aws_security_group" "database" {
  name        = "${var.project_name}-${var.environment}-rds-sg"
  description = "Security group para RDS"
  vpc_id      = data.terraform_remote_state.networking.outputs.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
    description = "PostgreSQL from VPC"
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-rds-sg"
    }
  )
}

resource "aws_db_instance" "main" {
  identifier     = "${var.project_name}-${var.environment}-db"
  engine         = var.db_engine
  engine_version = var.db_engine_version
  instance_class = var.db_instance_class

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  allocated_storage     = var.db_allocated_storage
  max_allocated_storage = var.db_max_allocated_storage

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = concat([aws_security_group.database.id], var.vpc_security_group_ids)

  backup_retention_period = var.db_backup_retention_period
  multi_az                = var.db_multi_az
  skip_final_snapshot     = var.db_skip_final_snapshot
  deletion_protection     = var.db_deletion_protection

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-rds"
    }
  )
}

// === ARCHIVO: infra/modules/database/outputs.tf ===
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

// === ARCHIVO: infra/modules/storage/main.tf ===
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

// === ARCHIVO: infra/modules/storage/outputs.tf ===
# Outputs del módulo de almacenamiento
# Superficie de práctica: el estudiante debe definir los outputs necesarios

# TODO: Exportar ID del bucket
# output "bucket_id" {
#   description = "ID del bucket S3"
#   value       = aws_s3_bucket.this.id
# }

# TODO: Exportar ARN del bucket
# output "bucket_arn" {
#   description = "ARN del bucket S3"
#   value       = aws_s3_bucket.this.arn
# }

# TODO: Exportar nombre del bucket
# output "bucket_name" {
#   description = "Nombre del bucket S3"
#   value       = aws_s3_bucket.this.bucket
# }

# TODO: Exportar endpoint del bucket
# output "bucket_domain_name" {
#   description = "Nombre de dominio del bucket S3"
#   value       = aws_s3_bucket.this.bucket_domain_name
# }

// === ARCHIVO: infra/README.md ===
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

// === ARCHIVO: infra/versions.tf ===
terraform {
  required_version = ">= 1.9.0"
}

# Configuracion de zonas de disponibilidad para recursos de alta disponibilidad
data "aws_availability_zones" "available" {
  state = "available"
}

# Obtener la cuenta actual de AWS
data "aws_caller_identity" "current" {}

# Obtener la informacion de la region
data "aws_region" "current" {}

// === ARCHIVO: infra/main.tf = locals { ===
# Tags comunes para todos los recursos
  common_tags = merge(var.tags, {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "terraform"
    Terraform   = "true"
  })

  # Nombre base para recursos
  resource_prefix = "${var.project_name}-${var.environment}"
}

# Modulo de networking: VPC, subnets, security groups, ALB
module "networking" {
  source = "../modules/networking"

  # Parametros de red
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs

  # Etiquetado
  environment   = var.environment
  project_name  = var.project_name

  # Configuracion de VPC
  enable_nat_gateway     = true
  single_nat_gateway     = true
  enable_dns_hostnames   = true
  enable_dns_support     = true

  # Tags comunes
  common_tags = local.common_tags
}

# Modulo de base de datos: RDS PostgreSQL
module "database" {
  source = "../modules/database"

  # Configuracion de instancia
  db_instance_class    = var.db_instance_class
  db_engine            = var.db_engine
  db_engine_version    = var.db_engine_version
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password

  # Configuracion de almacenamiento
  db_allocated_storage     = 20
  db_max_allocated_storage = 100
  db_backup_retention_period = 7
  db_multi_az              = var.environment == "prod" ? true : false
  db_skip_final_snapshot   = var.environment != "prod"
  db_deletion_protection   = var.environment == "prod"

  # Subnet group
  db_subnet_group_name = "${local.resource_prefix}-db-subnet-group"

  # Security groups
  vpc_security_group_ids = [module.networking.database_security_group_id]

  # Etiquetado
  environment  = var.environment
  project_name = var.project_name
  common_tags  = local.common_tags
}

# Modulo de almacenamiento: S3 bucket
module "storage" {
  source = "../modules/storage"

  # Configuracion del bucket
  bucket_name = var.bucket_name

  # Configuracion de seguridad
  versioning_enabled    = true
  block_public_access   = true
  server_side_encryption = true
  sse_algorithm         = "AES256"

  # Configuracion de logs
  logging_enabled = true
  log_bucket      = "${var.bucket_name}-logs"
  log_prefix      = "s3-access-logs/"

  # Lifecycle rules para optimizacion de costos
  lifecycle_rules = [
    {
      id      = "archive-old-versions"
      enabled = true
      noncurrent_version_transition = {
        newer_versions          = 30
        storage_class           = "GLACIER"
      }
    },
    {
      id      = "delete-expired"
      enabled = true
      expiration = 365
    }
  ]

  # CORS rules para la API
  cors_rules = [
    {
      allowed_methods = ["GET", "POST", "PUT"]
      allowed_origins = ["*"]
      allowed_headers = ["*"]
    }
  ]

  # Etiquetado
  environment  = var.environment
  project_name = var.project_name
  common_tags  = local.common_tags
}

# Modulo de compute: EC2 instances con Auto Scaling Group
module "compute" {
  source = "../modules/compute"

  # Configuracion de instancia
  instance_type = var.instance_type
  ami_id        = var.ami_id

  # Configuracion de Auto Scaling
  min_size         = var.environment == "prod" ? 2 : 1
  max_size         = var.environment == "prod" ? 4 : 2
  desired_capacity = var.environment == "prod" ? 2 : 1

  # Redes y seguridad
  public_subnet_ids  = module.networking.public_subnet_ids
  security_group_ids = [module.networking.api_security_group_id]

  # Datos de usuario para inicializacion
  user_data = base64encode(templatefile("${path.module}/templates/user_data.sh", {
    environment     = var.environment
    db_host         = module.database.endpoint
    db_name         = var.db_name
    db_username     = var.db_username
    db_password     = var.db_password
    s3_bucket       = var.bucket_name
    api_port        = 3000
    health_check_path = "/health"
  }))

  # Configuracion de health check
  health_check_path = "/health"
  api_port          = 3000

  # Etiquetado
  environment  = var.environment
  project_name = var.project_name
  common_tags  = local.common_tags
}

// === ARCHIVO: infra/outputs.tf ===
# Outputs del root de Terraform
# Expone los valores de los módulos para consumo externo

# Outputs generales del entorno
output "environment" {
  description = "Nombre del entorno"
  value       = var.environment
}

output "project_name" {
  description = "Nombre del proyecto"
  value       = var.project_name
}

output "aws_region" {
  description = "Region de AWS"
  value       = var.aws_region
}

# Declaración de módulos (requeridos para outputs)
module "networking" {
  source = "./modules/networking"

  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  environment           = var.environment
  project_name          = var.project_name
  enable_nat_gateway    = true
  single_nat_gateway    = true
  enable_dns_hostnames  = true
  enable_dns_support    = true
}

module "database" {
  source = "./modules/database"

  db_instance_class          = var.db_instance_class
  db_engine                  = var.db_engine
  db_engine_version          = var.db_engine_version
  db_name                    = var.db_name
  db_username                = var.db_username
  db_password                = var.db_password
  db_subnet_group_name       = "${var.project_name}-${var.environment}-db-subnet-group"
  db_allocated_storage       = 20
  db_max_allocated_storage   = 100
  db_backup_retention_period = 7
  db_multi_az                = false
  db_skip_final_snapshot     = false
  db_deletion_protection     = true
  environment                = var.environment
  project_name               = var.project_name
  tags                       = var.tags
  vpc_security_group_ids     = [module.networking.database_security_group_id]
}

module "storage" {
  source = "./modules/storage"

  bucket_name            = var.bucket_name
  environment            = var.environment
  project_name           = var.project_name
  tags                   = var.tags
  versioning_enabled     = true
  block_public_access    = true
  server_side_encryption = true
  sse_algorithm          = "AES256"
  logging_enabled        = true
  log_bucket             = "${var.bucket_name}-logs"
  log_prefix             = "s3-access-logs/"
}

module "compute" {
  source = "./modules/compute"

  instance_type      = var.instance_type
  ami_id             = var.ami_id
  min_size           = 1
  max_size           = 2
  desired_capacity   = 1
  public_subnet_ids  = module.networking.public_subnet_ids
  security_group_ids = [module.networking.api_security_group_id]
  environment        = var.environment
  project_name       = var.project_name
  tags               = var.tags
  health_check_path  = "/health"
  api_port           = 3000
}

# Outputs de networking
output "vpc_id" {
  description = "ID de la VPC"
  value       = module.networking.vpc_id
}

output "vpc_cidr_block" {
  description = "Bloque CIDR de la VPC"
  value       = module.networking.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subnets publicas"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = module.networking.private_subnet_ids
}

output "database_subnet_ids" {
  description = "IDs de las subnets de base de datos"
  value       = module.networking.database_subnet_ids
}

output "alb_dns_name" {
  description = "Nombre DNS del Application Load Balancer"
  value       = module.networking.alb_dns_name
}

output "alb_zone_id" {
  description = "Zone ID del ALB para Route 53"
  value       = module.networking.alb_zone_id
}

output "api_security_group_id" {
  description = "ID del security group de la API"
  value       = module.networking.api_security_group_id
}

# Outputs de base de datos
output "database_endpoint" {
  description = "Endpoint de la base de datos RDS"
  value       = module.database.endpoint
  sensitive   = true
}

output "database_port" {
  description = "Puerto de la base de datos"
  value       = module.database.port
}

output "database_name" {
  description = "Nombre de la base de datos"
  value       = var.db_name
}

output "database_instance_id" {
  description = "ID de la instancia RDS"
  value       = module.database.db_instance_id
}

# Outputs de almacenamiento
output "bucket_name" {
  description = "Nombre del bucket S3"
  value       = var.bucket_name
}

output "bucket_arn" {
  description = "ARN del bucket S3"
  value       = "arn:aws:s3:::${var.bucket_name}"
}

# Outputs de compute
output "api_url" {
  description = "URL publica de la API"
  value       = "http://${module.networking.alb_dns_name}"
}

output "api_endpoint" {
  description = "Endpoint de la API (para consumo interno)"
  value       = module.compute.api_url
}

output "api_health_endpoint" {
  description = "Endpoint de health check de la API"
  value       = "${module.compute.api_url}/health"
}

output "orders_api_endpoint" {
  description = "Endpoint para obtener pedidos (GET /api/orders)"
  value       = "${module.compute.api_url}/api/orders"
}

output "instance_id" {
  description = "ID de la instancia EC2"
  value       = module.compute.instance_id
}

output "public_ip" {
  description = "IP publica de la instancia EC2"
  value       = module.compute.public_ip
}

# Outputs de cuenta AWS
output "aws_account_id" {
  description = "ID de la cuenta de AWS"
  value       = data.aws_caller_identity.current.account_id
}

output "aws_region_name" {
  description = "Nombre de la region de AWS"
  value       = data.aws_region.current.name
}

// === ARCHIVO: infra/main.tf ===
# Punto de entrada principal de Terraform para la aplicación de pedidos
# Este archivo orquesta los módulos de infraestructura por entorno

terraform {
  required_version = ">= 1.9.0"
}

# Proveedor AWS - única configuración default en el root module
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.tags
  }
}

# Carga la configuración del entorno de desarrollo
# El módulo de entorno (environments/dev) recibe las variables de infraestructura
# directamente y las pasa a los módulos correspondientes

module "dev_environment" {
  source = "./environments/dev"

  environment_name  = var.environment
  enable_monitoring = var.enable_monitoring
  log_level         = var.log_level
}

// === ARCHIVO: client/pubspec.yaml ===
name: mobile_client
description: Cliente móvil para la app de pedidos
environment:
  sdk: '>=3.6.0 <4.0.0'
  flutter: '>=3.27.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.1
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5

dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^5.4.4
  build_runner: ^2.4.9
  riverpod_generator: ^2.4.0

flutter:
  uses-material-design: true

// === ARCHIVO: client/lib/core/network/api_client.dart ===
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  final http.Client _client;
  final String? authToken;

  ApiClient({required this.baseUrl, http.Client? client, this.authToken}) : _client = client ?? http.Client();

  Future<List<Map<String, dynamic>>> fetchOrders() async {
    try {
      final headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        if (authToken != null) HttpHeaders.authorizationHeader: 'Bearer $authToken',
      };

      final response = await _client.get(
        Uri.parse('$baseUrl/api/orders'),
        headers: headers,
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((order) => order as Map<String, dynamic>).toList();
      } else if (response.statusCode == 401) {
        throw UnauthorizedException('Token de autenticación inválido');
      } else if (response.statusCode == 404) {
        throw NotFoundException('Endpoint no encontrado');
      } else {
        throw ApiException('Error al obtener pedidos: ${response.statusCode}');
      }
    } on TimeoutException {
      throw NetworkException('Tiempo de espera agotado');
    } on SocketException {
      throw NetworkException('Sin conexión a internet');
    } on FormatException {
      throw ApiException('Respuesta inválida del servidor');
    } on http.ClientException {
      throw NetworkException('Error en la conexión con el servidor');
    }
  }

  void close() {
    _client.close();
  }
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => 'ApiException: $message';
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);

  @override
  String toString() => 'UnauthorizedException: $message';
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);

  @override
  String toString() => 'NotFoundException: $message';
}

// === ARCHIVO: client/lib/domain/repositories/order_repository.dart ===
import '../entities/order.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrders();
}

// === ARCHIVO: client/lib/domain/usecases/get_orders.dart ===
import '../repositories/order_repository.dart';
import '../entities/order.dart';

class GetOrders {
  final OrderRepository _orderRepository;

  GetOrders(this._orderRepository);

  Future<List<Order>> call() async {
    try {
      return await _orderRepository.getOrders();
    } on Exception catch (e) {
      throw Exception('Error al obtener pedidos: ${e.toString()}');
    }
  }
}

// === ARCHIVO: client/lib/domain/entities/order.dart ===
class Order {
  final String id;
  final String userId;
  final List<OrderItem> items;
  final double totalAmount;
  final String status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'items': items.map((item) => item.toJson()).toList(),
    'totalAmount': totalAmount,
    'status': status,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['userId'],
      items: (json['items'] as List).map((item) => OrderItem.fromJson(item)).toList(),
      totalAmount: json['totalAmount'].toDouble(),
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}

class OrderItem {
  final String productId;
  final String productName;
  final int quantity;
  final double price;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'productName': productName,
    'quantity': quantity,
    'price': price,
  };

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId'],
      productName: json['productName'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
    );
  }
}

// === ARCHIVO: client/android/app/src/main/AndroidManifest.xml ===
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- Permisos necesarios para la aplicación Flutter -->
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
    
    <!-- Configuración de la aplicación -->
    <application
        android:label="Mobile Client"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:enableOnBackInvokedCallback="true">
        
        <!-- Actividad principal de Flutter -->
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:taskAffinity=""
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            
            <!-- метаdatos para el splash screen -->
            <meta-data
                android:name="io.flutter.embedding.android.NormalTheme"
                android:resource="@style/NormalTheme"/>
            
            <!-- Intent filter para manejar el lanzamiento -->
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        
        <!-- метаdatos adicionales -->
        <meta-data
            android:name="flutterEmbedding"
            android:value="2"/>
            
        <!-- Servicios de Firebase (si se configuran después) -->
        <!-- Descomenta según necesidad -->
        <!-- <meta-data
            android:name="com.google.firebase.messaging.default_notification_icon"
            android:resource="@drawable/ic_notification"/> -->
    </application>
    
    <!-- Queries para Android 11+ -->
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
    </queries>
</manifest>

// === ARCHIVO: client/lib/data/repositories/order_repository_impl.dart ===
import 'package:http/http.dart' as http;
import 'package:mobile_client/core/network/api_client.dart';
import 'package:mobile_client/domain/entities/order.dart';
import 'package:mobile_client/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final ApiClient _apiClient;
  final http.Client _httpClient;
  
  OrderRepositoryImpl({
    required ApiClient apiClient,
    http.Client? httpClient,
  })  : _apiClient = apiClient,
        _httpClient = httpClient ?? http.Client();

  @override
  Future<List<Order>> getOrders() async {
    try {
      final rawOrders = await _apiClient.fetchOrders();
      
      if (rawOrders.isEmpty) {
        return [];
      }
      
      return rawOrders.map((json) => _parseOrderFromJson(json)).toList();
    } on ApiException catch (e) {
      throw OrderRepositoryException(
        'Error al obtener pedidos: ${e.message}',
        originalError: e,
      );
    } on NetworkException catch (e) {
      throw OrderRepositoryException(
        'Error de red al obtener pedidos: ${e.message}',
        originalError: e,
      );
    } on UnauthorizedException catch (e) {
      throw OrderRepositoryException(
        'No autorizado para obtener pedidos: ${e.message}',
        originalError: e,
      );
    } on NotFoundException catch (e) {
      throw OrderRepositoryException(
        'Recurso de pedidos no encontrado: ${e.message}',
        originalError: e,
      );
    } catch (e) {
      throw OrderRepositoryException(
        'Error inesperado al obtener pedidos: $e',
        originalError: e,
      );
    }
  }

  Order _parseOrderFromJson(Map<String, dynamic> json) {
    final itemsList = json['items'] as List<dynamic>? ?? [];
    final orderItems = itemsList.map((itemJson) {
      return OrderItem.fromJson(itemJson as Map<String, dynamic>);
    }).toList();

    return Order(
      id: json['id'] as String? ?? '',
      userId: json['userId'] as String? ?? json['user_id'] as String? ?? '',
      items: orderItems,
      totalAmount: _parseDouble(json['totalAmount'] ?? json['total_amount']),
      status: json['status'] as String? ?? 'pending',
      createdAt: _parseDateTime(json['createdAt'] ?? json['created_at']),
      updatedAt: _parseOptionalDateTime(json['updatedAt'] ?? json['updated_at']),
    );
  }

  double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  DateTime _parseDateTime(dynamic value) {
    if (value == null) return DateTime.now();
    if (value is DateTime) return value;
    if (value is String) {
      return DateTime.tryParse(value) ?? DateTime.now();
    }
    return DateTime.now();
  }

  DateTime? _parseOptionalDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) {
      return DateTime.tryParse(value);
    }
    return null;
  }

  void dispose() {
    _apiClient.close();
    _httpClient.close();
  }
}

class OrderRepositoryException implements Exception {
  final String message;
  final Object? originalError;
  
  OrderRepositoryException(this.message, {this.originalError});
  
  @override
  String toString() => 'OrderRepositoryException: $message';
}

// === ARCHIVO: client/lib/presentation/screens/orders_screen.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_client/core/network/api_client.dart';
import 'package:mobile_client/data/repositories/order_repository_impl.dart';
import 'package:mobile_client/domain/entities/order.dart';
import 'package:mobile_client/domain/usecases/get_orders.dart';
import 'package:mobile_client/presentation/widgets/order_card.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  final apiUrl = const String.fromEnvironment(
    'API_URL',
    defaultValue: 'http://localhost:8080',
  );
  return ApiClient(
    baseUrl: apiUrl,
  );
});

final httpClientProvider = Provider<http.Client>((ref) {
  final client = http.Client();
  ref.onDispose(() => client.close());
  return client;
});

final orderRepositoryProvider = Provider<OrderRepositoryImpl>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final httpClient = ref.watch(httpClientProvider);
  return OrderRepositoryImpl(
    apiClient: apiClient,
    httpClient: httpClient,
  );
});

final getOrdersUseCaseProvider = Provider<GetOrders>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return GetOrders(repository);
});

final ordersProvider = FutureProvider<List<Order>>((ref) async {
  final getOrders = ref.watch(getOrdersUseCaseProvider);
  return getOrders();
});

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsync = ref.watch(ordersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Pedidos'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(ordersProvider),
            tooltip: 'Actualizar pedidos',
          ),
        ],
      ),
      body: ordersAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => _buildErrorView(context, ref, error),
        data: (orders) => orders.isEmpty
            ? _buildEmptyView(context)
            : _buildOrdersList(context, orders),
      ),
    );
  }

  Widget _buildErrorView(BuildContext context, WidgetRef ref, Object error) {
    final errorMessage = error.toString();
    final isNetworkError = errorMessage.contains('NetworkException') ||
        errorMessage.contains('SocketException');
    final isUnauthorized = errorMessage.contains('UnauthorizedException');
    final isNotFound = errorMessage.contains('NotFoundException');

    String title;
    String message;
    IconData icon;

    if (isNetworkError) {
      title = 'Sin conexión';
      message = 'No se pudo conectar al servidor. Verifica tu conexión a internet.';
      icon = Icons.wifi_off;
    } else if (isUnauthorized) {
      title = 'Sesión expirada';
      message = 'Por favor, inicia sesión nuevamente.';
      icon = Icons.lock_outline;
    } else if (isNotFound) {
      title = 'Recurso no encontrado';
      message = 'El servidor no pudo encontrar los pedidos solicitados.';
      icon = Icons.search_off;
    } else {
      title = 'Error inesperado';
      message = 'Ocurrió un problema al cargar los pedidos. Intenta de nuevo.';
      icon = Icons.error_outline;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Theme.of(context).colorScheme.error),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => ref.invalidate(ordersProvider),
              icon: const Icon(Icons.refresh),
              label: const Text('Reintentar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No tienes pedidos aún',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Cuando realices un pedido, aparecerá aquí.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersList(BuildContext context, List<Order> orders) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return OrderCard(order: order);
      },
    );
  }
}

// === ARCHIVO: client/lib/presentation/widgets/order_card.dart ===
import 'package:flutter/material.dart';
import 'package:mobile_client/domain/entities/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => _showOrderDetails(context),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const Divider(height: 24),
              _buildItemsSummary(context),
              const SizedBox(height: 12),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pedido #${order.id}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                _formatDate(order.createdAt),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
        _buildStatusChip(context),
      ],
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    final statusConfig = _getStatusConfig(order.status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: statusConfig.color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(statusConfig.icon, size: 16, color: statusConfig.color),
          const SizedBox(width: 4),
          Text(
            statusConfig.label,
            style: TextStyle(
              color: statusConfig.color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsSummary(BuildContext context) {
    final itemCount = order.items.length;
    final totalItems = order.items.fold<int>(0, (sum, item) => sum + item.quantity);

    return Row(
      children: [
        Icon(
          Icons.inventory_2_outlined,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            itemCount == 1
                ? '1 producto'
                : '$itemCount productos ($totalItems unidades)',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total:',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        Text(
          '\$${order.totalAmount.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }

  void _showOrderDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => _OrderDetailsSheet(
          order: order,
          scrollController: scrollController,
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
      'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year} a las ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  _StatusConfig _getStatusConfig(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return _StatusConfig('Pendiente', Icons.schedule, Colors.orange);
      case 'processing':
        return _StatusConfig('Procesando', Icons.autorenew, Colors.blue);
      case 'shipped':
        return _StatusConfig('Enviado', Icons.local_shipping, Colors.purple);
      case 'delivered':
        return _StatusConfig('Entregado', Icons.check_circle, Colors.green);
      case 'cancelled':
        return _StatusConfig('Cancelado', Icons.cancel, Colors.red);
      default:
        return _StatusConfig(status, Icons.help_outline, Colors.grey);
    }
  }
}

class _StatusConfig {
  final String label;
  final IconData icon;
  final Color color;

  _StatusConfig(this.label, this.icon, this.color);
}

class _OrderDetailsSheet extends StatelessWidget {
  final Order order;
  final ScrollController scrollController;

  const _OrderDetailsSheet({
    required this.order,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Detalles del Pedido #${order.id}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              children: [
                _buildSectionTitle(context, 'Información General'),
                _buildInfoRow(context, 'ID', order.id),
                _buildInfoRow(context, 'Usuario', order.userId),
                _buildInfoRow(context, 'Estado', order.status.toUpperCase()),
                _buildInfoRow(context, 'Fecha de creación', _formatDate(order.createdAt)),
                if (order.updatedAt != null)
                  _buildInfoRow(context, 'Última actualización', _formatDate(order.updatedAt!)),
                const SizedBox(height: 24),
                _buildSectionTitle(context, 'Productos'),
                ...order.items.map((item) => _buildItemTile(context, item)),
                const SizedBox(height: 24),
                _buildSectionTitle(context, 'Resumen'),
                _buildTotalRow(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemTile(BuildContext context, OrderItem item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.shopping_bag,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productName,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Cantidad: ${item.quantity} x \$${item.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
            Text(
              '\$${(item.quantity * item.price).toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalRow(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total del pedido',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            '\$${order.totalAmount.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
      'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
    ];
    return '${date.day} de ${months[date.month - 1]} de ${date.year} a las ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}

// === ARCHIVO: client/README.md ===
# Mobile Client - App de Pedidos

Aplicación móvil Flutter para la gestión de pedidos. Permite a los usuarios visualizar sus pedidos realizados, ver detalles y mantener actualizada la información.

## Requisitos Previos

- Flutter SDK 3.27 o superior
- Dart SDK 3.6 o superior
- Android SDK configurado (para Android)
- Xcode (para iOS)

## Instalación

1. Clona el repositorio:
   ```bash
   git clone <repositorio>
   cd mobile_client
   ```

2. Instala las dependencias:
   ```bash
   flutter pub get
   ```

3. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

## Estructura del Proyecto

```
lib/
├── core/
│   └── network/          # Cliente HTTP y manejo de errores
├── data/
│   └── repositories/     # Implementaciones de repositorios
├── domain/
│   ├── entities/         # Modelos del dominio
│   ├── repositories/     # Contratos de repositorios
│   └── usecases/         # Casos de uso
└── presentation/
    ├── screens/          # Pantallas de la app
    └── widgets/          # Widgets reutilizables
```

## Arquitectura

La aplicación sigue **Clean Architecture** con separación en tres capas:

- **Presentation**: Widgets, pantallas y gestión de estado (Riverpod)
- **Domain**: Entidades, repositorios abstractos y casos de uso
- **Data**: Implementaciones de repositorios y cliente de API

## Dependencias Principales

- `flutter_riverpod`: Gestión de estado reactiva
- `http`: Cliente HTTP para consumo de APIs
- `mockito`: Generación de mocks para pruebas

## Configuración de Red

El cliente API está configurado para conectarse a `http://${module.compute.api_url}`. Para desarrollo local, asegúrate de que el servidor backend esté ejecutándose y sea accesible.

## Funcionalidades

- Visualización de lista de pedidos
- Detalles de cada pedido con productos incluidos
- Estados de pedido (Pendiente, Procesando, Enviado, Entregado, Cancelado)
- Actualización de datos con pull-to-refresh
- Manejo de errores de red y autenticación

## Build

### Debug APK
```bash
flutter build apk --debug
```

### Release APK
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios
```

## Pruebas

Ejecuta las pruebas unitarias:
```bash
flutter test
```

Genera mocks:
```bash
dart run build_runner build
```

// === ARCHIVO: client/lib/main.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'core/network/api_client.dart';
import 'data/repositories/order_repository_impl.dart';
import 'domain/usecases/get_orders.dart';
import 'presentation/screens/orders_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: OrdersApp(),
    ),
  );
}

class OrdersApp extends StatelessWidget {
  const OrdersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedidos App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const OrdersScreen(),
    );
  }
}

final httpClientProvider = Provider<http.Client>((ref) {
  final client = http.Client();
  ref.onDispose(() => client.close());
  return client;
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final apiUrl = const String.fromEnvironment(
    'API_URL',
    defaultValue: 'http://localhost:8080',
  );
  return ApiClient(
    baseUrl: apiUrl,
  );
});

final orderRepositoryProvider = Provider<OrderRepositoryImpl>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final httpClient = ref.watch(httpClientProvider);
  return OrderRepositoryImpl(
    apiClient: apiClient,
    httpClient: httpClient,
  );
});

final getOrdersUseCaseProvider = Provider<GetOrders>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return GetOrders(repository);
});
```
