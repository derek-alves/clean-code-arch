abstract class Item {
  final String category;
  final String description;
  final num price;

  Item(this.category, this.description, this.price);

  num getTaxes();
}
