part of 'fetch_pokemon_cubit.dart';

sealed class FetchPokemonState extends Equatable {
  const FetchPokemonState();

  @override
  List<Object> get props => [];
}

final class FetchPokemonLoading extends FetchPokemonState {
  const FetchPokemonLoading();
}

final class FetchPokemonLoaded extends FetchPokemonState {
  final PokemonEntity pokemon;
  const FetchPokemonLoaded({required this.pokemon});
  @override
  List<Object> get props => [pokemon];
}

final class FetchPokemonFailure extends FetchPokemonState {
  final String message;
  const FetchPokemonFailure({required this.message});
}
