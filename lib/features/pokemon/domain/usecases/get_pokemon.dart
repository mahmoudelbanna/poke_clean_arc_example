import 'package:dartz/dartz.dart';

import 'package:poke_clean_arc_example/poke.dart';

class GetPokemon {
  final PokemonRepository repository;

  const GetPokemon({required this.repository});

  Future<Either<Failure, PokemonEntity>> call(
      {required PokemonParams params}) async {
    return await repository.getPokemon(params: params);
  }
}
