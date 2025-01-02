import 'package:poke_clean_arc_example/poke.dart';

class OfficialArtworkModel extends OfficialArtworkEntity {
  const OfficialArtworkModel({
    required super.frontDefault,
    required super.frontShiny,
  });

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> json) =>
      OfficialArtworkModel(
        frontDefault: json[kFrontDefault],
        frontShiny: json[kFrontShiny],
      );

  Map<String, dynamic> toJson() => {
        kFrontDefault: frontDefault,
        kFrontShiny: frontShiny,
      };
}
