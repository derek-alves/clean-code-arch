import 'dart:convert';

import 'package:project/api_handler.dart';
import 'package:project/application/usecase/place_order/place_order.dart';
import 'package:project/application/usecase/simulate_freight/simulate_freight_input.dart';
import 'package:project/infra/factory/make_database_repository_factory.dart';
import 'package:project/infra/factory/make_simulate_freight_factory.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class OrderApi extends ApiHandler {
  final respositoryFactory = makeDatabaseRepositoryFactory();
  @override
  Handler getHandler() {
    var router = Router();
    router.post("/order", (Request request) async {
      var placeOrder = PlaceOrderUsecase(respositoryFactory);
      var input = PlaceOrderInput.fromRequest(await request.readAsString());
      try {
        await placeOrder.execute(input);
        return Response(200);
      } on Exception catch (e) {
        return Response.notFound(e);
      }
    });

    router.post("/order/simulate-freight", (Request request) async {
      try {
        final simulateFreight = makeSimulateFreightFactory();
        var input = jsonDecode(await request.readAsString());

        bool isTrue = input.toString() is List<Map<String, dynamic>>;
        if (input is! List<Map<String, dynamic>>) {
          return Response.badRequest();
        }

        var response = await simulateFreight(SimulateFreightInput(input));
        return Response.ok(response.toJson());
      } catch (e) {
        return Response.notFound(e);
      }
    });

    return createHandler(handler: router);
  }
}
