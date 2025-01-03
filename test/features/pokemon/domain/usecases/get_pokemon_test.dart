import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../fixtures/test_pokemon_data.dart';
import 'get_pokemon_test.mocks.dart';
import 'package:poke_clean_arc_example/poke.dart';

@GenerateMocks([PokemonRepository])
  /// Tests [GetPokemon] usecase.
  ///
  /// This test suite verifies that the [GetPokemon] usecase successfully retrieves
  /// a pokemon from the repository.
  ///
  /// The test suite consists of a single test, which tests the above requirement.
  ///
  /// The test first sets up the required objects, then calls the [GetPokemon] usecase
  /// with a test pokemon id, and finally asserts that the expected pokemon is
  /// returned and that the repository method was called with the expected
  /// pokemon id.
void main() {
  late final GetPokemon usecase;
  late final MockPokemonRepository mockPokemonRepository;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetPokemon(repository: mockPokemonRepository);
  });

  final tPokemonParams = TestPokemonData.pokemonParams;

  final tPokemon = TestPokemonData.pokemon;

  test(
    'should get pokemon',
    () async {
      // Arrange
      when(mockPokemonRepository.getPokemon(params: anyNamed('params')))
          .thenAnswer((_) async => Right(tPokemon));

      // Act
      final result = await usecase(params: tPokemonParams);

      // Assert
      expect(result, Right(tPokemon));
      verify(mockPokemonRepository.getPokemon(params: tPokemonParams));
      verifyNoMoreInteractions(mockPokemonRepository);
    },
  );
}
