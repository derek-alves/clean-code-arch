import 'package:project/infra/database/database.dart';
import 'package:project/infra/factory/database_repository_abstract_factory.dart';

DatabaseRepositoryAbstractFactory makeDatabaseRepositoryFactory() =>
    DatabaseRepositoryAbstractFactory(
      SqlConnectionAdapter(),
    );
