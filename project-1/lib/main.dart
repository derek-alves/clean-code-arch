import 'package:project/utils/custom_env.dart';
import 'package:shelf/shelf.dart';
import 'infra/factory/router/make_order_router_factory.dart';
import 'infra/server/custom_server.dart';

void main() async {
  var cascadeHandler =
      Cascade().add(makeOrderRouterFactory().getHandler()).handler;

  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  await CustomServer().initialize(
    handler: handler,
    address: await CustomEnv.get<String>(key: 'server_address'),
    port: await CustomEnv.get<int>(key: 'server_port'),
  );
}
