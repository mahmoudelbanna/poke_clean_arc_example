import 'package:equatable/equatable.dart';
import 'package:poke_clean_arc_example/poke.dart';

class OfficialArtworkEntity extends Equatable {
  final String frontDefault;
  final String frontShiny;
  const OfficialArtworkEntity({
    required this.frontDefault,
    required this.frontShiny,
  });

  @override
  List<Object?> get props => [frontDefault, frontShiny];

  @override
  String toString() =>
      'OfficialArtworkEntity(frontDefault: $frontDefault, frontShiny: $frontShiny)';

  OfficialArtworkEntity copyWith({String? frontDefault, String? frontShiny}) {
    return OfficialArtworkEntity(
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
    );
  }

  Map<String, dynamic> toMap() {
    return {kFrontDefault: frontDefault, kFrontShiny: frontShiny};
  }
}
