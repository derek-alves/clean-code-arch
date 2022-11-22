import 'package:project/infra/server/api_handler.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../controller/order_controller.dart';

class OrderRouter extends ApiHandler {
  final orderController = OrderController();
  @override
  Handler getHandler() {
    var router = Router();
    router.post(
      "/order",
      (Request request) async => await orderController.placeOrder(request),
    );

    router.post(
      "/order/simulate-freight",
      (Request request) async => await orderController.simulateFreight(request),
    );

    return createHandler(handler: router);
  }
}
