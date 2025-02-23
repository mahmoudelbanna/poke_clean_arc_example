import 'package:flutter/material.dart';
import 'package:poke_clean_arc_example/poke.dart';

class Types extends StatelessWidget {
  const Types({super.key, required this.pokemon});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(leading: const Text('[ ]'), title: const Text(kTypes)),
        _Type(pokemon: pokemon),
      ],
    );
  }
}

class _Type extends StatelessWidget {
  const _Type({
    // ignore: unused_element, unused_element_parameter
    super.key,
    required this.pokemon,
  });

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        children: List.generate(
          pokemon.types.length,
          (index) => Column(
            children: [
              ListTile(leading: const Text('{ }'), title: const Text(kType)),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ListTile(
                  title: const Text(kName),
                  subtitle: Text(pokemon.types.elementAt(index).type.name),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
