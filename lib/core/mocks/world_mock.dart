import 'package:mcquill/core/mocks/category_mock.dart';
import 'package:mcquill/features/worlds/domain/entities/world_entity.dart';

// Get the mock categories
CategoryEntity get survivalCategory =>
    mockCategories.where((category) => category.id == 1).first;

CategoryEntity get hardcoreCategory =>
    mockCategories.where((category) => category.id == 2).first;

CategoryEntity get creativeCategory =>
    mockCategories.where((category) => category.id == 3).first;

CategoryEntity get redstoneCategory =>
    mockCategories.where((category) => category.id == 4).first;

// Mock Worlds
final List<WorldEntity> mockWorlds = [
  WorldEntity(
    id: 1,
    name: 'Phoenix Empire',
    description: 'The empire of phoenix',
    category: survivalCategory,
    isPinned: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  WorldEntity(
    id: 2,
    name: 'Panzerweb',
    description: 'Panzerweb world',
    category: hardcoreCategory,
    isPinned: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];
