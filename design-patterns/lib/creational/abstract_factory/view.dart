import 'package:design_patterns/creational/abstract_factory/widget_factory.dart';

import './button/button.dart';
import './label/label.dart';

class View {
  late final Label label;
  late final Button button;
  View(WidgetFactory widgetFactory) {
    label = widgetFactory.createLabel();
    button = widgetFactory.createButton();
  }
}
