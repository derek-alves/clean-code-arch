import 'package:collection/collection.dart';

import 'package:project/domain/entity/coupon.dart';
import 'package:project/domain/repository/coupon_repository.dart';

class CouponRepositoryMemory implements CouponRepository {
  final List<Coupon> coupons = [];

  CouponRepositoryMemory() {
    coupons.add(Coupon("VALE20", 20));
  }
  @override
  Future<Coupon?> findByCode(String code) async {
    return Future.value(
        coupons.firstWhereOrNull((coupon) => coupon.code == code));
  }
}
