import 'package:design_patterns/behavioral/strategy/price_calculator.dart';

class BeachPriceCalculator implements PriceCalculator {
  @override
  double calculate({required int hours}) {
    return 20;
  }
}
