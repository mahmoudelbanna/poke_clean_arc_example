import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poke_clean_arc_example/poke.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late ValueNotifier<int> _currentPageIndex;

  final List<Widget> _pages = [const PokemonPage(), const DataPage()];

  @override
  void initState() {
    super.initState();
    final params = context.read<SelectedPokemonItemCubit>().state.params;
    context.read<FetchPokemonCubit>().fetchPokemon(params: params);
    _currentPageIndex = ValueNotifier(0);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _currentPageIndex,
      builder:
          (context, value, _) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Poke Clean Arc Example'),
            ),
            body: _pages[_currentPageIndex.value],
            bottomNavigationBar: NavBar(currentPageIndex: _currentPageIndex),
          ),
    );
  }
}
