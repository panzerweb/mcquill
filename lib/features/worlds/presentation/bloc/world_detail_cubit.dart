import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcquill/features/worlds/domain/repositories/world_repositories.dart';
import 'package:mcquill/features/worlds/presentation/bloc/world_detail_state.dart';

class WorldDetailCubit extends Cubit<WorldDetailState> {
  final WorldRepositories repository;

  WorldDetailCubit(this.repository) : super(WorldDetailInitial());

  Future<void> getWorldById(int worldId) async {
    emit(WorldDetailLoading());

    try {
      final world = await repository.getWorldById(worldId);

      emit(WorldDetailLoaded(world));
    } catch (e) {
      emit(WorldDetailError(e.toString()));
    }
  }
}
