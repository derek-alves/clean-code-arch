import 'package:design_patterns/behavioral/strategy/price_calculator.dart';

class ShoppingPriceCalculator implements PriceCalculator {
  @override
  double calculate({required int hours}) {
    return hours * 10;
  }
}
