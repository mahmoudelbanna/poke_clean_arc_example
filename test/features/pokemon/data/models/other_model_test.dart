import 'package:flutter_test/flutter_test.dart';
import 'package:poke_clean_arc_example/poke.dart';

/// Main function to test the OtherModel class.
///
/// This test verifies that the OtherModel instance is a subclass of OtherEntity.

void main() {
  final OtherModel tOtherModel = OtherModel(
    officialArtwork: OfficialArtworkModel(
      frontDefault: 'frontDefault',
      frontShiny: 'frontShiny',
    ),
  );
  test('should be a subclass of OtherEntity entity', () async {
    // assert
    expect(tOtherModel, isA<OtherEntity>());
  });
}
