import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcquill/features/worlds/domain/repositories/category_repositories.dart';
import 'package:mcquill/features/worlds/presentation/bloc/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryRepositories repository;

  CategoriesCubit(this.repository) : super(CategoriesInitial());

  Future<void> getAllCategories() async {
    emit(CategoriesLoading());

    try {
      final categories = await repository.getAllCategories();

      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
