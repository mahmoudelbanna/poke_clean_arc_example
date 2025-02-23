import 'package:equatable/equatable.dart';
import 'package:poke_clean_arc_example/poke.dart';

class NoParams {}

class TemplateParams {}

class PokemonParams extends Equatable {
  final String id;
  const PokemonParams({required this.id});

  @override
  List<Object?> get props => [id];

  Map<String, dynamic> toMap() {
    return {kId: id};
  }

  factory PokemonParams.fromMap(Map<String, dynamic> map) {
    return PokemonParams(id: map[kId] ?? '');
  }
}
