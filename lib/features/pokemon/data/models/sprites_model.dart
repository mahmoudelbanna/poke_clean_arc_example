import 'package:poke_clean_arc_example/poke.dart';

class SpritesModel extends SpritesEntity {
  const SpritesModel({required super.other});

  factory SpritesModel.fromJson(Map<String, dynamic> json) {
    return SpritesModel(other: OtherModel.fromJson(json[kOther]));
  }

  Map<String, dynamic> toJson() => {kOther: other};
}
