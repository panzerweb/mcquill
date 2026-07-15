import 'package:mcquill/features/worlds/domain/entities/world_entity.dart';

abstract class WorldsState {
  WorldsState();
}

class WorldsInitial extends WorldsState {}

class WorldsLoading extends WorldsState {}

class WorldsLoaded extends WorldsState {
  final List<WorldEntity> worlds;

  WorldsLoaded(this.worlds);
}

class WorldsError extends WorldsState {
  final String error;

  WorldsError(this.error);
}
