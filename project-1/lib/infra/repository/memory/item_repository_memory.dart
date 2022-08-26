import 'package:collection/collection.dart';

import 'package:project/domain/entity/item.dart';
import 'package:project/domain/repository/item_repository.dart';

class ItemRepositoryMemory implements ItemRepository {
  late final List<Item> items;
  ItemRepositoryMemory() {
    items = [
      Item(id: 1, category: 'Musica', description: "CD", price: 30),
      Item(id: 2, category: 'Video', description: "DVD", price: 50),
      Item(id: 3, category: 'Video', description: "VHS", price: 10),
    ];
  }
  @override
  Future<Item?> findById(int id) async {
    return Future.value(items.firstWhereOrNull((item) => item.id == id));
  }
}
