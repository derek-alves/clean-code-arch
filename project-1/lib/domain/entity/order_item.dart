class OrderItem {
  final int idItem;
  final double price;
  final int quantity;

  OrderItem({
    required this.idItem,
    required this.price,
    required this.quantity,
  });

  double get totalPrice => price * quantity;
}
