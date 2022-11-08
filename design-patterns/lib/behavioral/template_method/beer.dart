import 'package:design_patterns/behavioral/template_method/tax_item.dart';

class Beer extends TaxItem {
  Beer(String description, num price) : super('Beer', description, price);

  @override
  num getTaxes() {
    return (price * 10) / 100;
  }
}
