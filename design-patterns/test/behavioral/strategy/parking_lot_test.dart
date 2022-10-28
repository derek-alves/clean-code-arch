//Definir uma família de algoritmos, encapsular cada uma delas e torná-las INTERCAMBIAVEIS

import 'package:design_patterns/behavioral/strategy/parking_lot.dart';
import 'package:test/test.dart';

void main() {
  test('Deve criar um estacionamento vazio', () async {
    var parkinLot = ParkingLot(500);
    expect(parkinLot.getEmptySpaces, equals(500));
  });

  test('Deve entrar um carro', () async {
    var parkinLot = ParkingLot(500);
    parkinLot.checkin("AAA-9999", DateTime(2022, 01, 01, 10));
    expect(parkinLot.getEmptySpaces, equals(499));
  });
}
