import 'package:design_patterns/behavioral/template_method/invoice.dart';
import 'package:design_patterns/behavioral/template_method/item.dart';
import 'package:test/test.dart';

void main() {
  test('Deve criar uma nota fiscal', () async {
    final invoice = Invoice();
    invoice.addItem(Item("Beer", "Heineken", 10));
    invoice.addItem(Item("Whisky", "Jack Daniels", 20));
    invoice.addItem(Item("Water", "Santa Catarina", 0));

    final taxes = invoice.getTaxes();
    expect(taxes, equals(21));
  });
}
