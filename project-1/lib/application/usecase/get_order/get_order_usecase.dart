import 'package:project/domain/factory/repository_factory.dart';
import 'package:project/domain/repository/order_repository.dart';

import 'get_order_output.dart';

class GetOrderUsecase {
  final RepositoryFactory _repositoryFactory;
  late final OrderRepository _orderRepository;
  GetOrderUsecase(this._repositoryFactory) {
    _orderRepository = _repositoryFactory.createOrderRepository();
  }

  Future<GetOrderOutput> call(String code) async {
    final order = await _orderRepository.get(code);
    return GetOrderOutput(
      total: order.total,
      code: order.getCode(),
    );
  }
}
