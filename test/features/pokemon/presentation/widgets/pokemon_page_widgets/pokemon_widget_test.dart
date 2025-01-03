import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_clean_arc_example/features/pokemon/pokemon.dart';

import '../../../../../fixtures/test_pokemon_data.dart';

void main() {
  group('PokemonWidget', () {
    final tPokemon = TestPokemonData.pokemon;

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: Scaffold(
          body: PokemonWidget(pokemon: tPokemon),
        ),
      );
    }

    testWidgets('displays the correct Pokemon details',
        (WidgetTester tester) async {
      // Mock PokemonEntity

      // Build the widget tree
      await tester.pumpWidget(createWidgetUnderTest());

      // Verify the Pokemon name and ID are displayed
      expect(find.byType(PokemonName), findsOneWidget);

      // Verify the Pokemon types are displayed
      expect(find.byType(PokemonTypes), findsOneWidget);
    });
  });
}
