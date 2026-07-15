import 'package:mcquill/core/mocks/category_mock.dart';
import 'package:mcquill/features/worlds/domain/entities/world_entity.dart';

abstract class CategoryMockDataSource {
  Future<List<CategoryEntity>> getAllCategories();
}

class CategoryMockDataSourceImplementation implements CategoryMockDataSource {
  CategoryMockDataSourceImplementation();

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    return mockCategories;
  }
}
