import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poke_clean_arc_example/poke.dart';

class InternetListener extends StatelessWidget {
  final Widget child;

  const InternetListener({
    super.key,
    required this.child,
  });

  /// Displays an alert dialog when there is no internet connection.
  ///
  /// This dialog informs the user that cellular data is turned off and
  /// suggests turning on cellular data or using Wi-Fi to access data.
  ///
  /// The dialog has a single "Ok" action button that dismisses the dialog
  /// when pressed.
  ///
  /// Parameters:
  /// - `context`: The BuildContext to use for showing the dialog.

  static void _showNoConnectionAlertDialog({required BuildContext context}) {
    ShowAlertDialog.call(
      context: context,
      title: 'Cellular Data is Turned Off',
      content: 'Turn on cellular data or use Wi-Fi to access data',
      action: 'Ok',
      onPressesAction_1: () => Navigator.of(context).pop(),
    );
  }

  @override

  ///
  /// Listens for changes to the internet connection state and shows an
  /// alert dialog when the internet connection is disconnected.
  ///
  /// The alert dialog is shown using `ShowAlertDialog.showAlertDialog`.
  ///
  /// The dialog is not shown when the internet connection is reconnected.
  ///
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetDisconnected) {
          _showNoConnectionAlertDialog(context: context);
        }
      },
      child: child,
    );
  }
}
