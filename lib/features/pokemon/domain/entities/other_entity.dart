import 'package:equatable/equatable.dart';

import 'package:poke_clean_arc_example/poke.dart';

class OtherEntity extends Equatable {
  final OfficialArtworkEntity officialArtwork;
  const OtherEntity({required this.officialArtwork});

  @override
  List<Object?> get props => [officialArtwork];

  @override
  String toString() => 'OtherEntity(officialArtwork: $officialArtwork)';

  OtherEntity copyWith({OfficialArtworkEntity? officialArtwork}) {
    return OtherEntity(
      officialArtwork: officialArtwork ?? this.officialArtwork,
    );
  }

  Map<String, dynamic> toMap() {
    return {kOfficialArtwork: officialArtwork.toMap()};
  }
}
