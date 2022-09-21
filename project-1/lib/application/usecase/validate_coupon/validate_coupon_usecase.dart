import 'package:project/domain/repository/repository.dart';

class ValidateCouponUsecase {
  final CouponRepository couponRepository;

  ValidateCouponUsecase(this.couponRepository);

  Future<bool> call(String code) async {
    final coupon = await couponRepository.findByCode(code);
    if (coupon == null) throw Exception("Invalid coupon");
    return coupon.isValid();
  }
}
