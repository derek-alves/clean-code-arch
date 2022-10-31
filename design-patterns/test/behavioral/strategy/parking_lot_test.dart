//Definir uma família de algoritmos, encapsular cada uma delas e torná-las INTERCAMBIAVEIS

import 'package:design_patterns/behavioral/strategy/beach_price_calculator.dart';
import 'package:design_patterns/behavioral/strategy/parking_lot.dart';
import 'package:design_patterns/behavioral/strategy/shopping_price_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('Deve criar um estacionamento vazio', () async {
    var parkinLot = ParkingLot(
      500,
      location: "beach",
      priceCalculator: BeachPriceCalculator(),
    );
    expect(parkinLot.getEmptySpaces, equals(500));
  });

  test('Deve entrar um carro', () async {
    var parkinLot = ParkingLot(
      500,
      location: "beach",
      priceCalculator: BeachPriceCalculator(),
    );
    parkinLot.checkin("AAA-9999", DateTime(2022, 01, 01, 10));
    expect(parkinLot.getEmptySpaces, equals(499));
  });

  test(
      'Deve calcular o valor que deve ser pago na praia, 20 por tempo ilimitado',
      () async {
    var parkinLot = ParkingLot(
      500,
      location: "beach",
      priceCalculator: BeachPriceCalculator(),
    );

    parkinLot.checkin("AAA-9999", DateTime(2022, 01, 01, 10));
    final price = parkinLot.checkout("AAA-9999", DateTime(2022, 01, 01, 15));
    expect(price, equals(50));
  });
  test(
      'Deve calcular o valor que deve ser pago no shopping, 10 reais por hora, o carro permaneceu 2 horas',
      () async {
    var parkinLot = ParkingLot(
      500,
      location: "shopping",
      priceCalculator: ShoppingPriceCalculator(),
    );

    parkinLot.checkin("AAA-9999", DateTime(2022, 01, 01, 10));
    final price = parkinLot.checkout("AAA-9999", DateTime(2022, 01, 01, 12));
    expect(price, equals(20));
  });

  test(
      'Deve calcular o valor que deve ser pago no aeroporto, 3 horas por 20 reais e depois 10 reais por hora',
      () async {
    var parkinLot = ParkingLot(
      500,
      location: "beach",
      priceCalculator: BeachPriceCalculator(),
    );

    parkinLot.checkin("AAA-9999", DateTime(2022, 01, 01, 10));
    final price = parkinLot.checkout("AAA-9999", DateTime(2022, 01, 01, 15));
    expect(price, equals(40));
  });
}
