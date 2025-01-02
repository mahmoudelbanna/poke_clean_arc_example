part of 'selected_pokemon_item_cubit.dart';

class SelectedPokemonItemState extends Equatable {
  final PokemonParams params;
  const SelectedPokemonItemState({required this.params});

  @override
  List<Object> get props => [params];
}
