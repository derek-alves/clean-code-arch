class OrderCode {
  late String value;

  OrderCode({required DateTime date, required int sequency}) {
    value = "${date.year}${sequency.toString().padLeft(8, "0")}";
  }
}
