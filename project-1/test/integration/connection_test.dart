import 'package:test/test.dart';

void main() {
  test("Deve criar uma conexão com o banco de dados", (() async {
    final connection = Connection();
    final items = await connection.query("select * ffrom ccca.item", []);
    expect(items, isNotEmpty);
  }));
}
