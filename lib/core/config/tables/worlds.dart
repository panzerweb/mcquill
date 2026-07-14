import 'package:drift/drift.dart';

import 'categories.dart';

@DataClassName('WorldData')
class Worlds extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get description => text().nullable()();

  IntColumn get categoryId => integer().references(Categories, #id)();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();
}
