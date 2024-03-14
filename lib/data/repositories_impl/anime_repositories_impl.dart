import '../../domain/models/anime_base_model.dart';
import '../../domain/models/anime_detail_model.dart';

abstract class AnimeRepositoriesImpl {
  Future<AnimeBaseModel?> getAnimes();
  Future<List<AnimeDetailModel>?> getAnimeDetail();
}