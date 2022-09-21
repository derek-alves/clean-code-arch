import 'package:project/application/usecase/validate_coupon/validate_coupon_usecase.dart';
import 'package:project/domain/repository/repository.dart';
import 'package:project/infra/database/database.dart';
import 'package:project/infra/repository/repository.dart';
import 'package:test/test.dart';

void main() {
  late final Connection connection;
  late final CouponRepository couponRepository;

  setUpAll((() {
    connection = SqlConnectionAdapter();
    couponRepository = CouponRepositoryImpl(connection);
  }));
  test('Deve validar um cupon de desconto', () async {
    final validateCoupon = ValidateCouponUsecase(couponRepository);
    final isValid = await validateCoupon("VALE20");
    expect(isValid, isTrue);
  });

  test('Deve retornar um erro caso o cupom seja invalido', () async {
    final validateCoupon = ValidateCouponUsecase(couponRepository);

    expect(
      () async => await validateCoupon("45f4a3s###dfsafd"),
      throwsException,
    );
  });
}
