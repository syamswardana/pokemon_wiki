import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon_wiki/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokemon_wiki/features/pokedex/presentation/widgets/line_bar.dart';

class PokemonDetailPage extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  TextStyle titleDetail =
      const TextStyle(color: Color(0xffb6b9bd), fontWeight: FontWeight.bold);
  TextStyle subDetail =
      const TextStyle(color: Colors.black, fontWeight: FontWeight.w500);
  TableRow spacer = TableRow(children: [
    SizedBox(
      height: 5.h,
    ),
    SizedBox(
      height: 5.h,
    )
  ]);
  TableRow spacer2 = TableRow(children: [
    SizedBox(
      height: 5.h,
    ),
    SizedBox(
      height: 5.h,
    ),
    SizedBox(
      height: 5.h,
    ),
  ]);

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: -30.w,
              width: 200.w,
              height: 200.h,
              top: 150.h,
              child: SvgPicture.asset(
                'assets/pokeball.svg',
                color: const Color(0xFFf5f5f6).withOpacity(0.25),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0).copyWith(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.pokemon.name[0].toUpperCase() +
                                widget.pokemon.name.substring(1),
                            style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: double.minPositive,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: widget.pokemon.types.length,
                                itemBuilder: (context, indexTypes) {
                                  return Wrap(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(right: 5),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color:
                                                Colors.white.withOpacity(0.25)),
                                        child: Text(
                                          widget.pokemon.types[indexTypes][0]
                                                  .toUpperCase() +
                                              widget.pokemon.types[indexTypes]
                                                  .substring(1),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.sp),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ],
                      ),
                      Text(
                        '#${widget.pokemon.id.toString().padLeft(3, '0')}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            height: 360.h,
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                TabBar(controller: tabController, tabs: const [
                  Tab(
                    text: 'About',
                  ),
                  Tab(
                    text: 'Base Stat',
                  )
                ]),
                Expanded(
                    child: TabBarView(
                  controller: tabController,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              TableRow(children: [
                                Text(
                                  'Species',
                                  style: titleDetail,
                                ),
                                Text(
                                  widget.pokemon.species[0].toUpperCase() +
                                      widget.pokemon.name.substring(1),
                                  style: subDetail,
                                )
                              ]),
                              spacer,
                              TableRow(children: [
                                Text(
                                  'Height',
                                  style: titleDetail,
                                ),
                                Text(
                                  widget.pokemon.height,
                                  style: subDetail,
                                )
                              ]),
                              spacer,
                              TableRow(children: [
                                Text(
                                  'Weight',
                                  style: titleDetail,
                                ),
                                Text(
                                  widget.pokemon.weight,
                                  style: subDetail,
                                )
                              ]),
                              spacer,
                              TableRow(children: [
                                Text(
                                  'Abillities',
                                  style: titleDetail,
                                ),
                                Text(
                                  widget.pokemon.abillities
                                      .map((e) =>
                                          e[0].toUpperCase() + e.substring(1))
                                      .join(', '),
                                  style: subDetail,
                                )
                              ])
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Table(
                            columnWidths: const {
                              0: FlexColumnWidth(3),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(5),
                            },
                            children: [
                              TableRow(children: [
                                Text(
                                  'HP',
                                  style: titleDetail,
                                ),
                                Text(
                                  widget.pokemon.hp.toString(),
                                  style: subDetail,
                                ),
                                LineBar(
                                  value: widget.pokemon.hp,
                                ),
                              ]),
                              spacer2,
                              TableRow(children: [
                                Text(
                                  'Attack',
                                  style: titleDetail,
                                ),
                                Text(
                                  widget.pokemon.attack.toString(),
                                  style: subDetail,
                                ),
                                LineBar(
                                  value: widget.pokemon.attack,
                                ),
                              ]),
                              spacer2,
                              TableRow(children: [
                                Text(
                                  'Defense',
                                  style: titleDetail,
                                ),
                                Text(
                                  widget.pokemon.defense.toString(),
                                  style: subDetail,
                                ),
                                LineBar(
                                  value: widget.pokemon.defense,
                                ),
                              ]),
                              spacer2,
                              TableRow(children: [
                                Text(
                                  'Sp. Atk',
                                  style: titleDetail,
                                ),
                                Text(
                                  widget.pokemon.specialAttack.toString(),
                                  style: subDetail,
                                ),
                                LineBar(
                                  value: widget.pokemon.specialAttack,
                                ),
                              ]),
                              spacer2,
                              TableRow(children: [
                                Text(
                                  'Sp. Def',
                                  style: titleDetail,
                                ),
                                Text(
                                  widget.pokemon.specialDefense.toString(),
                                  style: subDetail,
                                ),
                                LineBar(
                                  value: widget.pokemon.specialDefense,
                                ),
                              ]),
                              spacer2,
                              TableRow(children: [
                                Text(
                                  'Speed',
                                  style: titleDetail,
                                ),
                                Text(
                                  widget.pokemon.speed.toString(),
                                  style: subDetail,
                                ),
                                LineBar(
                                  value: widget.pokemon.speed,
                                ),
                              ]),
                              spacer2,
                              TableRow(children: [
                                Text(
                                  'Total',
                                  style: titleDetail,
                                ),
                                Text(
                                  widget.pokemon.totalStats.toString(),
                                  style: subDetail,
                                ),
                                LineBar(
                                  value: widget.pokemon.totalStats,
                                  maxValue: 500,
                                ),
                              ])
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
          Positioned(
            right: 75.h,
            left: 75.h,
            top: -160.h,
            height: 200.h,
            child: SvgPicture.network(
              widget.pokemon.imageUrl,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0Xff46d1b2),
    );
  }
}
