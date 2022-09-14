import 'package:project/domain/entity/freight_calculator.dart';
import 'package:project/domain/repository/item_repository.dart';

import 'simulate_freight_input.dart';
import 'simulate_freight_output.dart';

class SimulateFreightUsecase {
  final ItemRepository itemRepository;
  final FreightCalculator freightCalculator;

  SimulateFreightUsecase({
    required this.itemRepository,
    required this.freightCalculator,
  });

  Future<SimulateFreightOutput> call(SimulateFreightInput input) async {
    double amount = 0.0;
    for (var inputItem in input.items) {
      final item = await itemRepository.findById(inputItem.idItem);
      if (item == null) {
        throw Exception("Item not found");
      }
      amount += freightCalculator.calculate(item) * inputItem.quantity;
    }
    return SimulateFreightOutput(amount: amount);
  }
}
