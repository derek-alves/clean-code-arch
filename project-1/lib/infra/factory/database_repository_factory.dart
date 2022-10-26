import 'package:project/domain/factory/repository_factory.dart';
import 'package:project/infra/database/database.dart';
import 'package:project/infra/repository/repository.dart';

import '../../domain/repository/repository.dart';

class DatabaseRepositoryFactory<T> implements RepositoryFactory {
  final Connection<T> connection;

  DatabaseRepositoryFactory(this.connection);
  @override
  CouponRepository createCouponRepository() {
    return CouponRepositoryImpl(connection);
  }

  @override
  ItemRepository createItemRepository() {
    return ItemRepositoryImpl(connection);
  }

  @override
  OrderRepository createOrderRepository() {
    return OrderRepositoryImpl(connection);
  }
}
