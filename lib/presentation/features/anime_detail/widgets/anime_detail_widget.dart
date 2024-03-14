import 'package:flutter/material.dart';
import 'package:kraken_anime/domain/models/anime_detail_model.dart';

class AnimeDetailWidget extends StatefulWidget {
  final List<AnimeDetailModel> animeDetailModel;
  const AnimeDetailWidget({super.key, required this.animeDetailModel});

  @override
  State<AnimeDetailWidget> createState() => _AnimeDetailWidgetState();
}

class _AnimeDetailWidgetState extends State<AnimeDetailWidget> {
  final pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.4,
            child: PageView.builder(
              controller: pageController,
              itemCount: widget.animeDetailModel.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final anime = widget.animeDetailModel[index];
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        anime.character?.images?.jpg?.imageUrl ?? '',
                        height: size.height * 0.5,
                        width: size.width * 0.7,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      top: 0,
                      width: size.width * 0.6,
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          anime.character?.name ?? '',
                          style: theme.textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Text(
            widget.animeDetailModel[currentPage].role ?? '',
            style: theme.textTheme.titleLarge,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children:
                    widget.animeDetailModel[currentPage].voiceActors?.map((e) {
                          return Chip(
                              avatar: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    e?.person?.images?.jpg?.imageUrl ?? ''),
                              ),
                              label: Column(
                                children: [
                                  Text(
                                    e?.person?.name ?? '',
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  Text(
                                    e?.language ?? '',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ));
                        }).toList() ??
                        [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
