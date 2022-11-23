import 'package:project/infra/api/router/order_router.dart';

import '../controller/make_order_controller_factory.dart';

OrderRouter makeOrderRouterFactory() => OrderRouter(
      orderController: makeOrderControllerFactory(),
    );
