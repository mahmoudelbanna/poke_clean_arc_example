import 'package:flutter/material.dart';
import 'package:poke_clean_arc_example/poke.dart';

class DataWidget extends StatelessWidget {
  final PokemonEntity pokemon;
  const DataWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: const Text('API'),
            title: Text('$kGetPokemonUrl${pokemon.id}'),
            tileColor: Colors.orange,
          ),
          ListTile(title: const Text(kName), subtitle: Text(pokemon.name)),
          const Divider(),
          ListTile(
            title: const Text(kId),
            subtitle: Text(pokemon.id.toString()),
          ),
          const Divider(),
          Sprites(pokemon: pokemon),
          const Divider(),
          Types(pokemon: pokemon),
        ],
      ),
    );
  }
}
