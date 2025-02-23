import 'package:flutter/material.dart';

class PokemonName extends StatelessWidget {
  const PokemonName({
    super.key,
    required this.pokemonId,
    required this.pokemonName,
  });

  final int pokemonId;
  final String pokemonName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: SingleChildScrollView(
        child: FittedBox(
          child: Text(
            '#$pokemonId ${pokemonName.toUpperCase()}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              shadows: <Shadow>[
                Shadow(blurRadius: 20.0, color: Colors.black45),
              ],
              fontSize: 50,
            ),
          ),
        ),
      ),
    );
  }
}
