import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_wiki/features/pokedex/data/datasources/pokedex_remote_datasource.dart';
import 'package:pokemon_wiki/features/pokedex/data/repositories/pokedex_repository_impl.dart';
import 'package:pokemon_wiki/features/pokedex/domain/usecases/get_pokedex_data.dart';
import 'package:pokemon_wiki/features/pokedex/presentation/bloc/pokedex_bloc.dart';
import 'package:pokemon_wiki/features/pokedex/presentation/pages/pokedex_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    http.Client client = http.Client();
    PokedexRemoteDatasourceImpl pokedexRemoteDatasourceImpl =
        PokedexRemoteDatasourceImpl(httpClient: client);
    PokedexRepositoryImpl pokedexRepositoryImpl = PokedexRepositoryImpl(
        pokedexRemoteDatasource: pokedexRemoteDatasourceImpl);
    GetPokedexData getPokedexData =
        GetPokedexData(pokedexRepository: pokedexRepositoryImpl);
    PokedexBloc pokedexBloc = PokedexBloc(getPokedexData: getPokedexData);
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (_, child) {
          return BlocProvider(
            create: (context) => pokedexBloc..add(LoadPokedexEvent()),
            child: MaterialApp(
              title: 'Pokemon Wiki',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const PokedexPage(),
            ),
          );
        });
  }
}
