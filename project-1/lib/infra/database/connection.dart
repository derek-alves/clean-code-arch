abstract class Connection<T> {
  Future<T> createConnection();
  Future<T> get connection;
  Future<dynamic> query(String sql, [List? params]);
}
