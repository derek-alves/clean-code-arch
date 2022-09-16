import 'package:project/domain/repository/repository.dart';
import 'package:project/infra/database/database.dart';
import 'package:project/infra/repository/database/repository.dart';
import 'package:test/test.dart';

void main() {
  late final Connection connection;
  late final CouponRepository couponRepository;

  setUp((() {
    connection = SqlConnectionAdapter();
    couponRepository = CouponRepositoryImpl(connection);
  }));
  test('Deve validar um cupon de desconto', () async {
    //Arrange

    //Act

    //Assert
  });
}
