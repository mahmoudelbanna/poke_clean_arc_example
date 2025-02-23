import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:poke_clean_arc_example/poke.dart';

import 'internet_cubit_test.mocks.dart';

@GenerateMocks([Connectivity, InternetConnectionChecker])
void main() {
  late InternetCubit internetCubit;
  late MockConnectivity mockConnectivity;
  late MockInternetConnectionChecker mockInternetChecker;
  late StreamController<List<ConnectivityResult>> connectivityStreamController;
  late StreamController<InternetConnectionStatus> internetStatusController;

  setUp(() {
    mockConnectivity = MockConnectivity();
    mockInternetChecker = MockInternetConnectionChecker();
    connectivityStreamController = StreamController<List<ConnectivityResult>>();
    internetStatusController = StreamController<InternetConnectionStatus>();

    when(
      mockConnectivity.onConnectivityChanged,
    ).thenAnswer((_) => connectivityStreamController.stream);
    when(
      mockInternetChecker.onStatusChange,
    ).thenAnswer((_) => internetStatusController.stream);

    internetCubit = InternetCubit(
      connectivity: mockConnectivity,
      connectionChecker: mockInternetChecker,
    );
  });

  tearDown(() {
    connectivityStreamController.close();
    internetStatusController.close();
    internetCubit.close();
  });

  test('initial state should be InternetLoading', () {
    expect(internetCubit.state, isA<InternetLoading>());
  });

  group('connectivity changes', () {
    test(
      'emits InternetConnected when wifi is available and internet is connected',
      () async {
        when(mockInternetChecker.hasConnection).thenAnswer((_) async => true);

        connectivityStreamController.add([ConnectivityResult.wifi]);
        await Future.delayed(Duration.zero);

        expect(internetCubit.state, isA<InternetConnected>());
      },
    );

    test(
      'emits InternetDisconnected when wifi is available but no internet',
      () async {
        when(mockInternetChecker.hasConnection).thenAnswer((_) async => false);

        connectivityStreamController.add([ConnectivityResult.wifi]);
        await Future.delayed(Duration.zero);

        expect(internetCubit.state, isA<InternetDisconnected>());
      },
    );

    test('emits InternetDisconnected when no connectivity', () async {
      connectivityStreamController.add([ConnectivityResult.none]);
      await Future.delayed(Duration.zero);

      expect(internetCubit.state, isA<InternetDisconnected>());
    });
  });

  group('internet status changes', () {
    test('emits InternetConnected when internet becomes available', () async {
      internetStatusController.add(InternetConnectionStatus.connected);
      await Future.delayed(Duration.zero);

      expect(internetCubit.state, isA<InternetConnected>());
    });

    test('emits InternetDisconnected when internet is lost', () async {
      internetStatusController.add(InternetConnectionStatus.disconnected);
      await Future.delayed(Duration.zero);

      expect(internetCubit.state, isA<InternetDisconnected>());
    });
  });

  test('cancels subscriptions when closed', () async {
    await internetCubit.close();

    // Verify no more events are processed
    connectivityStreamController.add([ConnectivityResult.wifi]);
    internetStatusController.add(InternetConnectionStatus.connected);
    await Future.delayed(Duration.zero);

    expect(internetCubit.state, isA<InternetLoading>());
  });
}
