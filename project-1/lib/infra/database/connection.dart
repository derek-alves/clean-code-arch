abstract class Connection {
  Future<dynamic> query(String statement, List params);
}
