import 'package:project/domain/factory/repository_factory.dart';

import '../../../domain/entity/order.dart';
import '../../../domain/repository/coupon_repository.dart';
import '../../../domain/repository/item_repository.dart';
import '../../../domain/repository/order_repository.dart';
import 'place_order_input.dart';
import 'place_order_output.dart';

class PlaceOrderUsecase {
  late final ItemRepository itemRepository;
  late final OrderRepository orderRepository;
  late final CouponRepository couponRepository;

  PlaceOrderUsecase(RepositoryFactory repositoryFactory) {
    itemRepository = repositoryFactory.createItemRepository();
    orderRepository = repositoryFactory.createOrderRepository();
    couponRepository = repositoryFactory.createCouponRepository();
  }

  Future<PlaceOrderOutput> call(PlaceOrderInput input) async {
    final sequency = await orderRepository.count() + 1;
    final order = Order(cpf: input.cpf, date: input.date, sequency: sequency);
    for (var orderItem in input.orderItems) {
      var item = await itemRepository.findById(orderItem.idItem);
      if (item == null) throw Exception("Item not found");
      order.addItem(item, quantity: orderItem.quantity);
    }
    if (input.coupon != null) {
      final coupon = await couponRepository.findByCode(input.coupon!);
      if (coupon != null) order.addCoupon(coupon);
    }
    await orderRepository.save(order);
    return PlaceOrderOutput(
      total: order.total,
      code: order.getCode(),
    );
  }
}
