import 'package:drift/drift.dart';

import 'worlds.dart';

class Location extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get worldId =>
      integer().references(Worlds, #id, onDelete: KeyAction.cascade)();

  TextColumn get locationName => text()();

  TextColumn get description => text().nullable()();

  IntColumn get xCoordinates => integer().withDefault(const Constant(0))();
  IntColumn get yCoordinates => integer().withDefault(const Constant(0))();
  IntColumn get zCoordinates => integer().withDefault(const Constant(0))();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();
}
