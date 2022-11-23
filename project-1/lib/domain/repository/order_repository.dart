import '../entity/order.dart';

abstract class OrderRepository {
  Future<void> save(Order order);
  Future<int> count();
  Future<Order> get(String code);
}
