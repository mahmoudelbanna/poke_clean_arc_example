import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_clean_arc_example/poke.dart';

import '../../../../../fixtures/test_pokemon_data.dart';

void main() {
  final tPokemon = TestPokemonData.pokemon;

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: Scaffold(
        body: Types(pokemon: tPokemon),
      ),
    );
  }

  testWidgets('Types widget displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    // Check main Types header

    expect(find.text(kTypes), findsOneWidget);

    // Check type elements

    expect(find.text(kType), findsOneWidget);
    expect(find.text(kName), findsOneWidget);
    expect(find.text(tPokemon.types.first.type.name), findsOneWidget);

    // Check Paddings with left: 10.0
    final customPaddings = find.byWidgetPredicate(
      (widget) =>
          widget is Padding &&
          widget.padding == const EdgeInsets.only(left: 10.0),
    );
    expect(customPaddings,
        findsNWidgets(2)); // One for _Type and one for each type's name
  });
}
