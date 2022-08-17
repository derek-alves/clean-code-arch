import 'package:mocktail/mocktail.dart';
import 'package:project/order.dart';
import 'package:test/test.dart';

void main() {
  test('Deve criar um pedido vazio com CPF válido', () async {
    const cpf = "839.435.452-10";
    final order = Order(cpf);
    int total = order.total;
    expect(total, equals(0));
  });

  test('Deve tentar criar um pedido vazio com CPF inválido', () async {
    const cpf = "111.111.111-10";
    when(() => Order(cpf)).thenThrow(Exception("Invalid cpf"));
  });
}
