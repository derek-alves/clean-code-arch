import 'package:project/domain/entity/coupon.dart';

abstract class CouponRepository {
  Future<Coupon?> findByCode(String code);
}
