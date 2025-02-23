import 'package:flutter/material.dart';
import 'package:poke_clean_arc_example/poke.dart';

class Sprites extends StatelessWidget {
  const Sprites({super.key, required this.pokemon});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(leading: Text('{ }'), title: Text(kSprites)),
        _Other_data(pokemon: pokemon),
      ],
    );
  }
}

// ignore: camel_case_types
class _Other_data extends StatelessWidget {
  const _Other_data({
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
        children: [
          const ListTile(leading: Text('{ }'), title: Text(kOther)),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                const ListTile(
                  leading: Text('{ }'),
                  title: Text(kOfficialArtwork),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text(kFrontDefault),
                        subtitle: SelectableText(
                          pokemon.sprites.other.officialArtwork.frontDefault,
                        ),
                      ),
                      ListTile(
                        title: const Text(kFrontShiny),
                        subtitle: SelectableText(
                          pokemon.sprites.other.officialArtwork.frontShiny,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
