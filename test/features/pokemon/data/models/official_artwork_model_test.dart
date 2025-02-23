import 'package:flutter_test/flutter_test.dart';
import 'package:poke_clean_arc_example/poke.dart';

/// Main function to test the OfficialArtworkModel class.
///
/// This function creates an instance of OfficialArtworkModel with sample data
/// and verifies that it is a subclass of OfficialArtworkEntity using a test case.

void main() {
  final OfficialArtworkModel tOfficialArtworkModel = OfficialArtworkModel(
    frontDefault: 'frontDefault',
    frontShiny: 'frontShiny',
  );
  test('should be a subclass of OfficialArtworkEntity entity', () async {
    // assert
    expect(tOfficialArtworkModel, isA<OfficialArtworkEntity>());
  });
}
