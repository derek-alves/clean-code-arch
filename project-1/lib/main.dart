import 'package:project/infra/router/order_router.dart';
import 'package:project/utils/custom_env.dart';
import 'package:shelf/shelf.dart';
import 'infra/server/custom_server.dart';

void main() async {
  var cascadeHandler = Cascade().add(OrderRouter().getHandler()).handler;

  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  await CustomServer().initialize(
    handler: handler,
    address: await CustomEnv.get<String>(key: 'server_address'),
    port: await CustomEnv.get<int>(key: 'server_port'),
  );
}
