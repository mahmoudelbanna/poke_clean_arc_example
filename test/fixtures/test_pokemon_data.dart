import 'package:poke_clean_arc_example/features/pokemon/pokemon.dart';

class TestPokemonData {
  static final PokemonEntity pokemon = PokemonEntity(
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
}
