import 'package:flutter/material.dart';
import 'package:poke_clean_arc_example/features/pokemon/pokemon.dart';

class PokemonWidget extends StatelessWidget {
  const PokemonWidget({super.key, required this.pokemon});
  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return PokemonContainerWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PokemonName(
            pokemonId: pokemon.id,
            pokemonName: pokemon.name,
          ),
          PokemonTypes(pokemonTypes: pokemon.types),
        ],
      ),
    );
  }
}
