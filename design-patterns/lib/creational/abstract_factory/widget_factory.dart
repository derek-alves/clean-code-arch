import 'package:design_patterns/creational/abstract_factory/button/button.dart';
import 'package:design_patterns/creational/abstract_factory/label/label.dart';

abstract class WidgetFactory {
  Label createLabel();
  Button createButton();
}
