import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_clean_arc_example/poke.dart';

import '../../../../../../fixtures/test_pokemon_data.dart';
import 'show_modal_popup_test.mocks.dart';

@GenerateMocks([SelectedPokemonItemCubit])
void main() {
  group('ShowModalPopup Widget', () {
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
    final tPokemonParams = TestPokemonData.pokemonParams;
    final tShowedId = (int.parse(tPokemonParams.id) + 1).toString();
    Widget createWidgetUnderTest() {
      return BlocProvider<SelectedPokemonItemCubit>(
        create: (context) => mockSelectedPokemonItemCubit,
        child: const MaterialApp(
          home: Scaffold(
            body: ShowModalPopup(),
          ),
        ),
      );
    }

    testWidgets('displays the correct button text',
        (WidgetTester tester) async {
      // Act: Build the widget tree
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert: Verify the button text
      expect(find.text('# $tShowedId'), findsOneWidget);
    });

    testWidgets('opens modal popup when button is pressed', (tester) async {
      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(CupertinoPicker), findsOneWidget);
      expect(find.text('Done'), findsOneWidget);
    });

    testWidgets('opens modal popup when button is pressed', (tester) async {
      // Arrange

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(CupertinoPicker), findsOneWidget);
      expect(find.text('Done'), findsOneWidget);
    });

    testWidgets('calls changeParamsId when picker value changes',
        (tester) async {
      // Arrange
      const newSelectedItem = 7;
      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Simulate picker value change
      final pickerWidget = find.byType(CupertinoPicker);
      final CupertinoPicker picker = tester.widget(pickerWidget);
      picker.onSelectedItemChanged?.call(newSelectedItem);

      // Assert
      verify(mockSelectedPokemonItemCubit.changeParamsId(
              newId: newSelectedItem))
          .called(1);
    });

    testWidgets('closes modal when Done button is pressed', (tester) async {
      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Open modal
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Press Done button
      await tester.tap(find.text('Done'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(CupertinoPicker), findsNothing);
    });
  });
}
