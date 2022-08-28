import 'package:project/infra/database/connection.dart';

class SqlConnectionAdapter implements Connection {
  @override
  Future query(String statement, List params) {
    // TODO: implement query
    throw UnimplementedError();
  }
}
