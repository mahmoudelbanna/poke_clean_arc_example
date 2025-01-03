import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_clean_arc_example/poke.dart';

import '../../../../fixtures/test_pokemon_data.dart';
import 'pokemon_repository_impl_test.mocks.dart';

@GenerateMocks([PokemonRemoteDataSource])
  /// Test cases for [PokemonRepositoryImpl].
  ///
  /// This class contains unit tests for [PokemonRepositoryImpl]. It verifies
  /// that [PokemonRepositoryImpl] behaves correctly when the call to
  /// [PokemonRemoteDataSource] is successful and unsuccessful.
void main() {
  late PokemonRepositoryImpl repository;
  late MockPokemonRemoteDataSource mockRemoteDataSource;
  setUp(() {
    mockRemoteDataSource = MockPokemonRemoteDataSource();
    repository = PokemonRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  final tPokemonParams = TestPokemonData.pokemonParams;

  final tPokemonModel = PokemonModel(
    id: 1,
    name: 'Bulbasaur',
    types: [TypesEntity(type: TypeEntity(name: 'Grass'))],
    sprites: SpritesEntity(
      other: OtherEntity(
        officialArtwork: OfficialArtworkEntity(
          frontDefault: 'https://example.com/default.png',
          frontShiny: 'https://example.com/shiny.png',
        ),
      ),
    ),
  );

  final PokemonEntity tPokemonEntity = tPokemonModel;

  test(
    'should return remote data when the call to remote data source is successful',
    () async {
      // arrange
      when(mockRemoteDataSource.getPokemon(params: anyNamed('params')))
          .thenAnswer((_) async => tPokemonModel);
      // act
      final result = await repository.getPokemon(params: tPokemonParams);
      // assert
      expect(result, equals(Right(tPokemonEntity)));
      verify(mockRemoteDataSource.getPokemon(params: tPokemonParams));
    },
  );
  test(
    'should return server failure when the call to remote data source is unsuccessful',
    () async {
      // arrange
      when(mockRemoteDataSource.getPokemon(params: anyNamed('params')))
          .thenThrow(ServerException());
      // act
      final result = await repository.getPokemon(params: tPokemonParams);
      // assert
      expect(
        result,
        equals(
          Left(
            ServerFailure(errorMessage: 'This is a server exception'),
          ),
        ),
      );
      verify(mockRemoteDataSource.getPokemon(params: tPokemonParams));
    },
  );
}
