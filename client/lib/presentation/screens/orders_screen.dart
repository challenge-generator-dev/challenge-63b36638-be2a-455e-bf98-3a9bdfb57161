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