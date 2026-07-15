import 'package:drift/drift.dart';

import 'worlds.dart';

@DataClassName('LoreData')
class Lore extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get worldId =>
      integer().references(Worlds, #id, onDelete: KeyAction.cascade)();

  TextColumn get title => text().nullable()();

  TextColumn get content => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();
}
