import 'package:poke_clean_arc_example/poke.dart';

class OtherModel extends OtherEntity {
  const OtherModel({required super.officialArtwork});

  factory OtherModel.fromJson(Map<String, dynamic> json) => OtherModel(
      officialArtwork: OfficialArtworkModel.fromJson(json[kOfficialArtwork]));

  Map<String, dynamic> toJson() => {
        kOfficialArtwork: officialArtwork,
      };
}
