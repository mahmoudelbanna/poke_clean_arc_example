import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:poke_clean_arc_example/poke.dart';

import '../../../../fixtures/fixture_reader.dart';

  /// Test PokemonModel
  ///
  /// Test PokemonModel to ensure:
  ///
  /// 1. PokemonModel is a subclass of PokemonEntity entity
  /// 2. PokemonModel.fromJson() returns a valid model when the JSON number is
  ///    correct
  /// 3. PokemonModel.toJson() returns a JSON map containing the proper data
void main() {
  final PokemonModel tPokemonModel = PokemonModel(
    name: 'name',
    id: 1,
    sprites: SpritesModel(
      other: OtherModel(
        officialArtwork: OfficialArtworkModel(
          frontDefault: 'frontDefault',
          frontShiny: 'frontShiny',
        ),
      ),
    ),
    types: [
      TypesModel(
        type: TypeModel(name: 'Grass'),
      ),
    ],
  );
  test('should be a subclass of PokemonEntity entity', () async {
    // assert
    expect(tPokemonModel, isA<PokemonEntity>());
  });

  group('fromJson', () {
    test(
      'should return a valid model when the JSON number tPokemonModel',
      () async {
        final String jsonString = fixture('pokemon.json');
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(jsonString);
        // act
        final result = PokemonModel.fromJson(jsonMap);
        // assert
        expect(result, tPokemonModel);
      },
    );
  });

  group(
    'toJson',
    () {
      test(
        'should return a JSON map containing the proper data',
        () {
          final result = tPokemonModel.toJson();
          final expectedJsonMap = {
            kName: 'name',
            kId: 1,
            kSprites: {
              kOther: {
                kOfficialArtwork: {
                  kFrontDefault: 'frontDefault',
                  kFrontShiny: 'frontShiny',
                },
              },
            },
            kTypes: [
              {
                kType: {kName: 'Grass'},
              },
            ],
          };
          expect(
            result,
            expectedJsonMap,
          );
        },
      );
    },
  );
}
