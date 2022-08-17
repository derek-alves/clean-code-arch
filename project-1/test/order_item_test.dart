import 'package:project/order_item.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test("Dever criar um item do pedido", () {
    final orderItem = OrderItem(idItem: 1, price: 1000, quantity: 10);
    expect(orderItem.totalPrice, equals(10000));
  });
}
