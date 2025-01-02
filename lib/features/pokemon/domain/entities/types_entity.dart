import 'package:equatable/equatable.dart';

import 'package:poke_clean_arc_example/poke.dart';

class TypesEntity extends Equatable {
  final TypeEntity type;
  const TypesEntity({
    required this.type,
  });

  @override
  List<Object?> get props => [type];

  @override
  String toString() => 'TypesEntity(type: $type)';

  TypesEntity copyWith({
    TypeEntity? type,
  }) {
    return TypesEntity(
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      kType: type.toMap(),
    };
  }
}
