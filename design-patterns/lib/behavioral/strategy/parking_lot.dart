import 'package:collection/collection.dart';
import 'package:design_patterns/behavioral/strategy/price_calculator.dart';

class ParkingLot {
  final int capacity;
  final List<ParkedCar> _parkedCars = [];
  final String location;
  final PriceCalculator priceCalculator;
  ParkingLot(
    this.capacity, {
    this.location = "shopping",
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
    final diff = date.difference(parkedCar.date).inHours;

    // if (location == "shopping") {
    //   return diff * 10;
    // }

    // if (location == "airport") {
    //   double price = 20.0;
    //   int remainingHours = diff - 3;
    //   if (remainingHours <= 0) return price;
    //   price += remainingHours * 10;
    //   return price;
    // }

    return priceCalculator.calculate(hours: diff);
  }
}

class ParkedCar {
  final String plate;
  final DateTime date;

  ParkedCar(this.plate, this.date);
}
