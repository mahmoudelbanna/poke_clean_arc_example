import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poke_clean_arc_example/poke.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        if (state is InternetLoading) {
          return const CircularProgressIndicator.adaptive();
        } else if (state is InternetConnected) {
          return const HomeWidget();
        } else {
          return const NoConnectionHomeErrorLoading();
        }
      },
    );
  }
}
