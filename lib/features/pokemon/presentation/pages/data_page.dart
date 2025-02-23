import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_clean_arc_example/poke.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPokemonCubit, FetchPokemonState>(
      builder: (context, state) {
        if (state is FetchPokemonLoaded) {
          return DataWidget(pokemon: state.pokemon);
        }
        if (state is FetchPokemonFailure) {
          return ErrorMessageWidget(message: state.message);
        }
        return const LoadingIndicator();
      },
    );
  }
}
