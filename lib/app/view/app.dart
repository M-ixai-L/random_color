import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:random_color/random_color/application/index.dart';
import 'package:random_color/random_color/presentation/random_color_page.dart';

class App extends StatelessWidget {
  final GetIt getIt;

  const App({super.key, required this.getIt});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return getIt.get<RandomColorBloc>();
      },
      child: const MaterialApp(home: RandomColorPage()),
    );
  }
}
