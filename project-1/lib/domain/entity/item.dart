class Item {
  final int id;
  final String category;
  final String description;
  final double price;
  final double width;
  final double height;
  final double depth;
  final double weight;

  Item({
    required this.id,
    required this.category,
    required this.description,
    required this.price,
    this.width = 0,
    this.height = 0,
    this.depth = 0,
    this.weight = 0,
  });

  double getVolume() => (width / 100) * (height / 100) * (depth / 100);
  double getDensity() => weight / getVolume();
}
