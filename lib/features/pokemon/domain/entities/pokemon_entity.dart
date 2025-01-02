import 'package:equatable/equatable.dart';

import 'package:poke_clean_arc_example/poke.dart';

class PokemonEntity extends Equatable {
  final String name;
  final int id;
  final SpritesEntity sprites;
  final List<TypesEntity> types;
  const PokemonEntity({
    required this.name,
    required this.id,
    required this.sprites,
    required this.types,
  });

  @override
  List<Object?> get props => [name, id, sprites, types];

  @override
  String toString() =>
      'PokemonEntity(name: $name, id: $id, sprites: $sprites, types: $types)';

  PokemonEntity copyWith({
    String? name,
    int? id,
    SpritesEntity? sprites,
    List<TypesEntity>? types,
  }) {
    return PokemonEntity(
      name: name ?? this.name,
      id: id ?? this.id,
      sprites: sprites ?? this.sprites,
      types: types ?? this.types,
    );
  }
}
