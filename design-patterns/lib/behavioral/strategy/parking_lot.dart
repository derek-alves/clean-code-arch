class ParkingLot {
  final int capacity;
  final List<Map<String, dynamic>> _parkedCars = [];
  ParkingLot(this.capacity);

  getEmptySpaces() {
    return capacity - _parkedCars.length;
  }

  checkin(String plate, DateTime date) {
    _parkedCars.add({"plate": plate, "checkinData": date.toString()});
  }
}
