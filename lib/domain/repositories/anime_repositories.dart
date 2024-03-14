import '../../data/datasource/anime_datasource.dart';
import '../../data/repositories_impl/anime_repositories_impl.dart';
import '../models/anime_base_model.dart';

import '../models/anime_detail_model.dart';

class AnimeRepositories implements AnimeRepositoriesImpl {
  @override
  Future<AnimeBaseModel?> getAnimes({int page = 1}) async {
    final dao = AnimeDatasource();
    final result = await dao.fetchData(page: page);
    return result;
  }

  @override
  Future<List<AnimeDetailModel>?> getAnimeDetail({int id = 0}) async {
    final dao = AnimeDatasource();
    final result = await dao.fetchAnimeDetail(id: id);
    return result;
  }
}
