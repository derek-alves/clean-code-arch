import 'package:project/domain/factory/repository_factory.dart';
import 'package:project/infra/repository/database/order_repository_impl.dart';
import 'package:project/infra/repository/database/item_repository_impl.dart';
import 'package:project/infra/repository/database/coupon_repository_impl.dart';

class DatabaseRepositoryFactory implements RepositoryFactory {
  @override
  CouponRepositoryImpl createCouponRepository() {
    // TODO: implement createCouponRepository
    throw UnimplementedError();
  }

  @override
  ItemRepositoryImpl createItemRepository() {
    // TODO: implement createItemRepository
    throw UnimplementedError();
  }

  @override
  OrderRepositoryImpl createOrderRepository() {
    // TODO: implement createOrderRepository
    throw UnimplementedError();
  }
}
