import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_clean_arc_example/poke.dart';

import '../../../../../fixtures/test_pokemon_data.dart';

void main() {
  final tPokemon = TestPokemonData.pokemon;

  Widget createWidgetUnderTest() {
    return MaterialApp(home: Scaffold(body: Sprites(pokemon: tPokemon)));
  }

  testWidgets('Sprites widget displays correct structure', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createWidgetUnderTest());

    // Test main Sprites section
    expect(find.text('{ }'), findsNWidgets(3));
    expect(find.text(kSprites), findsOneWidget);

    // Test Other section
    expect(find.text(kOther), findsOneWidget);

    // Test OfficialArtwork section
    expect(find.text(kOfficialArtwork), findsOneWidget);

    // Test URLs
    expect(find.text(kFrontDefault), findsOneWidget);
    expect(find.text(kFrontShiny), findsOneWidget);
    expect(
      find.text(tPokemon.sprites.other.officialArtwork.frontDefault),
      findsOneWidget,
    );
    expect(
      find.text(tPokemon.sprites.other.officialArtwork.frontShiny),
      findsOneWidget,
    );
  });

  testWidgets('SelectableText widgets are present', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(SelectableText), findsNWidgets(2));
  });

  testWidgets('Padding is applied correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    final paddings = find.byWidgetPredicate(
      (widget) =>
          widget is Padding &&
          widget.padding == const EdgeInsets.only(left: 10.0),
    );
    expect(paddings, findsNWidgets(3));
  });
}
