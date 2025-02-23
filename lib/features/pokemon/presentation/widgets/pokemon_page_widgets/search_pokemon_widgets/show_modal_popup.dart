import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_clean_arc_example/poke.dart';

class ShowModalPopup extends StatelessWidget {
  const ShowModalPopup({
    // ignore: unused_element
    super.key,
  });

  Future<dynamic> _showModalPopup({
    required BuildContext context,
    required String pokemonId,
    required OnSelectedItemChangedFunction onSelectedItemChanged,
  }) {
    return showCupertinoModalPopup(
      useRootNavigator: false,
      context: context,
      builder:
          (_) => Container(
            height: 216,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  child: const Text('Done'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Expanded(
                  child: SafeArea(
                    top: false,
                    child: CupertinoPicker(
                      magnification: 1.22,
                      squeeze: 1.2,
                      useMagnifier: true,
                      itemExtent: 32.0,
                      scrollController: FixedExtentScrollController(
                        initialItem: int.parse(pokemonId),
                      ),
                      onSelectedItemChanged: onSelectedItemChanged,
                      children: List<Widget>.generate(maxPokemonId, (
                        int index,
                      ) {
                        return Center(child: Text((index + 1).toString()));
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pokemonId = context.watch<SelectedPokemonItemCubit>().state.params.id;
    return ElevatedButton(
      onPressed:
          () => _showModalPopup(
            context: context,
            pokemonId: pokemonId,
            onSelectedItemChanged: (int selectedItem) {
              context.read<SelectedPokemonItemCubit>().changeParamsId(
                newId: selectedItem,
              );
            },
          ),
      child: Text(
        '# ${int.parse(pokemonId) + 1}',
        style: const TextStyle(fontSize: 22.0),
      ),
    );
  }
}
