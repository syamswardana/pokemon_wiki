import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon_wiki/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokemon_wiki/features/pokedex/presentation/bloc/pokedex_bloc.dart';
import 'package:pokemon_wiki/features/pokedex/presentation/pages/pokemon_detail_page.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    PokedexBloc pokedexBloc = context.read<PokedexBloc>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(2, -2.0),
              child: SvgPicture.asset(
                'assets/pokeball.svg',
                height: 200.h,
                color: const Color(0xFFf5f5f6),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pokedex',
                      style: TextStyle(
                          color: const Color(0xFF2f3843),
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocBuilder(
                      bloc: pokedexBloc,
                      builder: (context, state) {
                        if (state is PokedexLoaded) {
                          return GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 1.2),
                              itemCount: state.pokemonList.length,
                              itemBuilder: (context, index) {
                                Pokemon pokemon = state.pokemonList[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return PokemonDetailPage(
                                          pokemon: pokemon);
                                    }));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, right: 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF46d1b2),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: const Alignment(1.1, 1.2),
                                          child: SvgPicture.asset(
                                            'assets/pokeball.svg',
                                            height: 70.h,
                                            color:
                                                Colors.white.withOpacity(0.25),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, left: 20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                pokemon.name[0].toUpperCase() +
                                                    pokemon.name.substring(1),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 7.h,
                                              ),
                                              ListView.builder(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      pokemon.types.length,
                                                  itemBuilder:
                                                      (context, indexTypes) {
                                                    return Wrap(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 5),
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.25)),
                                                          child: Text(
                                                            pokemon.types[
                                                                        indexTypes]
                                                                        [0]
                                                                    .toUpperCase() +
                                                                pokemon.types[
                                                                        indexTypes]
                                                                    .substring(
                                                                        1),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    10.sp),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.network(
                                              pokemon.imageUrl,
                                              width: 65.w,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return const CircularProgressIndicator();
                        }
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
