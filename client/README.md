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