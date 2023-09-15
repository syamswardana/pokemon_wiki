import 'package:dartz/dartz.dart';
import 'package:pokemon_wiki/core/errors/failures.dart';
import 'package:pokemon_wiki/features/pokedex/data/datasources/pokedex_remote_datasource.dart';
import 'package:pokemon_wiki/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokemon_wiki/features/pokedex/domain/repositories/pokedex_repository.dart';

class PokedexRepositoryImpl implements PokedexRepository {
  final PokedexRemoteDatasource pokedexRemoteDatasource;

  PokedexRepositoryImpl({required this.pokedexRemoteDatasource});

  @override
  Future<Either<Failure, List<Pokemon>>> getPokedexData() async {
    try {
      final result = await pokedexRemoteDatasource.getListPokemon();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
