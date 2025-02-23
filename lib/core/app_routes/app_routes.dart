import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poke_clean_arc_example/poke.dart';

class AppRouter {
  const AppRouter._();
  static const String home = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          settings: RouteSettings(name: home),
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => getIt<FetchPokemonCubit>()),
                  BlocProvider(
                    create: (context) => getIt<SelectedPokemonItemCubit>(),
                  ),
                ],
                child: const MyHomePage(),
              ),
        );

      default:
        throw Exception('Route not found!');
    }
  }
}
