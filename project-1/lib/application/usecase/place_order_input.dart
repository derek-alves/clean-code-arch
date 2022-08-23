class PlaceOrderInput {
  final String cpf;
  final List<OrderItemInput> orderItems;
  final DateTime date;

  PlaceOrderInput({
    required this.cpf,
    required this.orderItems,
    required this.date,
  });
}

class OrderItemInput {
  final int idItem;
  final int quantity;

  OrderItemInput(this.idItem, this.quantity);
}
