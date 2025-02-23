import 'package:flutter_test/flutter_test.dart';
import 'package:poke_clean_arc_example/poke.dart';

/// Main function to test the TypeModel class.
///
/// This test verifies that the TypeModel instance is a subclass of TypeEntity.

void main() {
  final TypeModel tTypeModel = const TypeModel(name: 'Grass');
  test('should be a subclass of TypeEntity entity', () async {
    // assert
    expect(tTypeModel, isA<TypeEntity>());
  });
}
