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

        if (input is! List) {
          return Response.badRequest(body: "must be a list");
        }

        if (input.isEmpty) {
          return Response.badRequest(body: " cannot be empty");
        }

        var response = await simulateFreight(
          SimulateFreightInput(
            input.map((dynamic e) => e as Map<String, dynamic>).toList(),
          ),
        );
        return Response.ok(jsonEncode(response.toJson()));
      } catch (e) {
        return Response.notFound(e);
      }
    });

    return createHandler(handler: router);
  }
}
