import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poke_clean_arc_example/poke.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonModel> getPokemon({required PokemonParams params});
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  const PokemonRemoteDataSourceImpl({required this.dio});

  @override
  Future<PokemonModel> getPokemon({required PokemonParams params}) async {
    try {
      final response = await dio.get('$kGetPokemonUrl/${params.id}');

      if (response.statusCode == 200) {
        return PokemonModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } on PlatformException {
      throw ServerException();
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException();
    }
  }
}
