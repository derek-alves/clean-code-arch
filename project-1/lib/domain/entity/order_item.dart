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
}
