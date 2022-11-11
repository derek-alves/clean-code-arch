import 'package:project/order_api.dart';
import 'package:shelf/shelf.dart';

import 'package:shelf/shelf_io.dart' as shelf_io;

void main() async {
  var cascadeHandler =
      Cascade().add(OrderApi().getHandler()).add(_echoRequest).handler;

  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  var server = await shelf_io.serve(handler, 'localhost', 8000);

  print('Serving at http://${server.address.host}:${server.port}');
}

Response _echoRequest(Request request) =>
    Response.ok('Request for "${request.url}"');
