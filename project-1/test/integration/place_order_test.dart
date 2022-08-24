import 'package:project/application/usecase/place_order.dart';
import 'package:project/application/usecase/place_order_input.dart';
import 'package:test/test.dart';

void main() {
  test('Deve fazer um pedido', () async {
    final placeOrder = PlaceOrder();
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
    expect(output.total, equals(1000));
  });
}
