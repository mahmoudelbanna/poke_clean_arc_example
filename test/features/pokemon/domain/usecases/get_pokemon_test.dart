import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:poke_clean_arc_example/poke.dart';

import '../../../../fixtures/test_pokemon_data.dart';
@GenerateMocks([PokemonRepository])
import 'get_pokemon_test.mocks.dart';

void main() {
  late GetPokemon usecase;
  late MockPokemonRepository mockPokemonRepository;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetPokemon(repository: mockPokemonRepository);
  });

  final tPokemonParams = TestPokemonData.pokemonParams;
  final adjustedId = (int.parse(tPokemonParams.id) + 1).toString();
  final tAdjustedParams = PokemonParams(
    id: adjustedId,
  ); // Because usecase adds 1 to the ID
  final tPokemonEntity = TestPokemonData.pokemon;

  test('should get pokemon entity from the repository', () async {
    // arrange
    when(
      mockPokemonRepository.getPokemon(params: tAdjustedParams),
    ).thenAnswer((_) async => Right(tPokemonEntity));

    // act
    final result = await usecase(params: tPokemonParams);

    // assert
    expect(result, Right(tPokemonEntity));
    verify(mockPokemonRepository.getPokemon(params: tAdjustedParams));
    verifyNoMoreInteractions(mockPokemonRepository);
  });

  test('should return Failure when repository fails', () async {
    // arrange
    final tFailure = ServerFailure(errorMessage: 'This is a server exception');
    when(
      mockPokemonRepository.getPokemon(params: tAdjustedParams),
    ).thenAnswer((_) async => Left(tFailure));

    // act
    final result = await usecase(params: tPokemonParams);

    // assert
    expect(result, Left(tFailure));
    verify(mockPokemonRepository.getPokemon(params: tAdjustedParams));
    verifyNoMoreInteractions(mockPokemonRepository);
  });

  test('should adjust the ID by adding 1 before calling repository', () async {
    // arrange
    when(
      mockPokemonRepository.getPokemon(params: tAdjustedParams),
    ).thenAnswer((_) async => Right(tPokemonEntity));

    // act
    await usecase(params: tPokemonParams);

    // assert
    verify(mockPokemonRepository.getPokemon(params: tAdjustedParams));
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
