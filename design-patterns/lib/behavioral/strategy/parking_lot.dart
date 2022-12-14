import 'package:collection/collection.dart';
import 'package:design_patterns/behavioral/strategy/price_calculator.dart';

class ParkingLot {
  final int capacity;
  final List<ParkedCar> _parkedCars = [];

  final PriceCalculator priceCalculator;
  ParkingLot(
    this.capacity, {
    required this.priceCalculator,
  });

  getEmptySpaces() {
    return capacity - _parkedCars.length;
  }

  checkin(String plate, DateTime date) {
    _parkedCars.add(ParkedCar(plate, date));
  }

  double checkout(String plate, DateTime date) {
    final parkedCar = _parkedCars.firstWhereOrNull((car) => car.plate == plate);
    if (parkedCar == null) {
      throw Exception("Car not found");
    }

    _parkedCars.removeWhere((parkendCar) => parkendCar.plate == plate);
    final parkedHours = date.difference(parkedCar.date).inHours;
    return priceCalculator.calculate(hours: parkedHours);
  }
}

class ParkedCar {
  final String plate;
  final DateTime date;

  ParkedCar(this.plate, this.date);
}
