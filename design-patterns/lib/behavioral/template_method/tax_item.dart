import 'package:design_patterns/behavioral/template_method/item.dart';

abstract class TaxItem extends Item {
  TaxItem(super.category, super.description, super.price);

  num caculateTax() {
    return (price * getTax()) / 100;
  }

  num getTax();
}
