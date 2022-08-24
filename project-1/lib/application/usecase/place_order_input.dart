class PlaceOrderInput {
  final String cpf;
  final List<OrderItemInput> orderItems;
  final DateTime date;
  final String? coupon;

  PlaceOrderInput({
    required this.cpf,
    required this.orderItems,
    required this.date,
    this.coupon,
  });

  factory PlaceOrderInput.fromMap(Map<String, dynamic> map) => PlaceOrderInput(
        cpf: map['cpf'],
        orderItems: (map['orderItems'] as List)
            .map((item) => OrderItemInput.fromMap(item))
            .toList(),
        date: map['date'],
        coupon: map['coupon'],
      );
}

class OrderItemInput {
  final int idItem;
  final int quantity;

  OrderItemInput(this.idItem, this.quantity);

  factory OrderItemInput.fromMap(Map<String, dynamic> map) => OrderItemInput(
        map["idItem"],
        map["quantity"],
      );
}
