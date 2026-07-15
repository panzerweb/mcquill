import 'package:mcquill/core/mocks/world_mock.dart';
import 'package:mcquill/features/worlds/domain/entities/world_entity.dart';

abstract class WorldMockDataSource {
  Future<List<WorldEntity>> getWorlds();
  Future<void> createWorld(WorldEntity world);
  Future<void> deleteWorld(int id);
}

class WorldMockDataSourceImplementation implements WorldMockDataSource {
  WorldMockDataSourceImplementation();

  @override
  Future<void> createWorld(WorldEntity world) async {
    // TODO: implement createWorld
    throw UnimplementedError();
  }

  @override
  Future<void> deleteWorld(int id) async {
    // TODO: implement deleteWorld
    throw UnimplementedError();
  }

  // We use entity since this is only mock data source.
  @override
  Future<List<WorldEntity>> getWorlds() async {
    await Future.delayed(const Duration(milliseconds: 2000));

    return mockWorlds;
  }
}
