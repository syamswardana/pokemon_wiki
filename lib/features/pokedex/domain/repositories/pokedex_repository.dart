import 'package:dartz/dartz.dart';
import 'package:pokemon_wiki/core/errors/failures.dart';
import 'package:pokemon_wiki/features/pokedex/domain/entities/pokemon.dart';

abstract class PokedexRepository {
  Future<Either<Failure,List<Pokemon>>> getPokedexData();
}