part of 'selected_pokemon_item_cubit.dart';

const _kParams = 'params';

class SelectedPokemonItemState extends Equatable {
  final PokemonParams params;
  const SelectedPokemonItemState({required this.params});

  @override
  List<Object> get props => [params];

  Map<String, dynamic> toMap() => {
        _kParams: params.toMap(),
      };

  factory SelectedPokemonItemState.fromMap(Map<String, dynamic> map) =>
      SelectedPokemonItemState(
        params: PokemonParams.fromMap(map[_kParams]),
      );
}
