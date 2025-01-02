import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_clean_arc_example/poke.dart';

part 'selected_pokemon_item_state.dart';

class SelectedPokemonItemCubit extends Cubit<SelectedPokemonItemState> {
  SelectedPokemonItemCubit()
      : super(
            SelectedPokemonItemState(params: PokemonParams(id: 1.toString())));

  void changeParamsId({required int newId}) {
    final newPokemonParams = PokemonParams(id: newId.toString());
    emit(SelectedPokemonItemState(params: newPokemonParams));
  }
}
