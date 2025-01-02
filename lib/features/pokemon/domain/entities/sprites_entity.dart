import 'package:equatable/equatable.dart';

import 'package:poke_clean_arc_example/poke.dart';

class SpritesEntity extends Equatable {
  final OtherEntity other;
  const SpritesEntity({
    required this.other,
  });

  @override
  List<Object?> get props => [other];

  @override
  String toString() => 'SpritesEntity(other: $other)';

  SpritesEntity copyWith({
    OtherEntity? other,
  }) {
    return SpritesEntity(
      other: other ?? this.other,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      kOther: other.toMap(),
    };
  }
}
