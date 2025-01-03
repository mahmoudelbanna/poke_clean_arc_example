import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_clean_arc_example/poke.dart';

import '../../../../../fixtures/test_pokemon_data.dart';

void main() {
  group('PokemonTypes Widget', () {
    testWidgets('displays the correct Pokemon types',
        (WidgetTester tester) async {
      final tPokemon = TestPokemonData.pokemon;
      final pokemonTypes = tPokemon.types;

      Widget createWidgetUnderTest() {
        return MaterialApp(
          home: Scaffold(
            body: PokemonTypes(
              pokemonTypes: pokemonTypes,
            ),
          ),
        );
      }

      // Act: Build the widget tree
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert: Verify the types are displayed as Chips
      expect(find.text(pokemonTypes.first.type.name.toUpperCase()),
          findsOneWidget);
      expect(
          find.text(pokemonTypes.last.type.name.toUpperCase()), findsOneWidget);

      // Assert: Verify the Chips are displayed with correct styling
      final fireChip = tester.widget<Chip>(find.widgetWithText(
          Chip, pokemonTypes.first.type.name.toUpperCase()));
      expect(fireChip.backgroundColor, Colors.white);

      final flyingChip = tester.widget<Chip>(
          find.widgetWithText(Chip, pokemonTypes.last.type.name.toUpperCase()));
      expect(flyingChip.backgroundColor, Colors.white);
    });

    testWidgets('handles empty Pokemon types list',
        (WidgetTester tester) async {
      // Arrange: Provide an empty list
      const emptyPokemonTypes = <TypesEntity>[];

      Widget createWidgetUnderTest() {
        return MaterialApp(
          home: Scaffold(
            body: PokemonTypes(
              pokemonTypes: emptyPokemonTypes,
            ),
          ),
        );
      }

      // Act: Build the widget tree
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert: Verify no Chips are displayed
      expect(find.byType(Chip), findsNothing);
    });
  });
}
