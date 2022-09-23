import 'package:design_patterns/creational/abstract_factory/button.dart';
import 'package:design_patterns/creational/abstract_factory/label.dart';

abstract class WidgetFactory {
  Label createLabel();
  Button createButton();
}
