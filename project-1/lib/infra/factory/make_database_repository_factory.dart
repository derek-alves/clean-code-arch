import 'package:project/infra/database/database.dart';
import 'package:project/infra/factory/database_repository_factory.dart';

DatabaseRepositoryFactory makeDatabaseRepositoryFactory() =>
    DatabaseRepositoryFactory(
      SqlConnectionAdapter(),
    );
