import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_anime/presentation/features/anime_detail/cubit/anime_detail_cubit.dart';
import 'package:kraken_anime/presentation/features/anime_detail/cubit/anime_detail_state.dart';
import 'package:kraken_anime/presentation/features/anime_detail/widgets/anime_detail_widget.dart';

class AnimeDetailView extends StatelessWidget {
  final int id;
  const AnimeDetailView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<AnimeDetailCubit, AnimeDetailState>(
          bloc: AnimeDetailCubit(id),
          builder: (context, state) {
            if (state is AnimeDetailInitialState ||
                state is AnimeDetailLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AnimeDetailSuccessState) {
              return AnimeDetailWidget(
                  animeDetailModel: state.animeDetailModel ?? []);
            } else if (state is AnimeDetailErrorState) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Empty'));
            }
          },
        ));
  }
}
