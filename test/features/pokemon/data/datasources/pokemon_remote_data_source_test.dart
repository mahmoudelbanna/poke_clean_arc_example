import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:poke_clean_arc_example/poke.dart';

import '../../../../fixtures/actual_article_json.dart';
import '../../../../fixtures/fixture_reader.dart';
import '../../../../fixtures/test_pokemon_data.dart';
import 'pokemon_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
/// Tests for [PokemonRemoteDataSourceImpl].
///
/// The [PokemonRemoteDataSourceImpl] is tested by mocking the [Dio] client
/// and verifying that it calls the correct url and returns the correct
/// [PokemonModel] when the response code is 200. It also tests that it throws
/// a [ServerException] when the response code is 404 or other.
///
/// The [PokemonRemoteDataSourceImpl] is tested in the following ways:
///
/// 1. Should call dio.get.
/// 2. Should return PokemonModel when the response code is 200.
/// 3. Should throw a ServerException when the response code is 404 or other.
void main() {
  late PokemonRemoteDataSourceImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = PokemonRemoteDataSourceImpl(dio: mockDio);
  });

  final tPokemonParams = TestPokemonData.pokemonParams;
  final RequestOptions requestOptions = RequestOptions();
  final String actualArticlesJson = fixture('pokemon.json');
  final url = '$kGetPokemonUrl/${tPokemonParams.id}';

  void setUpMockHttpClientSuccess200() => when(mockDio.get(any)).thenAnswer(
    (_) async => Response(
      requestOptions: requestOptions,
      data: actualArticlesJsonToMap,
      statusCode: 200,
    ),
  );
  void setUpMockHttpClientFailure400() => when(mockDio.get(any)).thenAnswer(
    (_) async => Response(
      requestOptions: requestOptions,
      data: actualArticlesJsonToMap,
      statusCode: 400,
    ),
  );

  group('call dio.get', () {
    test('should call dio.get', () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      await dataSource.getPokemon(params: tPokemonParams);
      // assert
      verify(mockDio.get(url));
    });
  });

  group('should return PokemonModel when the response code is 200', () {
    final tPokemonModel = PokemonModel.fromJson(
      json.decode(actualArticlesJson),
    );

    test(
      'should return NumberTrivia when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.getPokemon(params: tPokemonParams);
        // assert
        expect(result, tPokemonModel);
      },
    );
  });

  group(
    'should throw a ServerException when the response code is 404 or other',
    () {
      test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
          // arrange
          setUpMockHttpClientFailure400();
          // act
          final call = dataSource.getPokemon(params: tPokemonParams);
          // assert
          expect(call, throwsA(TypeMatcher<ServerException>()));
        },
      );
    },
  );
}
