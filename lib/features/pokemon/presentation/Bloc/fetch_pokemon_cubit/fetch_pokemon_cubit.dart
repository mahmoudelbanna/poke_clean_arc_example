import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_clean_arc_example/poke.dart';

part 'fetch_pokemon_state.dart';

class FetchPokemonCubit extends Cubit<FetchPokemonState> {
  final GetPokemon usecase;
  FetchPokemonCubit({required this.usecase}) : super(FetchPokemonLoading());

  void fetchPokemon({required PokemonParams params}) async {
    emit(FetchPokemonLoading());

    final fetchedPokemon = await usecase(params: params);

    fetchedPokemon.fold(
      (failure) => emit(
        FetchPokemonFailure(message: FailureToMessage.call(failure: failure)),
      ),
      (pokemon) => emit(FetchPokemonLoaded(pokemon: pokemon)),
    );
  }
}
