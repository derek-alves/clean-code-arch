import 'package:test/test.dart';
import '../../bin/example-one/example_one_after.dart';

void main() {
  test('Deve calcular o valor de uma corrida de taxi em dias normais', () {
    //given (dado quem, cenario)
    const int distance = 1000;
    var date = DateTime(2021, 7, 10, 10);

    //when (quando algo acontecer)
    final price = ExampleOneAfter.calc(distance, date);

    //then (entao algo deve ser verificado)
    expect(price, equals(2100.0));
  });

  test('Deve calcular o valor de uma corrida de taxi nos domingos', () {
    const int distance = 1000;
    var date = DateTime(2021, 7, 11, 10);

    final price = ExampleOneAfter.calc(distance, date);
    expect(price, equals(2900.0));
  });

  test('Deve calcular o valor de uma corrida de taxi de noite', () {
    const int distance = 1000;
    var date = DateTime(2021, 7, 11, 23);

    final price = ExampleOneAfter.calc(distance, date);
    expect(price, equals(3900.0));
  });
}
