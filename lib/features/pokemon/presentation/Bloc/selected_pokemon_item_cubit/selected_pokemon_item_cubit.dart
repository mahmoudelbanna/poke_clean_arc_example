import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:poke_clean_arc_example/poke.dart';

part 'selected_pokemon_item_state.dart';

class SelectedPokemonItemCubit extends HydratedCubit<SelectedPokemonItemState> {
  SelectedPokemonItemCubit()
    : super(SelectedPokemonItemState(params: PokemonParams(id: 1.toString())));

  void changeParamsId({required int newId}) {
    final newPokemonParams = PokemonParams(id: newId.toString());
    emit(SelectedPokemonItemState(params: newPokemonParams));
  }

  @override
  SelectedPokemonItemState? fromJson(Map<String, dynamic> json) =>
      SelectedPokemonItemState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(SelectedPokemonItemState state) => state.toMap();
}
