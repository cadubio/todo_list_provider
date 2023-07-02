import 'package:todo_list_provider/app/core/database/migrations/migration.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration_v1.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration_v2.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigration() => [
        MigrationV1(),
        MigrationV2(),
        // aqui vão todas as migrations, pois o método é chamado quando
        // o app é instalado.
      ];

  List<Migration> getUpgradeMigration(int version) {
    final migrations = <Migration>[];

    if (version == 1) {
      migrations.add(MigrationV2());
      // caso existam outras migrations
      // migrations.add(MigrationV3());
      // migrations.add(MigrationV4());
      //...
    }

    if (version == 2) {
      // Caso exista migration acima da 2
      // migrations.add(MigrationV3());
      // migrations.add(MigrationV4());
    }

    return migrations;
  }
}
