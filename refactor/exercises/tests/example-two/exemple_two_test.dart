import 'package:test/test.dart';
import '../../bin/example-two/example_two_after.dart';

void main() {
  test("Deve validar o cep ", () {
    bool isValid = ExampleTwoAfter.validate('935.411.347-80');
    expect(isValid, equals(true));
  });
}
