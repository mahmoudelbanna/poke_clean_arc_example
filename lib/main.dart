import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/injection/injection.dart' as di;
import 'poke.dart';

/// Main entry point for the application.
///
/// This function is called when the app is launched.
///
/// It initializes the following:
///
/// * The Flutter binding.
/// * The HydratedBloc storage.
/// * The dependency injection system.
/// * The Bloc observer.
///
/// And then it runs the app.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  di.init();
  Bloc.observer = const AppBlocObserver();
  runApp(
    const MyApp(),
  );
}
