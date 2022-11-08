import 'package:design_patterns/behavioral/template_method/item.dart';
import 'package:design_patterns/behavioral/template_method/tax_item.dart';

class Invoice {
  late final List<Item> _item;

  Invoice() {
    _item = [];
  }

  addItem(Item item) => _item.add(item);

  num getTaxes() {
    num taxes = 0;
    for (Item item in _item) {
      if (item is TaxItem) {
        taxes += item.getTaxes();
      }
    }

    return taxes;
  }
}
