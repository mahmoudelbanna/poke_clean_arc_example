import 'package:poke_clean_arc_example/poke.dart';

class TestPokemonData {
  static final PokemonEntity pokemon = const PokemonEntity(
    id: 1,
    name: 'Bulbasaur',
    types: [TypesEntity(type: TypeEntity(name: 'Grass'))],
    sprites: SpritesEntity(
      other: OtherEntity(
        officialArtwork: OfficialArtworkEntity(
          frontDefault: 'https://example.com/default.png',
          frontShiny: 'https://example.com/shiny.png',
        ),
      ),
    ),
  );

  static final PokemonParams pokemonParams = const PokemonParams(id: '1');
}
