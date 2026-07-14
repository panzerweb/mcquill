import 'package:drift/drift.dart';

// Tables
import 'tables/worlds.dart';
import 'tables/categories.dart';
import 'tables/tasks.dart';
import 'tables/tags.dart';
import 'tables/task_tags.dart';

part 'database.g.dart'; // Fix this later

@DriftDatabase(tables: [Worlds, Categories, Tasks, Tags, TaskTags])
class AppDatabase extends _$AppDatabase {}
