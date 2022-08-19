import 'package:project/freight_calculator.dart';
import 'package:project/item.dart';

class FixedFreightCalculator implements FreightCalculator {
  @override
  double calculate(Item item) {
    return 10;
  }
}
