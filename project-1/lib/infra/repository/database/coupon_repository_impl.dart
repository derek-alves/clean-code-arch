import 'package:project/domain/entity/coupon.dart';
import 'package:project/domain/repository/coupon_repository.dart';
import 'package:project/infra/database/connection.dart';

class CouponRepositoryImpl implements CouponRepository {
  final Connection dbConnection;

  CouponRepositoryImpl(this.dbConnection);
  @override
  Future<Coupon?> findByCode(String code) async {
    final result = await dbConnection.query(
      "select * from market.coupon WHERE code = ?",
      [code],
    );

    return result.isEmpty ? null : Coupon.fromMap(result.first.fields);
  }
}
