import 'package:collection/collection.dart';

import 'package:project/domain/entity/item.dart';
import 'package:project/domain/repository/item_repository.dart';
import 'package:project/infra/database/connection.dart';

class ItemRepositoryMemory implements ItemRepository {
  final Connection dbConnection;
  late final List<Item> items;
  ItemRepositoryMemory(this.dbConnection) {
    items = [
      Item(id: 1, category: 'Musica', description: "CD", price: 30),
      Item(id: 2, category: 'Video', description: "DVD", price: 50),
      Item(id: 3, category: 'Video', description: "VHS", price: 10),
      Item(
        id: 4,
        category: 'Instrumentos Musicais',
        description: "guitarra",
        price: 1000,
        width: 100,
        height: 30,
        depth: 10,
        weight: 3,
      ),
      Item(
        id: 5,
        category: 'Instrumentos Musicais',
        description: "Amplificador",
        price: 5000,
        width: 100,
        height: 50,
        depth: 50,
        weight: 20,
      ),
      Item(
        id: 6,
        category: 'Acessórios',
        description: "Cabo",
        price: 30,
        width: 10,
        height: 10,
        depth: 10,
        weight: 0.9,
      ),
    ];
  }
  @override
  Future<Item?> findById(int id) async {
    return Future.value(items.firstWhereOrNull((item) => item.id == id));
  }
}
