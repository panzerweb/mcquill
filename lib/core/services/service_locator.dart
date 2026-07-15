import 'package:get_it/get_it.dart';
import 'package:mcquill/features/worlds/data/datasource/world_mock_data_source.dart';
import 'package:mcquill/features/worlds/domain/repositories/world_repositories.dart';
import 'package:mcquill/features/worlds/presentation/bloc/world_detail_cubit.dart';
import 'package:mcquill/features/worlds/presentation/bloc/worlds_cubit.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // ===============================
  // WORLDS REGISTRY
  // ===============================
  locator.registerLazySingleton<WorldMockDataSource>(
    () => WorldMockDataSourceImplementation(),
  ); // Mock Data Source
  locator.registerLazySingleton<WorldRepositories>(
    () => WorldRepositoriesImplementation(locator<WorldMockDataSource>()),
  );
  locator.registerFactory(() => WorldsCubit(locator<WorldRepositories>()));
  locator.registerFactory(() => WorldDetailCubit(locator<WorldRepositories>()));
}
