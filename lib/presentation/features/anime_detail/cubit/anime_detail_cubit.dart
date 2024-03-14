import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/repositories/anime_repositories.dart';
import 'anime_detail_state.dart';

class AnimeDetailCubit extends Cubit<AnimeDetailState> {
  final int id;
  AnimeDetailCubit(this.id) : super(const AnimeDetailInitialState()) {
    getAnimeDetail(id: id);
  }

  final _repo = AnimeRepositories();

  void getAnimeDetail({required int id}) async {
    try {
      emit(const AnimeDetailLoadingState());
      final result = await _repo.getAnimeDetail(id: id);
      if (result != null) {
        emit(AnimeDetailSuccessState(result));
      } else {
        emit(const AnimeDetailErrorState('Data not found'));
      }
    } catch (e) {
      emit(AnimeDetailErrorState(e.toString()));
    }
  }
}
