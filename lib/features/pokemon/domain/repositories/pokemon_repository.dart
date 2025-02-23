import 'package:dartz/dartz.dart';
import 'package:poke_clean_arc_example/poke.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonEntity>> getPokemon({
    required PokemonParams params,
  });
}
