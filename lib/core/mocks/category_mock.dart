import 'package:mcquill/core/constants/enums.dart';
import 'package:mcquill/features/worlds/domain/entities/world_entity.dart';

final List<CategoryEntity> mockCategories = [
  CategoryEntity(
    id: 1,
    name: 'Survival',
    icon: WorldIconEnums.pickaxe,
    color: '#4CAF50',
  ),

  CategoryEntity(
    id: 2,
    name: 'Hardcore',
    icon: WorldIconEnums.skull,
    color: '#D32F2F',
  ),

  CategoryEntity(
    id: 3,
    name: 'Creative',
    icon: WorldIconEnums.castle,
    color: '#2196F3',
  ),

  CategoryEntity(
    id: 4,
    name: 'Redstone',
    icon: WorldIconEnums.bolt,
    color: '#FF9800',
  ),
];
