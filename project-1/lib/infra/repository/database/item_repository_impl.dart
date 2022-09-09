import 'package:project/domain/entity/item.dart';
import 'package:project/domain/repository/item_repository.dart';
import 'package:project/infra/database/connection.dart';

class ItemRepositoryImpl implements ItemRepository {
  final Connection dbConnection;
  late final List<Item> items;
  ItemRepositoryImpl(this.dbConnection);
  @override
  Future<Item?> findById(int id) async {
    final result = await dbConnection.query(
      "select * from market.item WHERE id = ?",
      [id],
    );

    return result.isEmpty ? null : Item.fromMap(result.first.fields);
  }
}
