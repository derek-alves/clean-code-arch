import 'package:design_patterns/creational/abstract_factory/label/label.dart';
import 'package:design_patterns/creational/abstract_factory/button/button.dart';
import 'package:design_patterns/creational/abstract_factory/button/dark_button.dart';
import 'package:design_patterns/creational/abstract_factory/label/dark_label.dart';
import 'package:design_patterns/creational/abstract_factory/widget_factory.dart';

class DarkWidgetFactory implements WidgetFactory {
  @override
  Button createButton() => DarkButton();

  @override
  Label createLabel() => DarkLabel();
}
