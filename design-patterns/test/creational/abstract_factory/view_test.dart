import 'dart:math';

import 'package:design_patterns/creational/abstract_factory/view.dart';
import 'package:test/test.dart';

// Fornecer uma interface para criação de FAMILIA DE OBJETOS RELACIONADOS,
// sem especificar as suas classes concretas

void main() {
  test('Deve criar uma interface gráfica ', () async {
    final view = View();
    expect(view.label.color, equals("black"));
    expect(view.button.color, equals("white"));
    expect(view.button.backgroundColor, equals("blue"));
  });
}
