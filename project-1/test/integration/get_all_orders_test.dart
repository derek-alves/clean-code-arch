import 'package:mysql1/mysql1.dart';
import 'package:project/application/usecase/get_all_orders/get_all_orders_usecase.dart';
import 'package:project/application/usecase/get_order/get_order_usecase.dart';
import 'package:project/application/usecase/place_order/place_order.dart';
import 'package:project/infra/factory/database_repository_abstract_factory.dart';
import 'package:test/test.dart';

import 'package:project/infra/database/connection.dart';
import 'package:project/infra/database/sql_connection_adapter.dart';

void main() {
  late final Connection<MySqlConnection> connection;

  late final GetAllOrdersUsecase getAllOrders;
  setUpAll(() {
    connection = SqlConnectionAdapter();
    final repositoryFactory =
        DatabaseRepositoryAbstractFactory<MySqlConnection>(connection);
    getAllOrders = GetAllOrdersUsecase(repositoryFactory);
  });
  test('Deve obter todos pedidos ', () async {
    final getOrdersOutput = await getAllOrders();
    expect(getOrdersOutput.orders, TypeMatcher<List>());
  });
}
