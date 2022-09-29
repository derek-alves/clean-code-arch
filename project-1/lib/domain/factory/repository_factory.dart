import '../repository/repository.dart';

abstract class RepositoryFactory {
  ItemRepository createItemRepository();
  CouponRepository createCouponRepository();
  OrderRepository createOrderRepository();
}
