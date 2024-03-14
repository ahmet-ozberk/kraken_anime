import 'package:kraken_anime/data/datasource/anime_datasource.dart';
import 'package:kraken_anime/data/repositories_impl/anime_repositories_impl.dart';
import 'package:kraken_anime/domain/models/anime_base_model.dart';
import 'dart:developer' as dev;

import 'package:kraken_anime/domain/models/anime_detail_model.dart';

class AnimeRepositories implements AnimeRepositoriesImpl {
  @override
  Future<AnimeBaseModel?> getAnimes({int page = 1}) async {
    final dao = AnimeDatasource();
    final result = await dao.fetchData(page: page);
    //dev.log(result?.toJson() ?? "Data null", name: "AnimeRepositories");
    return result;
  }

  @override
  Future<List<AnimeDetailModel>?> getAnimeDetail({int id = 0}) async {
    final dao = AnimeDatasource();
    final result = await dao.fetchAnimeDetail(id: id);
    return result;
  }
}
