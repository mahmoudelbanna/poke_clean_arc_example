import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_clean_arc_example/poke.dart';

import 'fetch_pokemon_cubit_test.mocks.dart';

@GenerateMocks([GetPokemon])
/// Tests for [FetchPokemonCubit].
///
/// This test suite verifies that the Cubit correctly emits states
/// in response to the [fetchPokemon] method being called.
///
/// The [fetchPokemon] method is tested with two different scenarios:
/// 1. When the [GetPokemon] use case completes successfully, the Cubit
///    should emit [FetchPokemonLoading] followed by [FetchPokemonLoaded]
///    with the correct [PokemonEntity].
/// 2. When the [GetPokemon] use case completes with a failure, the Cubit
///    should emit [FetchPokemonLoading] followed by [FetchPokemonFailure]
///    with the correct error message.
///
/// The test suite also verifies that the Cubit's state is correct after
/// the stream has been stubbed.
void main() {
  late FetchPokemonCubit cubit;
  late MockGetPokemon mockGetPokemon;
  setUp(() {
    mockGetPokemon = MockGetPokemon();
    cubit = FetchPokemonCubit(usecase: mockGetPokemon);
  });

  test('initialState should be FetchPokemonLoading', () {
    // assert
    expect(cubit.state, FetchPokemonLoading());
  });

  group('fetchPokemon', () {
    test('should emit [FetchPokemonLoading, FetchPokemonLoaded] when success',
        () async {
      // arrange
      final tPokemonParams = PokemonParams(id: '1');
      final tPokemon = PokemonEntity(
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
      when(mockGetPokemon(params: anyNamed('params')))
          .thenAnswer((_) async => Right(tPokemon));

      // act
      cubit.fetchPokemon(params: tPokemonParams);

      // Assert that the initial state is correct.
      expect(cubit.state, FetchPokemonLoading());

      // assert later
      await expectLater(
        cubit.stream,
        emits(FetchPokemonLoaded(pokemon: tPokemon)),
      );
      // Assert that the current state is in sync with the stubbed stream.
      expect(cubit.state, FetchPokemonLoaded(pokemon: tPokemon));
    });

    test('should emit [FetchPokemonLoading, FetchPokemonFailure] when failure',
        () async {
      // arrange
      final tPokemonParams = PokemonParams(id: '1');
      when(mockGetPokemon(params: anyNamed('params')))
          .thenAnswer((_) async => Left(ServerFailure(errorMessage: 'error')));

      // act
      cubit.fetchPokemon(params: tPokemonParams); // emit

      // Assert that the initial state is correct.
      expect(cubit.state, FetchPokemonLoading());

      // assert later
      await expectLater(
        cubit.stream,
        emits(FetchPokemonFailure(message: 'error')),
      );
      // Assert that the current state is in sync with the stubbed stream.
      expect(cubit.state, FetchPokemonFailure(message: 'error'));
    });
  });
}