import '../../infra/repository/repository.dart';

abstract class RepositoryFactory {
  ItemRepositoryImpl createItemRepository();
  CouponRepositoryImpl createCouponRepository();
  OrderRepositoryImpl createOrderRepository();
}
