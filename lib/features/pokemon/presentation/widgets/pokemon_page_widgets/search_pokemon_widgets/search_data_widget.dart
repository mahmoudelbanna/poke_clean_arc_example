import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_clean_arc_example/poke.dart';

class SearchData extends StatelessWidget {
  const SearchData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 5.0,
      children: [
        ElevatedButton(
          onPressed: () =>
              context.read<SelectedPokemonItemCubit>().changeParamsId(
                    newId: Random().nextInt(maxPokemonId),
                  ),
          child: const Text(
            'Random',
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
        ),
        const _ShowModalPopup(),
      ],
    );
  }
}

class _ShowModalPopup extends StatelessWidget {
  const _ShowModalPopup({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pokemonId = context.watch<SelectedPokemonItemCubit>().state.params.id;
    return ElevatedButton(
      onPressed: () => UiFunctions.showModalPopup(
          context: context,
          pokemonId: pokemonId,
          onSelectedItemChanged: (int selectedItem) {
            context.read<SelectedPokemonItemCubit>().changeParamsId(
                  newId: selectedItem,
                );
          }),
      child: Text(
        '# ${int.parse(pokemonId) + 1}',
        style: const TextStyle(
          fontSize: 22.0,
        ),
      ),
    );
  }
}
