import 'package:flutter/material.dart';

import '../../../../../domain/models/anime_model.dart';
import 'home_list_item.dart';

class HomeListWidget extends StatelessWidget {
  final List<AnimeModel> animes;
  final ScrollController scrollController;
  const HomeListWidget({super.key, required this.animes, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: animes.length,
      controller: scrollController,
      padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 12),
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        final anime = animes[index];
        return HomeListItem(anime: anime);
      },
    );
  }
}
