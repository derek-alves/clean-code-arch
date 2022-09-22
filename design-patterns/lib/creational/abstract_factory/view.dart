import 'button.dart';
import 'dark_button.dart';
import 'label.dart';
import 'light_button.dart';

class View {
  late final Label label;
  late final Button button;
  View(String theme) {
    if (theme.toLowerCase() == 'dark') {
      label = Label();
      button = DarkButton();
    } else {
      label = Label();
      button = LightButton();
    }
  }
}
