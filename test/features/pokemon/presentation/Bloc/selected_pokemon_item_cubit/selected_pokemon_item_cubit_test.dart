import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:poke_clean_arc_example/poke.dart';

import 'selected_pokemon_item_cubit_test.mocks.dart';

/// Tests for [SelectedPokemonItemCubit].
///
/// This tests the [SelectedPokemonItemCubit] by asserting that the initial
/// state is [SelectedPokemonItemState] with [PokemonParams] id = 1.
///
/// It also tests that the [changeParamsId] method emits a new
/// [SelectedPokemonItemState] with the new id.
@GenerateMocks([Storage])
void main() {
  late SelectedPokemonItemCubit cubit;
  late MockStorage mockStorage;

  setUp(() {
    mockStorage = MockStorage();
    when(
      mockStorage.write(any, any),
    ).thenAnswer((_) async => {});
    HydratedBloc.storage = mockStorage;

    cubit = SelectedPokemonItemCubit();
  });

  tearDown(() {
    cubit.close();
  });

  group('SelectedPokemonItemCubit', () {
    test('initial state should have params with id "1"', () {
      expect(cubit.state.params.id, equals('1'));
    });

    test('changeParamsId should emit new state with updated params', () {
      // arrange
      const newId = 5;
      final expectedParams = PokemonParams(id: newId.toString());

      // act
      cubit.changeParamsId(newId: newId);

      // assert
      expect(
        cubit.state,
        equals(SelectedPokemonItemState(params: expectedParams)),
      );
    });

    group('hydration', () {
      test('should convert state to JSON', () {
        // arrange
        final state = SelectedPokemonItemState(
          params: PokemonParams(id: '3'),
        );

        // act
        final json = cubit.toJson(state);

        // assert
        expect(
            json,
            equals({
              'params': {'id': '3'}
            }));
      });

      test('should convert JSON to state', () {
        // arrange
        final json = {
          'params': {'id': '3'}
        };

        // act
        final state = cubit.fromJson(json);

        // assert
        expect(
          state,
          equals(SelectedPokemonItemState(params: PokemonParams(id: '3'))),
        );
      });

      test('should persist state changes to storage', () {
        // act
        cubit.changeParamsId(newId: 5);

        // assert
        verify(
          mockStorage.write(
            any,
            {
              'params': {'id': '5'}
            },
          ),
        ).called(1);
      });
    });
  });
}
