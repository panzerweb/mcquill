import 'package:mcquill/features/worlds/domain/entities/world_entity.dart';

abstract class WorldDetailState {
  WorldDetailState();
}

class WorldDetailInitial extends WorldDetailState {}

class WorldDetailLoading extends WorldDetailState {}

class WorldDetailUpdating extends WorldDetailState {}

class WorldDetailLoaded extends WorldDetailState {
  final WorldEntity world;

  WorldDetailLoaded(this.world);
}

class WorldDetailError extends WorldDetailState {
  final String error;

  WorldDetailError(this.error);
}
