import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poke_clean_arc_example/poke.dart';

class NoConnectionHomeErrorLoading extends StatelessWidget {
  const NoConnectionHomeErrorLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) => state is InternetDisconnected
            ? Center(
                child: Text(
                  'Cellular Data is Turned Off\nTurn on cellular data or use Wi-Fi to access data',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            : const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
