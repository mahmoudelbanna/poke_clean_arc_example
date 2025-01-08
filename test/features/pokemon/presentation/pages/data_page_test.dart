import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:poke_clean_arc_example/poke.dart';

import '../../../../fixtures/test_pokemon_data.dart';
import 'data_page_test.mocks.dart';

@GenerateMocks([FetchPokemonCubit])
void main() {
  late MockFetchPokemonCubit mockFetchPokemonCubit;
  setUpAll(() {
    provideDummy<FetchPokemonState>(FetchPokemonLoading());
  });

  setUp(() {
    mockFetchPokemonCubit = MockFetchPokemonCubit();
  });

  Widget createWidgetUnderTest() {
    return BlocProvider<FetchPokemonCubit>(
      create: (_) => mockFetchPokemonCubit,
      child: const MaterialApp(
        home: Scaffold(
          body: DataPage(),
        ),
      ),
    );
  }

  testWidgets('displays LoadingIndicator when state is initial',
      (tester) async {
    when(mockFetchPokemonCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        FetchPokemonLoading(),
      ]),
    );
    when(mockFetchPokemonCubit.state).thenReturn(FetchPokemonLoading());

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(LoadingIndicator), findsOneWidget);
  });

  testWidgets('displays DataWidget when state is FetchPokemonLoaded',
      (tester) async {
    final tPokemon = TestPokemonData.pokemon;

    when(mockFetchPokemonCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        FetchPokemonLoading(),
        FetchPokemonLoaded(pokemon: tPokemon),
      ]),
    );
    when(mockFetchPokemonCubit.state).thenReturn(
      FetchPokemonLoaded(pokemon: tPokemon),
    );

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(DataWidget), findsOneWidget);
  });

  testWidgets('displays ErrorMessageWidget when state is FetchPokemonFailure',
      (tester) async {
    const errorMessage = 'Failed to fetch data';
    when(mockFetchPokemonCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        FetchPokemonLoading(),
        FetchPokemonFailure(message: errorMessage),
      ]),
    );
    when(mockFetchPokemonCubit.state)
        .thenReturn(FetchPokemonFailure(message: errorMessage));

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(ErrorMessageWidget), findsOneWidget);
    expect(find.text(errorMessage), findsOneWidget);
  });
}
