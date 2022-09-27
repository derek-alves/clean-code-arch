import 'button.dart';

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
