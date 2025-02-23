import 'package:flutter/material.dart';

class ShowAlertDialog {
  const ShowAlertDialog._();

  /// Displays an adaptive alert dialog with customizable title, content, and actions.
  ///
  /// The dialog will have a primary action button, and optionally a secondary action button.
  ///
  /// The [context] is the build context to show the dialog.
  /// The [title] is the optional title of the dialog.
  /// The [content] is the optional content of the dialog.
  /// The [action] is the label for the primary action button, which is required.
  /// The [onPressesAction_1] is the callback function executed when the primary action button is pressed.
  /// The [action_2] is the optional label for a secondary action button.
  /// The [onPressesAction_2] is the optional callback function executed when the secondary action button is pressed.
  ///
  /// Returns a [Future] that completes when the dialog is dismissed.

  static Future<void> call({
    required BuildContext context,
    String? title,
    String? content,
    required String action,
    required VoidCallback onPressesAction_1,
    String? action_2,
    VoidCallback? onPressesAction_2,
  }) {
    return showDialog(
      barrierDismissible: false,
      useRootNavigator: false,
      context: context,
      builder:
          (ctx) => AlertDialog.adaptive(
            title:
                title != null
                    ? Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    )
                    : null,
            content:
                content != null
                    ? Text(
                      content,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                    : null,
            actions: [
              TextButton(onPressed: onPressesAction_1, child: Text(action)),
              if (action_2 != null)
                TextButton(onPressed: onPressesAction_2, child: Text(action_2)),
            ],
          ),
    );
  }
}
