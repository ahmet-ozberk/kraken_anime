import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:kraken_anime/data/native_method_channel/anime_method_channel.dart';

void main() {
  group("Anime List Test", () {
    test('Native Api Call', () async {
      final animeMethodChannel = AnimeMethodChannel();
      final result = await animeMethodChannel.getAnime();
      expect(result, isNotNull);
    });

     test('Native Api Call 2', () async {
      final animeMethodChannel = AnimeMethodChannel();
      final result = await animeMethodChannel.getAnimeDetail(id: 52991);
      expect(result, isNotNull);
    });
  });
}
