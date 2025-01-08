import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:poke_clean_arc_example/poke.dart';
import '../../../../fixtures/test_pokemon_data.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks([
  SelectedPokemonItemCubit,
  FetchPokemonCubit,
  InternetCubit,
])
void main() {
  late MockInternetCubit mockInternetCubit;
  late MockSelectedPokemonItemCubit mockSelectedPokemonItemCubit;
  late MockFetchPokemonCubit mockFetchPokemonCubit;

  setUpAll(() {
    provideDummy<FetchPokemonState>(FetchPokemonLoading());
  });

  setUp(() {
    mockInternetCubit = MockInternetCubit();
    mockSelectedPokemonItemCubit = MockSelectedPokemonItemCubit();
    mockFetchPokemonCubit = MockFetchPokemonCubit();

    // Setup default state for SelectedPokemonItemCubit
    when(mockSelectedPokemonItemCubit.state).thenReturn(
      const SelectedPokemonItemState(params: PokemonParams(id: '1')),
    );
    when(mockSelectedPokemonItemCubit.stream).thenAnswer((_) => Stream.value(
          const SelectedPokemonItemState(params: PokemonParams(id: '1')),
        ));

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
        BlocProvider<InternetCubit>(
          create: (context) => mockInternetCubit,
        ),
        BlocProvider<SelectedPokemonItemCubit>(
          create: (context) => mockSelectedPokemonItemCubit,
        ),
        BlocProvider<FetchPokemonCubit>(
          create: (context) => mockFetchPokemonCubit,
        ),
      ],
      child: const MaterialApp(
        home: Scaffold(
          body: MyHomePage(),
        ),
      ),
    );
  }

  group('MyMyHomePage Tests', () {
    testWidgets('shows MyHomePage when internet is connected',
        (WidgetTester tester) async {
      when(mockInternetCubit.state).thenReturn(
        InternetConnected(connectionType: ConnectionType.connected),
      );
      when(mockInternetCubit.stream).thenAnswer(
        (_) => Stream.fromIterable([
          InternetConnected(connectionType: ConnectionType.connected),
        ]),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(HomeWidget), findsOneWidget);
      expect(find.byType(NoConnectionHomeErrorLoading), findsNothing);
    });

    testWidgets(
        'shows NoConnectionHomeErrorLoading when internet is disconnected',
        (WidgetTester tester) async {
      when(mockInternetCubit.state).thenReturn(
        const InternetDisconnected(),
      );
      when(mockInternetCubit.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const InternetDisconnected(),
        ]),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      // as there is repeat animation on NoConnectionHomeErrorLoading
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(NoConnectionHomeErrorLoading), findsOneWidget);
      expect(find.byType(HomeWidget), findsNothing);
    });

    testWidgets('shows NoConnectionHomeErrorLoading when internet is loading',
        (WidgetTester tester) async {
      when(mockInternetCubit.state).thenReturn(
        const InternetLoading(),
      );
      when(mockInternetCubit.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const InternetLoading(),
        ]),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(NoConnectionHomeErrorLoading), findsNothing);
      expect(find.byType(HomeWidget), findsNothing);
    });

    testWidgets('updates UI when internet state changes',
        (WidgetTester tester) async {
      // Create a broadcast stream controller
      final streamController = StreamController<InternetState>.broadcast();

      // Mock the cubit's state and stream
      when(mockInternetCubit.stream).thenAnswer((_) => streamController.stream);
      when(mockInternetCubit.state).thenReturn(InternetDisconnected());

      // Render the widget
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump(); // Allow initial build

      // Verify the initial state
      expect(find.byType(NoConnectionHomeErrorLoading), findsOneWidget);
      expect(find.byType(HomeWidget), findsNothing);

      // Update the state to InternetConnected
      when(mockInternetCubit.state).thenReturn(
          InternetConnected(connectionType: ConnectionType.connected));
      streamController
          .add(InternetConnected(connectionType: ConnectionType.connected));

      await tester.pumpAndSettle(); // Wait for animations and state changes

      // Verify the updated state
      expect(find.byType(HomeWidget), findsOneWidget);
      expect(find.byType(NoConnectionHomeErrorLoading), findsNothing);

      // Clean up
      await streamController.close();
    });
  });
}
