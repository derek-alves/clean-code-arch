import '../../api/controller/order_controller.dart';
import '../make_database_repository_factory.dart';

OrderController makeOrderControllerFactory() => OrderController(
      makeDatabaseRepositoryFactory(),
    );
