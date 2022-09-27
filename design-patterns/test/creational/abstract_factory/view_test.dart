import 'package:design_patterns/creational/abstract_factory/dark_widget_factory.dart';
import 'package:design_patterns/creational/abstract_factory/light_widget_factory.dart';
import 'package:design_patterns/creational/abstract_factory/view.dart';
import 'package:test/test.dart';

// Fornecer uma interface para criação de FAMILIA DE OBJETOS RELACIONADOS,
// sem especificar as suas classes concretas

void main() {
  test('Deve criar uma interface gráfica com tema claro ', () async {
    final view = View(LightWidgetFactory());
    expect(view.label.color, equals("black"));
    expect(view.button.color, equals("white"));
    expect(view.button.backgroundColor, equals("blue"));
  });

  test('Deve criar uma interface gráfica com tema escuro ', () async {
    final view = View(DarkWidgetFactory());
    expect(view.label.color, equals("white"));
    expect(view.button.color, equals("white"));
    expect(view.button.backgroundColor, equals("black"));
  });
}
