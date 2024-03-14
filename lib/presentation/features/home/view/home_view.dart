import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/native_method_channel/anime_method_channel.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/home_error_widget.dart';
import '../widgets/home_list_widget/home_list_widget.dart';
import '../widgets/home_loading_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();

  void scrollListener() {
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      if (currentScroll >= (maxScroll - 100)) {
        context.read<HomeCubit>().getAnimes(true);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    scrollListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kraken Anime'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              AnimeMethodChannel().getAnimeDetail(id: 52991).then((value) {
                print("Result: $value");
              });
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: HomeCubit(),
        builder: (context, state) {
          if (state is HomeInitialState || state is HomeLoadingState) {
            return const HomeLoadingWidget();
          } else if (state is HomeSuccessState) {
            final list = context.read<HomeCubit>().animeBaseModel?.data;
            return Column(
              children: [
                Expanded(
                  child: HomeListWidget(
                    animes: list ?? [],
                    scrollController: _scrollController,
                  ),
                ),
                if (context.watch<HomeCubit>().state
                    is HomePaginationLoadingState)
                  const LinearProgressIndicator(),
              ],
            );
          } else if (state is HomeErrorState) {
            return HomeErrorWidget(err: state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
