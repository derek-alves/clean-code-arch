import 'package:project/application/usecase/place_order_output.dart';

import '../../domain/entity/order.dart';
import '../../domain/repository/coupon_repository.dart';
import '../../domain/repository/item_repository.dart';
import '../../domain/repository/order_repository.dart';
import 'place_order_input.dart';

class PlaceOrder {
  final ItemRepository itemRepository;
  final OrderRepository orderRepository;
  final CouponRepository couponRepository;

  PlaceOrder({
    required this.itemRepository,
    required this.orderRepository,
    required this.couponRepository,
  });

  Future<PlaceOrderOutput> execute(PlaceOrderInput input) async {
    final order = Order(cpf: input.cpf, date: input.date);
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
    return PlaceOrderOutput(order.total);
  }
}
