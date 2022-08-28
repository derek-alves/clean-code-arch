import 'freight_calculator.dart';
import 'item.dart';

class DefaultFreightCalculator implements FreightCalculator {
  const DefaultFreightCalculator();
  @override
  double calculate(Item item) {
    final freight = (1000 * item.getVolume() * (item.getDensity() / 100));
    if (freight.isNaN) return 0;
    if (freight < 10) return 10;
    return freight;
  }
}
