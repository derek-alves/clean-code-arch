import 'package:project/application/usecase/simulate_freight/simulate_freight.dart';
import 'package:project/domain/entity/default_freight_calculator.dart';
import 'package:project/domain/entity/freight_calculator.dart';
import 'package:project/domain/repository/item_repository.dart';
import 'package:project/infra/database/connection.dart';
import 'package:project/infra/database/sql_connection_adapter.dart';
import 'package:project/infra/repository/database/item_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late final Connection connection;
  late final ItemRepository itemRepository;
  late final FreightCalculator freightCalculator;

  setUpAll((() {
    freightCalculator = DefaultFreightCalculator();
    connection = SqlConnectionAdapter();
    itemRepository = ItemRepositoryImpl(connection);
  }));
  test("Deve simular o frete dos itens", () async {
    final simulateFreight = SimulateFreightUsecase(
      itemRepository: itemRepository,
      freightCalculator: freightCalculator,
    );

    final input = SimulateFreightInput([
      {"idItem": 4, "quantity": 1},
      {"idItem": 5, "quantity": 1},
      {"idItem": 6, "quantity": 3}
    ]);

    final output = await simulateFreight(input);
    expect(output.amount, equals(260));
  });

  test("Deve retornar um erro caso não encontre um produto", () async {
    final simulateFreight = SimulateFreightUsecase(
      itemRepository: itemRepository,
      freightCalculator: freightCalculator,
    );

    final input = SimulateFreightInput([
      {"idItem": 1000000, "quantity": 1},
      {"idItem": 5, "quantity": 1},
      {"idItem": 6, "quantity": 3}
    ]);
    expect(() async => await simulateFreight(input), throwsException);
  });
}
