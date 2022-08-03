class ExampleOneAfter {
  static double calc(int distance, DateTime date) {
    final isOverNight = date.hour >= 22; //overnight
    final isSunday = date.weekday == 7;

    if (isOverNight) return distance * 3.9;
    if (isSunday) return distance * 2.9;
    return distance * 2.10;
  }
}
