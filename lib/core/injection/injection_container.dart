import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:poke_clean_arc_example/poke.dart';

final getIt = GetIt.instance;

void init() {
  //!core
  //! Dio client
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );
  //!InternetCubit
  getIt.registerFactory<InternetCubit>(
    () => InternetCubit(
      connectivity: getIt(),
      connectionChecker: getIt(),
    ),
  );
  getIt.registerLazySingleton<Connectivity>(
    () => Connectivity(),
  );
  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.instance,
  );
  //!Features
  //!Pokemon
  //!Bloc
  // fetch_pokemon_cubit
  // cubit
  getIt.registerFactory<FetchPokemonCubit>(
    () => FetchPokemonCubit(
      usecase: getIt(),
    ),
  );
  // usecase
  getIt.registerLazySingleton<GetPokemon>(
    () => GetPokemon(
      repository: getIt(),
    ),
  );
  // repository
  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      remoteDataSource: getIt(),
    ),
  );
  // datasource
  getIt.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(
      dio: getIt(),
    ),
  );
  //selected_pokemon_item_cubit
  getIt.registerFactory<SelectedPokemonItemCubit>(
    () => SelectedPokemonItemCubit(),
  );
}
