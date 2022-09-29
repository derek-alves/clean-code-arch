import 'package:project/domain/factory/repository_factory.dart';

import '../../domain/repository/repository.dart';
import '../repository/repository.dart';

class MemoryRepositoryFactory implements RepositoryFactory {
  @override
  CouponRepository createCouponRepository() {
    return CouponRepositoryMemory();
  }

  @override
  ItemRepository createItemRepository() {
    return ItemRepositoryMemory();
  }

  @override
  OrderRepository createOrderRepository() {
    return OrderRepositoryMemory();
  }
}
