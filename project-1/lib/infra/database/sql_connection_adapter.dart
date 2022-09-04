import 'package:mysql1/mysql1.dart';
import 'package:project/infra/database/connection.dart';

import '../../utils/custom_env.dart';

class SqlConnectionAdapter implements Connection<MySqlConnection> {
  MySqlConnection? _connection;
  @override
  Future<MySqlConnection> get connection async {
    _connection ??= await createConnection();
    if (_connection == null) {
      throw Exception("[ERROR/DB] -> Failed Create Connection");
    }
    return _connection!;
  }

  @override
  Future<MySqlConnection> createConnection() async =>
      await MySqlConnection.connect(ConnectionSettings(
        host: await CustomEnv.get<String>(key: 'db_host'),
        port: await CustomEnv.get<int>(key: 'db_port'),
        user: await CustomEnv.get<String>(key: 'db_user'),
        password: await CustomEnv.get<String>(key: 'db_pass'),
        db: await CustomEnv.get<String>(key: 'db_schema'),
      ));

  @override
  query(String sql, [List? params]) async {
    var connection = await this.connection;
    return await connection.query(
      sql,
      params,
    );
  }
}
