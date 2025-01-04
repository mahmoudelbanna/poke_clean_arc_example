import 'package:dartz/dartz.dart';

import 'package:poke_clean_arc_example/poke.dart';

class GetPokemon {
  final PokemonRepository repository;

  const GetPokemon({required this.repository});

  Future<Either<Failure, PokemonEntity>> call(
      {required PokemonParams params}) async {
    final adjustedId = (int.parse(params.id) + 1).toString();
    final adjustedParams = PokemonParams(id: adjustedId);
    return await repository.getPokemon(params: adjustedParams);
  }
}
