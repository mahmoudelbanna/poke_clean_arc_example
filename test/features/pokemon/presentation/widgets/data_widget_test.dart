import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_clean_arc_example/poke.dart';

import '../../../../fixtures/test_pokemon_data.dart';

void main() {
  final tPokemon = TestPokemonData.pokemon;

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: Scaffold(
        body: DataWidget(pokemon: tPokemon),
      ),
    );
  }

  testWidgets('should display correct Pokemon API URL',
      (WidgetTester tester) async {
    final urlText = '$kGetPokemonUrl${tPokemon.id}';

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text(urlText), findsOneWidget);
  });

  testWidgets('should display Pokemon name correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text(tPokemon.name), findsOneWidget);
  });

  testWidgets('should display Pokemon ID correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text(tPokemon.id.toString()), findsOneWidget);
  });

  testWidgets('should display Sprites widget', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(Sprites), findsOneWidget);
  });

  testWidgets('should display Types widget', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(Types), findsOneWidget);
  });
}
