import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_clean_arc_example/poke.dart';

import 'no_connection_home_test.mocks.dart';

@GenerateMocks([InternetCubit])
void main() {
  late MockInternetCubit mockInternetCubit;

  setUp(() {
    mockInternetCubit = MockInternetCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<InternetCubit>.value(
        value: mockInternetCubit,
        child: const NoConnectionHomeErrorLoading(),
      ),
    );
  }

  testWidgets('displays "No internet connection" when InternetDisconnected',
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
    await tester.pump(); // Allow widget to build

    // Verify UI elements for disconnected state
    expect(find.byIcon(Icons.signal_wifi_off), findsOneWidget);
    expect(find.text("No internet connection"), findsOneWidget);
    expect(find.text("You're online!"), findsNothing);
  });

  testWidgets('displays "You\'re online!" when InternetConnected',
      (WidgetTester tester) async {
    when(mockInternetCubit.state).thenReturn(
      const InternetConnected(connectionType: ConnectionType.connected),
    );
    when(mockInternetCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const InternetConnected(connectionType: ConnectionType.connected),
      ]),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump(); // Allow widget to build

    // Verify UI elements for connected state
    expect(find.byIcon(Icons.wifi), findsOneWidget);
    expect(find.text("You're online!"), findsOneWidget);
    expect(find.text("No internet connection"), findsNothing);
  });

  testWidgets('animates the icon with ScaleTransition',
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
    await tester.pump(); // Allow widget to build

    // Find the ScaleTransition containing the specific Icon
    final scaleTransitionFinder = find.descendant(
      of: find.byType(ScaleTransition),
      matching: find.byIcon(Icons.signal_wifi_off),
    );

    // Verify that there is exactly one matching ScaleTransition
    expect(scaleTransitionFinder, findsOneWidget);
  });
}
