import 'package:project/application/usecase/simulate_freight/simulate_freight.dart';
import 'package:project/domain/entity/default_freight_calculator.dart';

import 'make_item_repository_factory.dart';

SimulateFreightUsecase makeSimulateFreightFactory() => SimulateFreightUsecase(
      freightCalculator: DefaultFreightCalculator(),
      itemRepository: makeItemRepositoryFactory(),
    );
