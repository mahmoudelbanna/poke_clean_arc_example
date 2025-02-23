import 'package:flutter/material.dart';
import 'package:poke_clean_arc_example/poke.dart';

class PokemonTypes extends StatelessWidget {
  const PokemonTypes({super.key, required this.pokemonTypes});

  final List<TypesEntity> pokemonTypes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        runSpacing: 5,
        children: List.generate(
          pokemonTypes.length,
          (index) => Chip(
            backgroundColor: Colors.white,
            label: Text(
              pokemonTypes.elementAt(index).type.name.toUpperCase(),
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
