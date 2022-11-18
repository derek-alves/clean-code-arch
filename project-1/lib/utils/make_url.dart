import 'custom_env.dart';

class MakeUrl {
  static Future<String> execute(String path) async {
    String serverAdress = await CustomEnv.get(key: "server_address");
    String serverPort = await CustomEnv.get(key: "server_port");
    return 'http://$serverAdress:$serverPort/$path/';
  }
}
