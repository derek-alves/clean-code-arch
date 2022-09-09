class Coupon {
  final String code;
  final double percentage;
  int? expiredDate;

  Coupon(this.code, this.percentage, [this.expiredDate]);

  factory Coupon.fromMap(Map<String, dynamic> map) {
    return Coupon(
      map['code'],
      map['percentage'],
      map['expire_date'],
    );
  }

  bool isValid([DateTime? today]) {
    if (expiredDate == null) return true;
    return expiredDate! >=
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
