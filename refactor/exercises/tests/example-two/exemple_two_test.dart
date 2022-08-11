import 'package:test/test.dart';
import '../../bin/example-two/example_two_after.dart';

void main() {
  test("Deve validar o cpf A", () {
    bool isValid = ExampleTwoAfter.validate('457.046.588-90');
    expect(isValid, equals(true));
  });

  test("Deve validar o cpf B", () {
    bool isValid = ExampleTwoAfter.validate('357.188.378-05');
    expect(isValid, equals(true));
  });

  test("Deve validar o cpf C", () {
    bool isValid = ExampleTwoAfter.validate('987.654.321-00');
    expect(isValid, equals(true));
  });

  test("Não deve validar o cpf (todos os numeros iguais)", () {
    bool isValid = ExampleTwoAfter.validate('111.111.111-11');
    expect(isValid, equals(false));
  });

  test("Não deve validar o cpf (numero aleatorio)", () {
    bool isValid = ExampleTwoAfter.validate('123.456.789-00');
    expect(isValid, equals(false));
  });

  test("Não deve validar o cpf (numero alem do limite)", () {
    bool isValid = ExampleTwoAfter.validate('123.456.789-000000');
    expect(isValid, equals(false));
  });

  test("Não deve validar o cpf (numero abaixo do limite)", () {
    bool isValid = ExampleTwoAfter.validate('123456789');
    expect(isValid, equals(false));
  });

  test("Não deve validar o cpf (com letras)", () {
    bool isValid = ExampleTwoAfter.validate('123a456b789c00');
    expect(isValid, equals(false));
  });
}
