import 'package:drift/drift.dart';

/*
  DEFAULT CATEGORIES ARE:

  Survival
  Hardcode
  Creative
  Redstone

*/

@DataClassName('CategoryData')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().unique()();

  // Material Icon name
  TextColumn get icon => text()();

  // Hex color value (#4CAF50)
  TextColumn get color => text()();
}
