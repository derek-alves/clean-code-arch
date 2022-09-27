import 'button.dart';

class LightButton implements Button {
  @override
  late final String color;
  @override
  late final String backgroundColor;
  LightButton() {
    color = "white";
    backgroundColor = "blue";
  }
}
