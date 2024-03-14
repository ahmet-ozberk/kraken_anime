import 'package:kraken_anime/domain/models/anime_base_model.dart';
import 'package:kraken_anime/domain/models/anime_detail_model.dart';

abstract class AnimeRepositoriesImpl {
  Future<AnimeBaseModel?> getAnimes();
  Future<List<AnimeDetailModel>?> getAnimeDetail();
}