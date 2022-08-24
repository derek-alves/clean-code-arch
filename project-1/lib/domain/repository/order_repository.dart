import '../entity/order.dart';

abstract class OrderRepository {
  Future<void> save(Order order);
}
