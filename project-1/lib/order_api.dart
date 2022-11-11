import 'package:project/api_handler.dart';
import 'package:project/application/usecase/place_order/place_order.dart';
import 'package:project/infra/factory/make_database_repository_factory.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class OrderApi extends ApiHandler {
  final respositoryFactory = makeDatabaseRepositoryFactory();
  @override
  Handler getHandler() {
    var router = Router();
    router.post("/orders", (Request request) async {
      var placeOrder = PlaceOrderUsecase(respositoryFactory);
      var input = PlaceOrderInput.fromRequest(await request.readAsString());
      try {
        await placeOrder.execute(input);
        return Response(200);
      } on Exception catch (e) {
        return Response.notFound(e);
      }
    });

    return createHandler(handler: router);
  }
}
