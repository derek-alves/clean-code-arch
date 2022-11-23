import 'package:project/domain/factory/repository_factory.dart';
import 'package:project/infra/database/database.dart';
import 'package:project/infra/repository/repository.dart';

import '../../domain/repository/repository.dart';

class DatabaseRepositoryAbstractFactory<T> implements RepositoryFactory {
  final Connection<T> connection;

  DatabaseRepositoryAbstractFactory(this.connection);
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
