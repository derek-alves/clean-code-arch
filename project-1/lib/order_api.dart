import 'package:project/api_handler.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class OrderApi extends ApiHandler {
  @override
  Handler getHandler() {
    var router = Router();
    router.post("/orders", (Request request) {});

    return createHandler(handler: router);
  }
}
