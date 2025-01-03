import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_clean_arc_example/poke.dart';

import '../../../../../fixtures/test_pokemon_data.dart';

void main() {
  group('PokemonName Widget', () {
    final tPokemon = TestPokemonData.pokemon;

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: Scaffold(
          body: PokemonName(
            pokemonId: tPokemon.id,
            pokemonName: tPokemon.name,
          ),
        ),
      );
    }

    testWidgets('displays the correct Pokemon ID and name',
        (WidgetTester tester) async {
      // Act: Build the widget tree
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert: Verify the correct text is displayed
      expect(find.text('#${tPokemon.id} ${tPokemon.name.toUpperCase()}'),
          findsOneWidget);

      // Assert: Verify the text styling
      final textWidget = tester.widget<Text>(
          find.text('#${tPokemon.id} ${tPokemon.name.toUpperCase()}'));
      expect(textWidget.style?.fontWeight, FontWeight.w900);
      expect(textWidget.style?.fontSize, 50);
      expect(textWidget.style?.color, Colors.white);
    });
  });
}
