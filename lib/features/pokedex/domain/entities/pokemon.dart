import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final List<String> types;
  final String imageUrl;

  //About
  final String species;
  final String height;
  final String weight;
  final List<String> abillities;
  final int gander;
  final String eggGroup;
  final String eggCycle;

  //Base stats
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  final int totalStats;
  final String typeDefenses;

  const Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.imageUrl,
    required this.species,
    required this.height,
    required this.weight,
    required this.abillities,
    required this.gander,
    required this.eggGroup,
    required this.eggCycle,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.totalStats,
    required this.typeDefenses,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        types,
        imageUrl,
        species,
        height,
        weight,
        abillities,
        gander,
        eggGroup,
        eggCycle,
        hp,
        attack,
        defense,
        specialAttack,
        specialDefense,
        speed,
        totalStats,
        typeDefenses,
      ];
}
