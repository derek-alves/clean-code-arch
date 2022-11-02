import 'package:design_patterns/behavioral/template_method/item.dart';

class Whisky extends Item {
  Whisky(super.category, super.description, super.price);

  @override
  num getTaxes() {
    return (price * 20) / 100;
  }
}
