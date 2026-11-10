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