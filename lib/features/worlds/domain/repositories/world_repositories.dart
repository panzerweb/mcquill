import 'package:mcquill/features/worlds/data/datasource/world_mock_data_source.dart';
import 'package:mcquill/features/worlds/domain/entities/world_entity.dart';

abstract class WorldRepositories {
  Future<List<WorldEntity>> getWorlds();

  Future<WorldEntity> getWorldById(int id);

  Future<void> createWorld(WorldEntity world);

  Future<void> deleteWorld(int id);
}

class WorldRepositoriesImplementation implements WorldRepositories {
  // We handle mock data as of now, change later to local datasource
  final WorldMockDataSource mockDataSource;

  WorldRepositoriesImplementation(this.mockDataSource);

  @override
  Future<List<WorldEntity>> getWorlds() async {
    final worlds = await mockDataSource.getWorlds();

    return worlds;
  }

  @override
  Future<WorldEntity> getWorldById(int id) async {
    final worlds = await mockDataSource.getWorlds();

    return worlds.firstWhere((world) => world.id == id);
  }

  @override
  Future<void> createWorld(WorldEntity world) async {
    return await mockDataSource.createWorld(world);
  }

  @override
  Future<void> deleteWorld(int id) async {
    return await mockDataSource.deleteWorld(id);
  }
}
