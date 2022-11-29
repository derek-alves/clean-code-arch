class OrderItem {
  final int? id;
  final int idItem;
  final double price;
  final int quantity;

  OrderItem({
    this.id,
    required this.idItem,
    required this.price,
    required this.quantity,
  });

  double get totalPrice => price * quantity;

  factory OrderItem.fromMap(Map<String, dynamic> map) => OrderItem(
        price: map["price"],
        quantity: map["quantity"],
        id: map["id"],
        idItem: map["id_item"],
      );
}
