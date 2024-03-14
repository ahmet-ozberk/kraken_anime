import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/models/anime_base_model.dart';
import '../../../../domain/repositories/anime_repositories.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitialState()) {
    getAnimes();
  }

  int pagination = 1;
  final _repo = AnimeRepositories();
  AnimeBaseModel? animeBaseModel;

  Future getAnimes([bool isPagination = false]) async {
    try {
      if (isPagination) {
        emit(const HomePaginationLoadingState());
        pagination++;
      } else {
        emit(const HomeLoadingState());
      }
      final result = await _repo.getAnimes(page: pagination);
      if (result != null) {
        if (isPagination && animeBaseModel != null) {
          animeBaseModel?.data?.addAll(result.data ?? []);
          final AnimeBaseModel currentData = AnimeBaseModel(
            pagination: result.pagination,
            data: animeBaseModel?.data,
          );
          animeBaseModel = currentData;
          emit(const HomeSuccessState());
        } else {
          animeBaseModel = result;
          emit(const HomeSuccessState());
        }
      } else {
        emit(const HomeEmptyState());
      }
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
