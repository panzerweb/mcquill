import 'package:mcquill/core/constants/enums.dart';

class WorldEntity {
  final int id;
  final String name;
  final String description;
  final CategoryEntity category;
  final bool isPinned;
  final DateTime createdAt;
  final DateTime updatedAt;

  WorldEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.isPinned,
    required this.createdAt,
    required this.updatedAt,
  });
}

class CategoryEntity {
  final int id;
  final String name;
  final WorldIconEnums icon;
  final String color;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}
