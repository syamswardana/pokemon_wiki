import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_wiki/features/pokedex/data/models/pokemon_model.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  PokemonModel pokemonModel = PokemonModel(
      id: 1,
      name: 'bulbasaur',
      types: ['grass', 'poison'],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg',
      species: 'bulbasaur',
      height: '7',
      weight: '69',
      abillities: [
        'overgrow',
        'chlorophyll',
      ],
      gander: 12,
      eggGroup: 'Monster',
      eggCycle: 'Grass',
      hp: 45,
      attack: 49,
      defense: 49,
      specialAttack: 65,
      specialDefense: 65,
      speed: 45,
      totalStats: 318,
      typeDefenses: 'The Effectiveness of each type on bulbasaur');

  final Map<String, dynamic> jsonMap =
      jsonDecode(fixture('single_pokemon.json'));

  test('From Map', () {
    expect(PokemonModel.fromMap(jsonMap), pokemonModel);
  });
}
