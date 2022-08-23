import 'package:project/domain/entity/cpf.dart';
import 'package:test/test.dart';

void main() {
  test("Deve validar o cpf A", () {
    expect(() => Cpf('457.046.588-90'), returnsNormally);
  });

  test("Deve validar o cpf B", () {
    expect(() => Cpf('357.188.378-05'), returnsNormally);
  });

  test("Deve validar o cpf C", () {
    expect(() => Cpf('987.654.321-00'), returnsNormally);
  });

  test("Não deve validar o cpf (todos os numeros iguais)", () {
    expect(() => Cpf('111.111.111-11'), throwsException);
  });

  test("Não deve validar o cpf (numero aleatorio)", () {
    expect(() => Cpf('123.456.789-00'), throwsException);
  });

  test("Não deve validar o cpf (numero alem do limite)", () {
    expect(() => Cpf('123.456.789-000000'), throwsException);
  });

  test("Não deve validar o cpf (numero abaixo do limite)", () {
    expect(() => Cpf('123456789'), throwsException);
  });

  test("Não deve validar o cpf (com letras)", () {
    expect(() => Cpf('123a456b789c00'), throwsException);
  });
}
