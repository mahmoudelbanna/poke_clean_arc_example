// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_clean_arc_example/poke.dart';

import '../../../../fixtures/test_pokemon_data.dart';
import 'home_widget_test.mocks.dart';

@GenerateMocks([SelectedPokemonItemCubit, FetchPokemonCubit, InternetCubit])
/// The main function that runs the test suite for the home page.
///
/// This function sets up MockCubits for [InternetCubit], [SelectedPokemonItemCubit],
/// and [FetchPokemonCubit]. It then creates a [MaterialApp] with a
/// [MultiBlocProvider] that provides the MockCubits to the app.
///
/// Finally, it runs two tests:
///
/// 1. Verifies that the app displays the AppBar title and default page content.
///
/// 2. Verifies that the app navigates between pages using the NavBar.
void main() {
  late MockSelectedPokemonItemCubit mockSelectedPokemonItemCubit;
  late MockFetchPokemonCubit mockFetchPokemonCubit;
  late MockInternetCubit mockInternetCubit;

  setUpAll(() {
    provideDummy<FetchPokemonState>(FetchPokemonLoading());
  });

  setUp(() {
    mockInternetCubit = MockInternetCubit();
    mockSelectedPokemonItemCubit = MockSelectedPokemonItemCubit();
    mockFetchPokemonCubit = MockFetchPokemonCubit();

    when(
      mockInternetCubit.state,
    ).thenReturn(InternetConnected(connectionType: ConnectionType.connected));
    when(mockInternetCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        InternetConnected(connectionType: ConnectionType.connected),
      ]),
    );

    when(mockSelectedPokemonItemCubit.state).thenReturn(
      SelectedPokemonItemState(params: const PokemonParams(id: '1')),
    );
    when(mockSelectedPokemonItemCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        SelectedPokemonItemState(params: const PokemonParams(id: '1')),
      ]),
    );

    final tPokemon = TestPokemonData.pokemon;

    when(mockFetchPokemonCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        FetchPokemonLoading(),
        FetchPokemonLoaded(pokemon: tPokemon),
      ]),
    );

    when(mockFetchPokemonCubit.state).thenReturn(FetchPokemonLoading());
  });

  Widget createWidgetUnderTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(create: (_) => mockInternetCubit),
        BlocProvider<SelectedPokemonItemCubit>(
          create: (_) => mockSelectedPokemonItemCubit,
        ),
        BlocProvider<FetchPokemonCubit>(create: (_) => mockFetchPokemonCubit),
      ],
      child: const MaterialApp(home: HomeWidget()),
    );
  }

  testWidgets('Displays AppBar title and default page content', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle(); // Wait for streams and state changes.

    // Verify the AppBar title
    expect(find.text('Poke Clean Arc Example'), findsOneWidget);

    // Verify the default page content (PokemonPage)
    expect(find.byType(PokemonPage), findsOneWidget);
  });

  testWidgets('Navigates between pages using NavBar', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle(); // Wait for streams and state changes.

    // Verify initial page is PokemonPage
    expect(find.byType(PokemonPage), findsOneWidget);

    // Simulate tapping on the NavBar to switch to DataPage
    final navBarItemDataPage =
        find.byIcon(Icons.menu).first; // Replace with actual icon
    await tester.tap(navBarItemDataPage);
    await tester.pumpAndSettle();

    // Verify the new page content (DataPage)
    expect(find.byType(DataPage), findsOneWidget);

    // Simulate tapping on the NavBar to switch to PokemonPage
    final navBarItemPokemonPage =
        find.byIcon(Icons.search_outlined).first; // Replace with actual icon
    await tester.tap(navBarItemPokemonPage);
    await tester.pumpAndSettle();

    // Verify the new page content (PokemonPage)
    expect(find.byType(PokemonPage), findsOneWidget);
  });
}
