import 'package:project/domain/factory/repository_factory.dart';
import 'package:project/infra/repository/repository.dart';

import '../../domain/repository/repository.dart';

class DatabaseRepositoryFactory implements RepositoryFactory {
  @override
  CouponRepository createCouponRepository() {
    return CouponRepositoryImpl(dbConnection);
  }

  @override
  ItemRepository createItemRepository() {
    return ItemRepositoryImpl(dbConnection);
  }

  @override
  OrderRepository createOrderRepository() {
    return OrderRepositoryImpl(connection);
  }
}
