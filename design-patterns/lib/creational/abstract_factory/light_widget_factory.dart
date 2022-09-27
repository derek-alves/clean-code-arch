import 'package:design_patterns/creational/abstract_factory/label/label.dart';
import 'package:design_patterns/creational/abstract_factory/button/button.dart';
import 'package:design_patterns/creational/abstract_factory/button/light_button.dart';
import 'package:design_patterns/creational/abstract_factory/label/light_label.dart';
import 'package:design_patterns/creational/abstract_factory/widget_factory.dart';

class LightWidgetFactory implements WidgetFactory {
  @override
  Button createButton() => LightButton();

  @override
  Label createLabel() => LightLabel();
}
