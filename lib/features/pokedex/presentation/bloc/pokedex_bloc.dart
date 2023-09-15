import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_wiki/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokemon_wiki/features/pokedex/domain/usecases/get_pokedex_data.dart';

part 'pokedex_event.dart';

part 'pokedex_state.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  final GetPokedexData getPokedexData;

  PokedexBloc({required this.getPokedexData}) : super(PokedexInitial()) {
    on<LoadPokedexEvent>((event, emit) async {
      final result = await getPokedexData();
      result.fold((l) {


      }, (r) {
        emit(PokedexLoaded(pokemonList: r));
      });
    });
  }
}
