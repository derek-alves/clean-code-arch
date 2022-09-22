import 'package:design_patterns/creational/abstract_factory/button.dart';

class DarkButton implements Button {
  @override
  late final String color;
  @override
  late final String backgroundColor;
  DarkButton() {
    color = "white";
    backgroundColor = "black";
  }
}
