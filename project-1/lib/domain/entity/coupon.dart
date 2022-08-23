class Coupon {
  final String code;
  final double percentage;
  DateTime? expiredDate;

  Coupon(this.code, this.percentage, [this.expiredDate]);
  bool isValid([DateTime? today]) {
    if (expiredDate == null) return true;
    return expiredDate!.millisecondsSinceEpoch >=
        (today?.millisecondsSinceEpoch ??
            DateTime.now().millisecondsSinceEpoch);
  }

  bool isExpired([DateTime? today]) {
    return !isValid(today);
  }

  double calculateDiscount(double total, [DateTime? date]) {
    if (isExpired(date)) return 0;
    return (total * percentage) / 100;
  }
}
