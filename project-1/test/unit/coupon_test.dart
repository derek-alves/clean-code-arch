import 'package:project/domain/entity/coupon.dart';
import 'package:test/test.dart';

void main() {
  test("Deve criar um cupom de desconto válido", () {
    final coupon = Coupon("VALE20", 20, DateTime(2022, 8, 17));
    final today = DateTime(2022, 8, 1);
    final isValid = coupon.isValid(today);
    expect(isValid, isTrue);
  });

  test("Deve criar um cupom de desconto expirado", () {
    final coupon = Coupon("VALE20", 20, DateTime(2022, 8, 11));
    final today = DateTime(2022, 8, 13);
    final isExpired = coupon.isExpired(today);
    expect(isExpired, isTrue);
  });

  test("Deve criar um cupom de desconto e calcular o desconto", () {
    final coupon = Coupon("VALE20", 20);
    final discount = coupon.calculateDiscount(1000);
    expect(discount, equals(200));
  });
}
