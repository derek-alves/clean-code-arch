import 'package:project/domain/entity/item.dart';

abstract class ItemRepository {
  Future<Item?> findById(int id);
}
