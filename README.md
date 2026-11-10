# Despliegue de la API de la app de pedidos usando Terraform

El objetivo de este reto es aprovisionar la infraestructura necesaria para la API de la app de pedidos utilizando Terraform. La app de pedidos es una aplicación móvil que permite a los usuarios realizar y gestionar pedidos. Los recursos que deben ser aprovisionados incluyen servidores, bases de datos y servicios de almacenamiento. El dominio es el de una aplicación de pedidos en el sector de e-commerce.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo para el backend de una app movil |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Exploración del dominio y definición de recursos

**Objetivo:** Identificar los recursos necesarios para la API de la app de pedidos y definirlos en Terraform.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Enumera los recursos necesarios para la API de la app de pedidos.
- Define cada recurso en Terraform, especificando las propiedades y configuraciones necesarias.
- Identifica posibles restricciones y ambigüedades en la definición de recursos.

**Entregable:** Un archivo de Terraform que define los recursos necesarios para la API de la app de pedidos.

<details>
<summary>Pistas de conocimiento</summary>

- Considera la escalabilidad y la disponibilidad de los recursos.
- Piensa en cómo los recursos interactúan entre sí.

</details>

### Fase 2: Aprovisionamiento de recursos y validación

**Objetivo:** Aprovisionar los recursos definidos en Terraform y validar su correcto funcionamiento.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Ejecuta el script de Terraform para aprovisionar los recursos.
- Verifica que los recursos se han aprovisionado correctamente.
- Realiza pruebas para asegurar que los recursos funcionan como se espera.

**Entregable:** Un informe que documenta el proceso de aprovisionamiento y los resultados de las pruebas.

<details>
<summary>Pistas de conocimiento</summary>

- Utiliza Terraform para aprovisionar los recursos.
- Realiza pruebas exhaustivas para validar el funcionamiento de los recursos.

</details>

### Fase 3: Optimización y refactorización

**Objetivo:** Optimizar y refactorizar el código de Terraform para mejorar la eficiencia y la mantenibilidad.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Identifica áreas de mejora en el código de Terraform.
- Refactoriza el código para mejorar la eficiencia y la mantenibilidad.
- Documenta los cambios realizados y justifica las decisiones tomadas.

**Entregable:** Un archivo de Terraform refactorizado y un documento que explica los cambios realizados y las decisiones tomadas.

<details>
<summary>Pistas de conocimiento</summary>

- Considera la modularidad y la reutilización del código.
- Piensa en cómo mejorar la legibilidad y la mantenibilidad del código.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y para qué se utiliza en este contexto?
- **paraQueSirve**: ¿Para qué sirve aprovisionar la infraestructura con Terraform en el contexto de la app de pedidos?
- **comoSeUsa**: ¿Cómo se utiliza Terraform para definir y aprovisionar recursos en este reto?
- **erroresComunes**: ¿Qué errores comunes pueden ocurrir al aprovisionar la infraestructura con Terraform y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el proceso de optimización y refactorización del código de Terraform?

## Criterios de Evaluacion

- Identificación correcta de los recursos necesarios para la API de la app de pedidos.
- Definición adecuada de los recursos en Terraform.
- Aprovisionamiento exitoso de los recursos y verificación de su correcto funcionamiento.
- Optimización y refactorización efectiva del código de Terraform.
- Documentación clara y justificación de las decisiones tomadas durante el proceso.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

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

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd client && flutter pub get && flutter analyze)
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
