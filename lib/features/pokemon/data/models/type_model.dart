import 'package:poke_clean_arc_example/poke.dart';

class TypeModel extends TypeEntity {
  const TypeModel({required super.name});

  factory TypeModel.fromJson(Map<String, dynamic> json) =>
      TypeModel(name: json[kName]);

  Map<String, dynamic> toJson() => {kName: name};
}
