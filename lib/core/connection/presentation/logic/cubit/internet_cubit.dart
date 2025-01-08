import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  final InternetConnectionChecker connectionChecker;
  late StreamSubscription connectivityStreamSubscription;
  late StreamSubscription internetCheckerSubscription;

  InternetCubit({
    required this.connectivity,
    required this.connectionChecker,
  }) : super(InternetLoading()) {
    _initializeConnectivityChecking();
    _initializeInternetChecking();
  }

  /// Initializes the connectivity checking process.
  ///
  /// On iOS in debug mode, checks the connectivity once and processes the result.
  /// Otherwise, listens for changes in connectivity and processes each change
  /// using the `connectivityResultAction`.

  void _initializeConnectivityChecking() {
    if (kDebugMode && Platform.isIOS) {
      connectivity.checkConnectivity().then(connectivityResultAction);
    } else {
      connectivityStreamSubscription =
          connectivity.onConnectivityChanged.listen(connectivityResultAction);
    }
  }

  /// Initializes the internet checking process.
  ///
  /// Listens for changes in the internet connection state and processes each
  /// change using the `emitInternetConnected` or `emitInternetDisconnected`
  /// functions.
  void _initializeInternetChecking() {
    internetCheckerSubscription =
        connectionChecker.onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        emitInternetConnected();
      } else {
        emitInternetDisconnected();
      }
    });
  }

  /// Handles a change in the connectivity state of the device.
  ///
  /// If the device has a network connection, checks the internet connection
  /// state and emits [InternetConnected] or [InternetDisconnected] accordingly.
  /// Otherwise, emits [InternetDisconnected].
  ///
  /// The [connectivityResult] parameter is the result of the connectivity
  /// check, which is a list of [ConnectivityResult] values indicating the
  /// current network connection type.
  void connectivityResultAction(List<ConnectivityResult> connectivityResult) {
    final bool hasConnection =
        connectivityResult.contains(ConnectivityResult.wifi) ||
            connectivityResult.contains(ConnectivityResult.mobile);

    if (hasConnection) {
      // Only check actual internet connectivity if we have network connection
      connectionChecker.hasConnection.then((hasInternet) {
        if (hasInternet) {
          emitInternetConnected();
        } else {
          emitInternetDisconnected();
        }
      });
    } else {
      emitInternetDisconnected();
    }
  }

  void emitInternetDisconnected() => emit(InternetDisconnected());

  void emitInternetConnected() =>
      emit(InternetConnected(connectionType: ConnectionType.connected));

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    internetCheckerSubscription.cancel();
    return super.close();
  }
}
