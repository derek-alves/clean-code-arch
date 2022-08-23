import 'freight_calculator.dart';
import 'item.dart';

class FixedFreightCalculator implements FreightCalculator {
  @override
  double calculate(Item item) {
    return 10;
  }
}
