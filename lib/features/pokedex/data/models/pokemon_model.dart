import 'package:pokemon_wiki/features/pokedex/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required super.name,
    required super.types,
    required super.imageUrl,
    required super.species,
    required super.height,
    required super.weight,
    required super.abillities,
    required super.gander,
    required super.eggGroup,
    required super.eggCycle,
    required super.hp,
    required super.attack,
    required super.defense,
    required super.specialAttack,
    required super.specialDefense,
    required super.speed,
    required super.totalStats,
    required super.typeDefenses,
    required super.id,
  });

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    List<dynamic> types = map['types'];
    List<dynamic> abilities = map['abilities'];
    List<dynamic> stats = map['stats'];
    Map<String,dynamic> imageOther = map['sprites']['other'];
    return PokemonModel(
        name: map['name'],
        types: types.map((e) => e['type']['name'].toString()).toList(),
        imageUrl: imageOther['dream_world']['front_default'],
        species: map['species']['name'],
        height: map['height'].toString(),
        weight: map['weight'].toString(),
        abillities:
            abilities.map((e) => e['ability']['name'].toString()).toList(),
        gander: 12,
        eggGroup: 'Monster',
        eggCycle: 'Grass',
        hp: stats[0]['base_stat'],
        attack: stats[1]['base_stat'],
        defense: stats[2]['base_stat'],
        specialAttack: stats[3]['base_stat'],
        specialDefense: stats[4]['base_stat'],
        speed: stats[5]['base_stat'],
        totalStats: stats[0]['base_stat'] +
            stats[1]['base_stat'] +
            stats[2]['base_stat'] +
            stats[3]['base_stat'] +
            stats[4]['base_stat'] +
            stats[5]['base_stat'],
        typeDefenses: 'The Effectiveness of each type on ${map['name']}',
        id: map['id']);
  }
}
