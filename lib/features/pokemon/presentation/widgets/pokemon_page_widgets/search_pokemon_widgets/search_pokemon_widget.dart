import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_clean_arc_example/poke.dart';

class SearchPokemonWidget extends StatelessWidget {
  const SearchPokemonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 40.0,
      ),
      child: Column(
        children: [
          const SearchData(),
          const _SearchButton(),
        ],
      ),
    );
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pokemonId = context.watch<SelectedPokemonItemCubit>().state.params.id;
    return CustomElevatedButtonWidget(
      buttonColor: Colors.orangeAccent,
      textColor: Colors.white,
      iconColor: Colors.white,
      callback: () {
        final id = (int.parse(pokemonId) + 1).toString();
        final params = PokemonParams(id: id);
        context.read<FetchPokemonCubit>().fetchPokemon(params: params);
      },
    );
  }
}
