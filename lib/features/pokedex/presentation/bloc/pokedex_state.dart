part of 'pokedex_bloc.dart';

abstract class PokedexState extends Equatable {
  const PokedexState();
}

class PokedexInitial extends PokedexState {
  @override
  List<Object> get props => [];
}

class PokedexLoaded extends PokedexState {
  final List<Pokemon> pokemonList;

  const PokedexLoaded({required this.pokemonList});
  @override
  List<Object> get props => [pokemonList];
}