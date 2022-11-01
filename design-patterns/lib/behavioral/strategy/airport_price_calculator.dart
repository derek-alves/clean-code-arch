import 'package:design_patterns/behavioral/strategy/price_calculator.dart';

class AirportPriceCalculator implements PriceCalculator {
  @override
  double calculate({required int hours}) {
    double price = 20.0;
    int minHours = 3;
    int remainingHours = hours - minHours;
    if (remainingHours <= 0) return price;
    price += remainingHours * 10;
    return price;
  }
}
