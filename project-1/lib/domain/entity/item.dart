class Item {
  final int id;
  final String category;
  final String description;
  final double price;
  final double width;
  final double height;
  final double length;
  final double weight;

  Item({
    required this.id,
    required this.category,
    required this.description,
    required this.price,
    this.width = 0,
    this.height = 0,
    this.length = 0,
    this.weight = 0,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      category: map['category'],
      description: map['description'],
      price: map['price'],
      length: map['length'],
      height: map['height'],
      weight: map['weight'],
      width: map['width'],
    );
  }

  double getVolume() => (width / 100) * (height / 100) * (length / 100);
  double getDensity() => weight / getVolume();
}
