import 'package:dartz/dartz.dart';

import 'package:poke_clean_arc_example/poke.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  const PokemonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, PokemonModel>> getPokemon({
    required PokemonParams params,
  }) async {
    try {
      final remotePokemon = await remoteDataSource.getPokemon(params: params);

      return Right(remotePokemon);
    } on ServerException {
      return const Left(ServerFailure(errorMessage: 'This is a server exception'));
    } catch (e) {
      return const Left(ServerFailure(errorMessage: 'This is a server exception'));
    }
  }
}
