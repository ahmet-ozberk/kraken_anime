import 'dart:convert';

import '../native_method_channel/anime_method_channel.dart';
import '../../domain/models/anime_detail_model.dart';
import '../../domain/models/anime_base_model.dart';

class AnimeDatasource {
  Future<AnimeBaseModel?> fetchData({int page = 1}) async {
    try {
      final methodChannel = AnimeMethodChannel();
      final nativeCall = await methodChannel.getAnime(page: page);
      if (nativeCall != null) {
        AnimeBaseModel animeBaseModel = AnimeBaseModel.fromJson(nativeCall);
        return animeBaseModel;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<AnimeDetailModel>?> fetchAnimeDetail({required int id}) async {
    try {
      final methodChannel = AnimeMethodChannel();
      final nativeCall = await methodChannel.getAnimeDetail(id: id);
      final parseJson = jsonDecode(nativeCall.toString());

      if (nativeCall != null) {
        List<AnimeDetailModel> result = (parseJson['data'] as List)
            .map((e) => AnimeDetailModel.fromJson(e))
            .toList();
        return result;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
