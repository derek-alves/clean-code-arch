import 'package:project/domain/entity/order.dart';
import 'package:project/domain/repository/order_repository.dart';
import 'package:project/infra/database/connection.dart';

class OrderRepositoryMemory implements OrderRepository {
  final Connection connection;
  final List<Order> _orders = [];

  OrderRepositoryMemory(this.connection);

  @override
  Future<void> save(Order order) async {
    await connection.query(
        "insert into market.order (code,cpf,issue_date, freight, sequence, coupon) values (?,?,?,?,?,?)",
        [
          order.getCode(),
          order.cpf?.value,
          order.date,
          order.getFreight(),
          order.sequency,
          order.coupon,
        ]);
    return Future.value();
  }

  @override
  Future<int> count() {
    return Future.value(_orders.length);
  }
}
