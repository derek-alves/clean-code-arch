import 'package:project/application/usecase/place_order.dart';
import 'package:project/application/usecase/place_order_input.dart';
import 'package:project/infra/repository/memory/coupon_repository_memory.dart';
import 'package:project/infra/repository/memory/item_repository_memory.dart';
import 'package:project/infra/repository/memory/order_repository_memory.dart';
import 'package:test/test.dart';

void main() {
  test('Deve fazer um pedido', () async {
    final itemRepository = ItemRepositoryMemory();
    final orderRepository = OrderRepositoryMemory();
    final couponRepository = CouponRepositoryMemory();

    final placeOrder = PlaceOrder(
      couponRepository: couponRepository,
      itemRepository: itemRepository,
      orderRepository: orderRepository,
    );

    final inputMap = {
      'cpf': '457.046.588-90',
      'orderItems': [
        {"idItem": 1, "quantity": 1},
        {"idItem": 2, "quantity": 1},
        {"idItem": 3, "quantity": 3}
      ],
      'date': DateTime(2022, 08, 23),
      'coupon': "VALE20"
    };
    final input = PlaceOrderInput.fromMap(inputMap);

    final output = await placeOrder.execute(input);
    expect(output.total, equals(88));
  });

  test('Deve fazer um pedido com cálculo de frete', () async {
    final itemRepository = ItemRepositoryMemory();
    final orderRepository = OrderRepositoryMemory();
    final couponRepository = CouponRepositoryMemory();

    final placeOrder = PlaceOrder(
      couponRepository: couponRepository,
      itemRepository: itemRepository,
      orderRepository: orderRepository,
    );

    final inputMap = {
      'cpf': '457.046.588-90',
      'orderItems': [
        {"idItem": 4, "quantity": 1},
        {"idItem": 5, "quantity": 1},
        {"idItem": 6, "quantity": 3}
      ],
      'date': DateTime(2022, 08, 23),
    };
    final input = PlaceOrderInput.fromMap(inputMap);

    final output = await placeOrder.execute(input);
    expect(output.total, equals(6350));
  });
}
