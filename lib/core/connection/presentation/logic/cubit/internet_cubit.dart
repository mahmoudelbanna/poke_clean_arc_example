import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectivity.checkConnectivity().then((connectivityResult) {
      // for ios issues
      connectivityResultAction(connectivityResult);
    });
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      connectivityResultAction(connectivityResult);
    });
  }

  void connectivityResultAction(List<ConnectivityResult> connectivityResult) {
    final bool connectionType =
        connectivityResult.contains(ConnectivityResult.wifi) ||
            connectivityResult.contains(ConnectivityResult.mobile);
    if (connectionType) {
      emitInternetConnected();
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
    return super.close();
  }
}
