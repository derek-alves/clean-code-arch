import 'package:design_patterns/creational/abstract_factory/label.dart';

class DarkLabel implements Label {
  @override
  late String color;

  DarkLabel() {
    color = "white";
  }
}
