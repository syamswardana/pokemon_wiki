
import 'package:dartz/dartz.dart';
import 'package:pokemon_wiki/core/errors/failures.dart';
import 'package:pokemon_wiki/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokemon_wiki/features/pokedex/domain/repositories/pokedex_repository.dart';

class GetPokedexData {
  final PokedexRepository pokedexRepository;

  GetPokedexData({required this.pokedexRepository});

  Future<Either<Failure, List<Pokemon>>> call() async{
    return await pokedexRepository.getPokedexData();
  }
}