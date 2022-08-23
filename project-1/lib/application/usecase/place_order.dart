import 'package:project/application/usecase/place_order_input.dart';
import 'package:project/application/usecase/place_order_output.dart';
import 'package:project/domain/entity/order.dart';

import '../../domain/repository/item_repository.dart';

class PlaceOrder {
  final ItemRepository itemRepository;

  PlaceOrder(this.itemRepository);

  Future<PlaceOrderOutput> execute(PlaceOrderInput input) async {
    final order = Order(cpf: input.cpf, date: input.date);
    for (var orderItem in input.orderItems) {
      var item = await itemRepository.findById(orderItem.idItem);
      if (item == null) throw Exception("Item not found");
      order.addItem(item, quantity: orderItem.quantity);
    }

    return PlaceOrderOutput(order.total);
  }
}
