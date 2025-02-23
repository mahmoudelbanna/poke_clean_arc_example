import 'package:equatable/equatable.dart';
import 'package:poke_clean_arc_example/poke.dart';

class TypeEntity extends Equatable {
  final String name;
  const TypeEntity({required this.name});

  @override
  List<Object?> get props => [name];

  @override
  String toString() => 'TypeEntity(name: $name)';

  TypeEntity copyWith({String? name}) {
    return TypeEntity(name: name ?? this.name);
  }

  Map<String, dynamic> toMap() {
    return {kName: name};
  }
}
