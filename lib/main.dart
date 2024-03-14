import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/features/home/cubit/home_cubit.dart';
import 'presentation/features/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: kDebugMode,
        title: 'Kraken Anime',
        theme: ThemeData.dark(useMaterial3: true),
        home: HomeView(),
      ),
    );
  }
}
