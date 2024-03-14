import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kraken_anime/domain/models/anime_detail_model.dart';
import 'package:kraken_anime/presentation/features/anime_detail/widgets/anime_detail_widget.dart';

List<AnimeDetailModel>? animeModel = [
  AnimeDetailModel(
      character: AnimeDetailModelCharacter(
          images: AnimeDetailModelCharacterImages(
              jpg: AnimeDetailModelCharacterImagesJpg(
                  imageUrl: "https://www.google.com"))),
      favorites: 1,
      role: "Main",
      voiceActors: [
        AnimeDetailModelVoiceActors(
          language: "Japanese",
          person: AnimeDetailModelVoiceActorsPerson(
              name: "Kana Hanazawa",
              url: "https://www.google.com",
              images: AnimeDetailModelVoiceActorsPersonImages(
                jpg: AnimeDetailModelVoiceActorsPersonImagesJpg(
                    imageUrl: "https://www.google.com"),
              )),
        )
      ])
];

Widget createAnimeDetailWidget() {
  return AnimeDetailWidget(animeDetailModel: animeModel ?? []);
}

void main() {
  group("Anime Detail Test", () {
    testWidgets('Anime Detail Widget Test', (WidgetTester tester) async {
      await tester.pumpWidget(createAnimeDetailWidget());
      expect(find.byType(AnimeDetailWidget), findsOneWidget);
    });
  });
}
