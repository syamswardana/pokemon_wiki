import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon_wiki/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokemon_wiki/features/pokedex/domain/repositories/pokedex_repository.dart';
import 'package:pokemon_wiki/features/pokedex/domain/usecases/get_pokedex_data.dart';

import 'get_pokedex_data_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PokedexRepository>()])
void main() {
  late MockPokedexRepository pokedexRepository;
  late GetPokedexData getPokedexDataUsecase;

  setUp(() {
    pokedexRepository = MockPokedexRepository();
    getPokedexDataUsecase =
        GetPokedexData(pokedexRepository: pokedexRepository);
  });

  test('get pokedex data', () async {
    List<Pokemon> pokedexData = [
      Pokemon(
          id: 1,
          name: 'Bulbasaur',
          types: ['Glass', 'Poison'],
          imageUrl:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
          species: 'Seed',
          height: '7',
          weight: '69',
          abillities: [
            'overgrow',
            'chlorophyll',
          ],
          gander: 12,
          eggGroup: 'Monster',
          eggCycle: 'Glass',
          hp: 45,
          attack: 49,
          defense: 49,
          specialAttack: 65,
          specialDefense: 65,
          speed: 45,
          totalStats: 317,
          typeDefenses: 'The Effectiveness of each type on Charmarder')
    ];
    when(pokedexRepository.getPokedexData())
        .thenAnswer((_) async => Right(pokedexData));
    final result = await getPokedexDataUsecase();
    expect(result, Right(pokedexData));
  });
}
