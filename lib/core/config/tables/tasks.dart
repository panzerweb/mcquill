import 'package:drift/drift.dart';
import 'package:mcquill/core/constants/enums.dart';

import 'worlds.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get worldId =>
      integer().references(Worlds, #id, onDelete: KeyAction.cascade)();

  TextColumn get title => text()();

  TextColumn get description => text().nullable()();

  TextColumn get purpose => text().nullable()();

  TextColumn get priority =>
      textEnum<TaskPriority>().withDefault(const Constant('MEDIUM'))();

  TextColumn get status =>
      textEnum<TaskStatus>().withDefault(const Constant('TODO'))();

  DateTimeColumn get dueDate => dateTime().nullable()();

  DateTimeColumn get completedAt => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();
}
