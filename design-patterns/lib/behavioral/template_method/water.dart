import 'package:design_patterns/behavioral/template_method/item.dart';

class Water extends Item {
  Water(super.category, super.description, super.price);

  @override
  num getTaxes() {
    return (price * 0) / 100;
  }
}
