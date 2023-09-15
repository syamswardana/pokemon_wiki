import 'dart:convert';
import 'dart:io';

import 'package:pokemon_wiki/features/pokedex/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

abstract class PokedexRemoteDatasource {
  Future<List<PokemonModel>> getListPokemon();
}

class PokedexRemoteDatasourceImpl implements PokedexRemoteDatasource {
  final http.Client httpClient;

  PokedexRemoteDatasourceImpl({required this.httpClient});

  @override
  Future<List<PokemonModel>> getListPokemon() async {
    List<PokemonModel> listPokemon = [];
    Uri listPokemonUri = Uri.parse('https://pokeapi.co/api/v2/pokemon/');
    final result = await httpClient.get(listPokemonUri);

    if (result.statusCode != HttpStatus.ok) {
      throw http.ClientException('Failed get data pokemon');
    } else {
      Map<String, dynamic> response = jsonDecode(result.body);
      if (response['results'] != null) {
        List<dynamic> mapListPokemon = response['results'];
        for (final pokemon in mapListPokemon) {
          final resultPokemon = await httpClient.get(Uri.parse(pokemon['url']));
          if (result.statusCode != HttpStatus.ok) {
            throw http.ClientException('Failed get data pokemon');
          } else {
            listPokemon
                .add(PokemonModel.fromMap(jsonDecode(resultPokemon.body)));
          }
        }
      } else {
        throw http.ClientException('Failed get data pokemon');
      }
    }
    return listPokemon;
  }
}
