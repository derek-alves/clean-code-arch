import 'package:project/infra/database/database.dart';
import 'package:project/infra/repository/database/item_repository_impl.dart';

import '../../domain/repository/item_repository.dart';

ItemRepository makeItemRepositoryFactory() => ItemRepositoryImpl(
      SqlConnectionAdapter(),
    );
