import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_clean_arc_example/poke.dart';

import '../../../../../../core/home/presentation/pages/home_page_test.mocks.dart';
import '../../../../../../fixtures/test_pokemon_data.dart';

@GenerateMocks([SelectedPokemonItemCubit])
void main() {
  group('SearchData Widget', () {
    late MockSelectedPokemonItemCubit mockSelectedPokemonItemCubit;

    setUp(() {
      mockSelectedPokemonItemCubit = MockSelectedPokemonItemCubit();
      when(mockSelectedPokemonItemCubit.state).thenReturn(
        SelectedPokemonItemState(params: TestPokemonData.pokemonParams),
      );
      when(mockSelectedPokemonItemCubit.stream).thenAnswer(
        (_) => Stream.fromIterable([
          SelectedPokemonItemState(params: TestPokemonData.pokemonParams),
        ]),
      );
    });

    Widget createWidgetUnderTest() {
      return BlocProvider<SelectedPokemonItemCubit>(
        create: (context) => mockSelectedPokemonItemCubit,
        child: const MaterialApp(
          home: Scaffold(
            body: SearchData(),
          ),
        ),
      );
    }

    testWidgets('displays the Random button and ShowModalPopup widget',
        (WidgetTester tester) async {
      // Act: Build the widget tree
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert: Verify the Random button is displayed
      expect(find.text('Random'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsNWidgets(2));

      // Assert: Verify the ShowModalPopup widget is displayed
      expect(find.byType(ShowModalPopup), findsOneWidget);
    });

    testWidgets('calls changeParamsId when Random button is pressed',
        (WidgetTester tester) async {
      // Act: Build the widget tree
      await tester.pumpWidget(createWidgetUnderTest());

      // Find the Random button and tap it
      await tester.tap(find.text('Random'));
      await tester.pumpAndSettle();

      //Assert: Verify that changeParamsId was called with a valid ID
      verify(mockSelectedPokemonItemCubit.changeParamsId(
              newId: anyNamed('newId')))
          .called(1);
    });
  });
}
