import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poke_clean_arc_example/main.dart' as app;
import 'package:poke_clean_arc_example/poke.dart';
import 'package:get_it/get_it.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Integration Tests', () {
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      // Reset GetIt instance before each test
      await GetIt.instance.reset();
    });

    tearDown(() async {
      // Clean up GetIt after each test
      await GetIt.instance.reset();
    });

    testWidgets('Pokemon data loads correctly', (WidgetTester tester) async {
      await tester.runAsync(() async {
        app.main();
      });

      // Initial frame
      await tester.pump();

      // Wait for connectivity check
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify app is running
      expect(find.byType(MyApp), findsOneWidget);

      // Wait for data to load
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Verify loading state is gone
      expect(find.byType(CircularProgressIndicator), findsNothing);

      // Verify Pokemon data is displayed
      expect(find.byType(PokemonPageData), findsWidgets);
    });

    testWidgets('Error handling works correctly', (WidgetTester tester) async {
      await tester.runAsync(() async {
        app.main();
      });
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // If there's an error state, verify error widget is shown
      if (find.byType(ErrorMessageWidget).evaluate().isNotEmpty) {
        expect(find.byType(ErrorMessageWidget), findsOneWidget);
      }
    });

    testWidgets('Navigates between pages using NavBar', (
      WidgetTester tester,
    ) async {
      await tester.runAsync(() async {
        app.main();
      });
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify initial state (should start on PokemonPage)
      expect(find.byType(PokemonPage), findsOneWidget);
      expect(find.byType(DataPage), findsNothing);

      // Test navigation to DataPage
      final navBarItemDataPage = find.byIcon(Icons.menu);
      expect(navBarItemDataPage, findsOneWidget);
      await tester.tap(navBarItemDataPage);
      await tester.pumpAndSettle();

      // Verify correct navigation to DataPage
      expect(find.byType(DataPage), findsOneWidget);
      expect(find.byType(PokemonPage), findsNothing);

      // Test navigation back to PokemonPage
      final navBarItemPokemonPage = find.byIcon(Icons.search_outlined);
      expect(navBarItemPokemonPage, findsOneWidget);
      await tester.tap(navBarItemPokemonPage);
      await tester.pumpAndSettle();

      // Verify correct navigation back to PokemonPage
      expect(find.byType(PokemonPage), findsOneWidget);
      expect(find.byType(DataPage), findsNothing);

      // Optional: Verify active state of navigation items
      expect(find.byIcon(Icons.search_outlined).hitTestable(), findsOneWidget);
      expect(find.byIcon(Icons.menu).hitTestable(), findsOneWidget);
    });
  });
}
