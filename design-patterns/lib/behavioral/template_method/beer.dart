import 'package:design_patterns/behavioral/template_method/item.dart';

class Beer extends Item {
  Beer(String description, num price) : super('Beer', description, price);

  @override
  num getTaxes() {
    return (price * 10) / 100;
  }
}
