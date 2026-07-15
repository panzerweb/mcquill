import 'package:mcquill/features/worlds/domain/entities/world_entity.dart';

abstract class CategoriesState {
  CategoriesState();
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryEntity> categories;

  CategoriesLoaded(this.categories);
}

class CategoriesError extends CategoriesState {
  final String error;

  CategoriesError(this.error);
}
