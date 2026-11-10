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