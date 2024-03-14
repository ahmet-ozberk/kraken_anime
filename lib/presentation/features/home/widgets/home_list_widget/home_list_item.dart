import 'package:flutter/material.dart';
import 'package:kraken_anime/domain/models/anime_model.dart';
import 'package:kraken_anime/presentation/features/anime_detail/view/anime_detail_view.dart';

class HomeListItem extends StatefulWidget {
  final AnimeModel anime;
  const HomeListItem({super.key, required this.anime});

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final anime = widget.anime;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AnimeDetailView(id: anime.malId ?? 0)));
        },
        child: Container(
          height: screenSize.height * 0.26,
          width: screenSize.width,
          color: Colors.grey.shade900,
          child: Row(
            children: [
              Stack(
                children: [
                  Image.network(
                    anime.images?.jpg?.largeImageUrl ?? '',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 0.4),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.image_not_supported_rounded,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Container(
                    height: screenSize.height * 0.26,
                    width: screenSize.width * 0.3,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(anime.title ?? anime.synopsis ?? "",
                              style: theme.textTheme.titleMedium)
                          .padding8Horizontal,
                      Text(
                        "Rate: ${anime.score?.toString() ?? ''}",
                        style: theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ).padding8Horizontal,
                      Divider(height: 10),
                      Expanded(
                        child: Text(
                          anime.background ?? '',
                          style: theme.textTheme.bodySmall,
                        ).padding8Horizontal,
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          itemBuilder: (context, index) => Chip(
                              label: Text(anime.genres?[index]?.name ?? "")),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 8,
                          ),
                          itemCount: anime.genres?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension WidgetPaddingExtension on Widget {
  Padding get padding8 =>
      Padding(padding: const EdgeInsets.all(8), child: this);
  Padding get padding16 =>
      Padding(padding: const EdgeInsets.all(16), child: this);
  Padding get padding8Horizontal =>
      Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: this);

  Padding get padding8Vertical =>
      Padding(padding: EdgeInsets.symmetric(vertical: 8), child: this);
}
