import 'package:flutter_test/flutter_test.dart';
import 'package:poke_clean_arc_example/poke.dart';

/// Tests that [SpritesModel] is a subclass of [SpritesEntity].
///
/// It creates a [SpritesModel] instance and asserts that it is a subclass of
/// [SpritesEntity].
void main() {
  final SpritesModel tSpritesModel = SpritesModel(
    other: OtherModel(
      officialArtwork: OfficialArtworkModel(
        frontDefault: 'frontDefault',
        frontShiny: 'frontShiny',
      ),
    ),
  );
  test('should be a subclass of SpritesEntity entity', () async {
    // assert
    expect(tSpritesModel, isA<SpritesEntity>());
  });
}
