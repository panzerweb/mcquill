import 'package:mcquill/features/worlds/data/datasource/category_mock_data_source.dart';
import 'package:mcquill/features/worlds/domain/entities/world_entity.dart';

abstract class CategoryRepositories {
  Future<List<CategoryEntity>> getAllCategories();
}

class CategoryRepositoriesImplementation implements CategoryRepositories {
  final CategoryMockDataSource mockDataSource;

  CategoryRepositoriesImplementation(this.mockDataSource);

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    final categories = await mockDataSource.getAllCategories();

    return categories;
  }
}
