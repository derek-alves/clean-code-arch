import 'package:mysql1/mysql1.dart';
import 'package:project/infra/database/connection.dart';

class SqlConnectionAdapter implements Connection<MySqlConnection> {
  @override
  // TODO: implement connection
  Future<MySqlConnection> get connection => throw UnimplementedError();

  @override
  Future<MySqlConnection> createConnection() {
    // TODO: implement createConnection
    throw UnimplementedError();
  }

  @override
  Future query(String sql, [List? params]) {
    // TODO: implement query
    throw UnimplementedError();
  }
}
