import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcquill/features/worlds/domain/repositories/world_repositories.dart';
import 'package:mcquill/features/worlds/presentation/bloc/worlds_state.dart';

class WorldsCubit extends Cubit<WorldsState> {
  final WorldRepositories repository;

  WorldsCubit(this.repository) : super(WorldsInitial());

  Future<void> getWorlds() async {
    emit(WorldsLoading());

    try {
      final worlds = await repository.getWorlds();

      final sortedWorldsByPinned = worlds
        ..sort((a, b) => b.isPinned ? 1 : 0.compareTo(a.isPinned ? 1 : 0));

      emit(WorldsLoaded(sortedWorldsByPinned));
    } catch (e) {
      emit(WorldsError(e.toString()));
    }
  }
}
