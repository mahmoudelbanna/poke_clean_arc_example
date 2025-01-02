import 'package:flutter_test/flutter_test.dart';

import 'package:poke_clean_arc_example/poke.dart';

/// Tests for [SelectedPokemonItemCubit].
///
/// This tests the [SelectedPokemonItemCubit] by asserting that the initial
/// state is [SelectedPokemonItemState] with [PokemonParams] id = 1.
///
/// It also tests that the [changeParamsId] method emits a new
/// [SelectedPokemonItemState] with the new id.
void main() {
  late SelectedPokemonItemCubit cubit;

  setUp(() {
    cubit = SelectedPokemonItemCubit();
  });

  test('initialState should be SelectedPokemonState with id=1', () {
    //arrange
    final tPokemonParams = PokemonParams(id: 1.toString());
    // assert
    expect(cubit.state, SelectedPokemonItemState(params: tPokemonParams));
  });

  group('changeId', () {
    test('should emit SelectedPokemonItemState with new id', () async {
      // arrange
      final tNewId = 3;
      final tPokemonParams = PokemonParams(id: 3.toString());

      // act
      cubit.changeParamsId(newId: tNewId); // emit

      // assert
      expect(cubit.state, SelectedPokemonItemState(params: tPokemonParams));
    });
  });
}
