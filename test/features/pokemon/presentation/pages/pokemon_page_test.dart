import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:poke_clean_arc_example/poke.dart';

import '../../../../fixtures/test_pokemon_data.dart';
import 'pokemon_page_test.mocks.dart';

@GenerateMocks([FetchPokemonCubit, SelectedPokemonItemCubit])
void main() {
  late MockFetchPokemonCubit mockFetchPokemonCubit;
  late MockSelectedPokemonItemCubit mockSelectedPokemonItemCubit;
  setUpAll(() {
    provideDummy<FetchPokemonState>(const FetchPokemonLoading());
  });

  setUp(() {
    mockFetchPokemonCubit = MockFetchPokemonCubit();
    mockSelectedPokemonItemCubit = MockSelectedPokemonItemCubit();
    when(mockSelectedPokemonItemCubit.state).thenReturn(
      const SelectedPokemonItemState(params: PokemonParams(id: '1')),
    );
    when(mockSelectedPokemonItemCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const SelectedPokemonItemState(params: PokemonParams(id: '1')),
      ]),
    );
  });

  Widget createWidgetUnderTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FetchPokemonCubit>(create: (_) => mockFetchPokemonCubit),
        BlocProvider<SelectedPokemonItemCubit>(
          create: (context) => mockSelectedPokemonItemCubit,
        ),
      ],
      child: const MaterialApp(home: Scaffold(body: PokemonPage())),
    );
  }

  testWidgets('displays LoadingIndicator when state is initial', (
    tester,
  ) async {
    when(
      mockFetchPokemonCubit.stream,
    ).thenAnswer((_) => Stream.fromIterable([const FetchPokemonLoading()]));
    when(mockFetchPokemonCubit.state).thenReturn(const FetchPokemonLoading());

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(LoadingIndicator), findsOneWidget);
  });

  testWidgets('displays PokemonPageData when state is FetchPokemonLoaded', (
    tester,
  ) async {
    final tPokemon = TestPokemonData.pokemon;

    when(mockFetchPokemonCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const FetchPokemonLoading(),
        FetchPokemonLoaded(pokemon: tPokemon),
      ]),
    );
    when(
      mockFetchPokemonCubit.state,
    ).thenReturn(FetchPokemonLoaded(pokemon: tPokemon));

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(PokemonPageData), findsOneWidget);
  });

  testWidgets('displays ErrorMessageWidget when state is FetchPokemonFailure', (
    tester,
  ) async {
    const errorMessage = 'Failed to fetch data';
    when(mockFetchPokemonCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const FetchPokemonLoading(),
        const FetchPokemonFailure(message: errorMessage),
      ]),
    );
    when(
      mockFetchPokemonCubit.state,
    ).thenReturn(const FetchPokemonFailure(message: errorMessage));

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(ErrorMessageWidget), findsOneWidget);
    expect(find.text(errorMessage), findsOneWidget);
  });
}
