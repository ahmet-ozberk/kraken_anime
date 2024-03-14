import '../../../../domain/models/anime_detail_model.dart';

abstract class AnimeDetailState {
  const AnimeDetailState();
}

class AnimeDetailInitialState extends AnimeDetailState {
  const AnimeDetailInitialState();
}

class AnimeDetailLoadingState extends AnimeDetailState {
  const AnimeDetailLoadingState();
}

class AnimeDetailSuccessState extends AnimeDetailState {
  final List<AnimeDetailModel>? animeDetailModel;
  const AnimeDetailSuccessState(this.animeDetailModel);
}

class AnimeDetailErrorState extends AnimeDetailState {
  final String message;
  const AnimeDetailErrorState(this.message);
}

class AnimeDetailEmptyState extends AnimeDetailState {
  const AnimeDetailEmptyState();
}