import 'tax_item.dart';

class Whisky extends TaxItem {
  Whisky(String description, num price) : super('Whisky', description, price);

  @override
  num getTax() {
    return 20;
  }
}
