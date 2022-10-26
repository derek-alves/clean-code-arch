import 'package:mysql1/mysql1.dart';
import 'package:project/application/usecase/place_order/place_order.dart';
import 'package:project/infra/factory/database_repository_factory.dart';
import 'package:test/test.dart';

import 'package:project/infra/database/connection.dart';
import 'package:project/infra/database/sql_connection_adapter.dart';

void main() {
  late final Connection<MySqlConnection> connection;
  late final PlaceOrderUsecase placeOrder;
  setUpAll(() {
    connection = SqlConnectionAdapter();
    final repositoryFactory =
        DatabaseRepositoryFactory<MySqlConnection>(connection);
    placeOrder = PlaceOrderUsecase(repositoryFactory);
  });
  test('Deve fazer um pedido', () async {
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
    expect(output.total, equals(138));
  });

  test('Deve fazer um pedido com cálculo de frete', () async {
    final inputMap = {
      'cpf': '457.046.588-90',
      'orderItems': [
        {"idItem": 4, "quantity": 1},
        {"idItem": 5, "quantity": 1},
        {"idItem": 6, "quantity": 3}
      ],
      'date': DateTime(2022, 12, 21),
    };
    final input = PlaceOrderInput.fromMap(inputMap);

    final output = await placeOrder.execute(input);
    expect(output.total, equals(6350));
  });

  test('Deve fazer um pedido com código', () async {
    final inputMap = {
      'cpf': '457.046.588-90',
      'orderItems': [
        {"idItem": 4, "quantity": 1},
        {"idItem": 5, "quantity": 1},
        {"idItem": 6, "quantity": 3}
      ],
      'date': DateTime(2022, 12, 21),
    };
    final input = PlaceOrderInput.fromMap(inputMap);

    final output = await placeOrder.execute(input);
    expect(output.code, isA<String>());
  });
}
