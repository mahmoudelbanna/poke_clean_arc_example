import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_clean_arc_example/poke.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPokemonCubit, FetchPokemonState>(
      builder: (context, state) {
        if (state is FetchPokemonLoaded) {
          return _PokemonPageData(
            pokemon: state.pokemon,
          );
        }
        if (state is FetchPokemonFailure) {
          return ErrorMessageWidget(message: state.message);
        }
        return const LoadingIndicator();
      },
    );
  }
}

class _PokemonPageData extends StatelessWidget {
  // ignore: unused_element
  const _PokemonPageData({super.key, required PokemonEntity pokemon})
      : _pokemon = pokemon;
  final PokemonEntity _pokemon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PokemonWidget(
            pokemon: _pokemon,
          ),
          SearchPokemonWidget(),
        ],
      ),
    );
  }
}
