import 'package:project/domain/entity/order.dart';
import 'package:project/domain/repository/order_repository.dart';

class OrderRepositoryMemory implements OrderRepository {
  final List<Order> _orders = [];

  @override
  Future<void> save(Order order) {
    _orders.add(order);
    return Future.value();
  }
}
