import 'package:flutter/services.dart';

class AnimeMethodChannel {
  final platform = const MethodChannel('kraken_anime_channel');

  Future<String?> getAnime({int page = 1}) async {
    try {
      final result = await platform
          .invokeMethod('nativeMethod', {"page": page.toString()});
      return result;
    } catch (e) {
      return null;
    }
  }

    Future<String?> getAnimeDetail({required int id}) async {
    try {
      final result = await platform
          .invokeMethod('animeDetailMethod', {"id": id.toString()});
      return result;
    } catch (e) {
      return null;
    }
  }
}
