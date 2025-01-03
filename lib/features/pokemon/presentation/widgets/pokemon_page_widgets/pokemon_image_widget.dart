import 'package:flutter/material.dart';

class PokemonContainerWidget extends StatelessWidget {
  const PokemonContainerWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.orange,
      ),
      child: child,
    );
  }
}
