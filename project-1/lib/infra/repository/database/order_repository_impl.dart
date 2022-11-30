import 'package:project/domain/entity/order.dart';
import 'package:project/domain/entity/order_item.dart';
import 'package:project/domain/repository/order_repository.dart';
import 'package:project/infra/database/connection.dart';

import '../../../domain/entity/coupon.dart';
import '../../../domain/entity/item.dart';

class OrderRepositoryImpl implements OrderRepository {
  final Connection connection;

  OrderRepositoryImpl(this.connection);

  @override
  Future<void> save(Order order) async {
    final orderData = await connection.query(
        "insert into market.order (code,cpf,issue_date, freight, sequence, coupon) values (?,?,?,?,?,?)",
        [
          order.getCode(),
          order.getCPF(),
          order.date,
          order.getFreight(),
          order.sequency,
          order.coupon?.code,
        ]);

    for (OrderItem orderItem in order.getOrdemItemList()) {
      await connection.query(
          "insert into market.order_item (id_item,id_order,quantity, price) values (?,?,?,?)",
          [
            orderItem.idItem,
            orderData.insertId,
            orderItem.quantity,
            orderItem.price,
          ]);
    }
  }

  @override
  Future<int> count() async {
    final result = await connection.query("SELECT COUNT(*) FROM market.order");
    return result.first.fields.values.first ?? 0;
  }

  @override
  Future<Order> get(String code) async {
    final result = await connection
        .query("SELECT * FROM market.order where code = ?", [code]);
    if (result.affectedRows == 0) throw Exception("Order not found");

    final orderData = Order.fromMap(result.first.fields);
    final orderItemData = await connection.query(
        "SELECT * FROM market.order_item where id_order = ?", [orderData.id]);
    for (var item in orderItemData) {
      var orderItem = OrderItem.fromMap(item.fields);
      final itemResult = await connection
          .query("SELECT * FROM market.item where id = ?", [orderItem.idItem]);
      var itemData = Item.fromMap(itemResult.first.fields);

      orderData.addItem(itemData, quantity: orderItem.quantity);
    }

    if (orderData.coupon != null) {
      final couponResult = await connection.query(
          "SELECT * FROM market.coupon where code = ?",
          [orderData.coupon!.code]);

      var couponData = Coupon.fromMap(couponResult.first.fields);
      orderData.addCoupon(couponData);
    }

    return orderData;
  }
}
