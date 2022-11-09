import 'package:design_patterns/behavioral/template_method/beer.dart';
import 'package:design_patterns/behavioral/template_method/invoice.dart';
import 'package:design_patterns/behavioral/template_method/water.dart';
import 'package:design_patterns/behavioral/template_method/whisky.dart';
import 'package:test/test.dart';

void main() {
  test('Deve criar uma nota fiscal', () async {
    final invoice = Invoice();
    invoice.addItem(Beer("Heineken", 10));
    invoice.addItem(Whisky("Jack Daniels", 20));
    invoice.addItem(Water("Santa Catarina", 0));

    final taxes = invoice.getTaxes();
    expect(taxes, equals(5));
  });
}
