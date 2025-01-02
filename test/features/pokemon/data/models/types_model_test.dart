import 'package:flutter_test/flutter_test.dart';
import 'package:poke_clean_arc_example/poke.dart';

/// Main function for testing the TypesModel class.
///
/// This test verifies that the TypesModel instance is a subclass of
/// TypesEntity by creating a TypesModel with a specific TypeEntity and
/// checking its type.

void main() {
  final TypesModel tTypesModel = TypesModel(
    type: TypeEntity(name: 'Grass'),
  );
  test('should be a subclass of TypesEntity entity', () async {
    // assert
    expect(tTypesModel, isA<TypesEntity>());
  });
}
