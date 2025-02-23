import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_clean_arc_example/poke.dart';

import '../../../../../../fixtures/test_pokemon_data.dart';
import 'search_data_widget_test.mocks.dart';

@GenerateMocks([SelectedPokemonItemCubit])
void main() {
  group('SearchPokemonWidget', () {
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
        create: (_) => mockSelectedPokemonItemCubit,
        child: const MaterialApp(home: Scaffold(body: SearchPokemonWidget())),
      );
    }

    testWidgets(
      'renders correctly with proper padding and contains all child widgets',
      (WidgetTester tester) async {
        // Act
        await tester.pumpWidget(createWidgetUnderTest());

        // Assert
        // Assert
        // Verify child widgets exist
        expect(find.byType(SearchData), findsOneWidget);
        expect(find.byType(SearchButton), findsOneWidget);

        // Verify widgets are wrapped in a Column
        final columnFinder = find.ancestor(
          of: find.byType(SearchData),
          matching: find.byType(Column),
        );
        expect(columnFinder, findsOneWidget);

        // Verify the outer padding values by finding the first Padding widget
        // that's an ancestor of the Column
        final outerPaddingFinder =
            find
                .ancestor(of: columnFinder, matching: find.byType(Padding))
                .first;
        final Padding paddingWidget = tester.widget(outerPaddingFinder);

        expect(
          paddingWidget.padding,
          const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 40.0),
        );
      },
    );

    testWidgets('maintains correct widget order in Column', (
      WidgetTester tester,
    ) async {
      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      final columnFinder = find.byType(Column);
      final Column column = tester.widget(columnFinder);

      expect(column.children[0], isA<SearchData>());
      expect(column.children[1], isA<SearchButton>());
    });
  });
}
