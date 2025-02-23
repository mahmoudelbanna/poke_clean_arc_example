import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_clean_arc_example/poke.dart';

class SearchData extends StatelessWidget {
  const SearchData({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 5.0,
      children: [
        ElevatedButton(
          onPressed:
              () => context.read<SelectedPokemonItemCubit>().changeParamsId(
                newId: Random().nextInt(maxPokemonId),
              ),
          child: const Text('Random', style: TextStyle(fontSize: 22.0)),
        ),
        const ShowModalPopup(),
      ],
    );
  }
}
