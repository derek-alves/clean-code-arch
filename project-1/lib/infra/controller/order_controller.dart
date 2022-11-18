import 'dart:convert';

import 'package:project/application/usecase/simulate_freight/simulate_freight.dart';
import 'package:shelf/shelf.dart';

import '../../application/usecase/place_order/place_order_input.dart';
import '../../application/usecase/place_order/place_order_usecase.dart';
import '../factory/make_database_repository_factory.dart';
import '../factory/make_simulate_freight_factory.dart';

class OrderController {
  final respositoryFactory = makeDatabaseRepositoryFactory();
  Future<Response> placeOrder(Request request) async {
    var placeOrder = PlaceOrderUsecase(respositoryFactory);
    var input = PlaceOrderInput.fromRequest(await request.readAsString());
    try {
      await placeOrder.execute(input);
      return Response(200);
    } on Exception catch (e) {
      return Response.notFound(e);
    }
  }

  Future<Response> simulateFreight(Request request) async {
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
  }
}
