import 'package:project/domain/factory/repository_factory.dart';
import 'package:project/domain/repository/order_repository.dart';

import 'get_all_orders_output.dart';

class GetAllOrdersUsecase {
  final RepositoryFactory _repositoryFactory;
  late final OrderRepository _orderRepository;
  GetAllOrdersUsecase(this._repositoryFactory) {
    _orderRepository = _repositoryFactory.createOrderRepository();
  }

  Future<GetAllOrdersOutput> call() async {
    final orders = await _orderRepository.getAll();
    return GetAllOrdersOutput(orders: orders);
  }
}
