import 'package:poke_clean_arc_example/poke.dart';

class TypesModel extends TypesEntity {
  const TypesModel({required super.type});

  static List<TypesModel> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((json) => TypesModel.fromJson(json)).toList();

  factory TypesModel.fromJson(Map<String, dynamic> json) => TypesModel(
        type: TypeModel.fromJson(json[kType]),
      );

  Map<String, dynamic> toJson() => {
        kType: type,
      };
}
