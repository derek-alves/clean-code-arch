import 'package:mysql1/mysql1.dart';
import 'package:project/infra/database/sql_connection_adapter.dart';
import 'package:test/test.dart';

void main() {
  test("Deve criar uma conexão com o banco de dados", (() async {
    final connection = SqlConnectionAdapter();
    final Results items =
        await connection.query("select * from market.item", []);
    expect(items, isNotEmpty);
  }));
}
