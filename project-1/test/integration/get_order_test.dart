import 'package:mysql1/mysql1.dart';
import 'package:project/application/usecase/get_order/get_order_usecase.dart';
import 'package:project/application/usecase/place_order/place_order.dart';
import 'package:project/infra/factory/database_repository_abstract_factory.dart';
import 'package:test/test.dart';

import 'package:project/infra/database/connection.dart';
import 'package:project/infra/database/sql_connection_adapter.dart';

void main() {
  late final Connection<MySqlConnection> connection;
  late final PlaceOrderUsecase placeOrder;
  late final GetOrderUsecase getOrder;
  setUpAll(() {
    connection = SqlConnectionAdapter();
    final repositoryFactory =
        DatabaseRepositoryAbstractFactory<MySqlConnection>(connection);
    placeOrder = PlaceOrderUsecase(repositoryFactory);
    getOrder = GetOrderUsecase(repositoryFactory);
  });
  test('Deve obter um pedido pelo código', () async {
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

    final placeOrderoutput = await placeOrder(input);
    final getOrderOutput = await getOrder(placeOrderoutput.code);
    expect(getOrderOutput.total, equals(138));
  });
}
