import 'package:collection/collection.dart';

class ParkingLot {
  final int capacity;
  final List<ParkedCar> _parkedCars = [];
  ParkingLot(this.capacity);

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
    final diff = date.difference(parkedCar.date).inHours;

    return diff * 10;
  }
}

class ParkedCar {
  final String plate;
  final DateTime date;

  ParkedCar(this.plate, this.date);
}
