import 'package:flutter/material.dart';

import 'package:poke_clean_arc_example/poke.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black87,
          )),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
