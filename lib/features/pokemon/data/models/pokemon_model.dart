import 'package:poke_clean_arc_example/poke.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required super.name,
    required super.id,
    required super.sprites,
    required super.types,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
    name: json[kName],
    id: json[kId],
    sprites: SpritesModel.fromJson(json[kSprites]),
    types: TypesModel.fromJsonList(json[kTypes]),
  );

  Map<String, dynamic> toJson() => {
    kName: name,
    kId: id,
    kSprites: sprites.toMap(),
    kTypes: types.map((type) => type.toMap()).toList(),
  };
}
