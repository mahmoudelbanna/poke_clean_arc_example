// Mocks generated by Mockito 5.4.5 from annotations
// in poke_clean_arc_example/test/features/pokemon/presentation/pages/data_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_bloc/flutter_bloc.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i3;
import 'package:poke_clean_arc_example/poke.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGetPokemon_0 extends _i1.SmartFake implements _i2.GetPokemon {
  _FakeGetPokemon_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [FetchPokemonCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchPokemonCubit extends _i1.Mock implements _i2.FetchPokemonCubit {
  MockFetchPokemonCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetPokemon get usecase =>
      (super.noSuchMethod(
            Invocation.getter(#usecase),
            returnValue: _FakeGetPokemon_0(this, Invocation.getter(#usecase)),
          )
          as _i2.GetPokemon);

  @override
  _i2.FetchPokemonState get state =>
      (super.noSuchMethod(
            Invocation.getter(#state),
            returnValue: _i3.dummyValue<_i2.FetchPokemonState>(
              this,
              Invocation.getter(#state),
            ),
          )
          as _i2.FetchPokemonState);

  @override
  _i4.Stream<_i2.FetchPokemonState> get stream =>
      (super.noSuchMethod(
            Invocation.getter(#stream),
            returnValue: _i4.Stream<_i2.FetchPokemonState>.empty(),
          )
          as _i4.Stream<_i2.FetchPokemonState>);

  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);

  @override
  void fetchPokemon({required _i2.PokemonParams? params}) => super.noSuchMethod(
    Invocation.method(#fetchPokemon, [], {#params: params}),
    returnValueForMissingStub: null,
  );

  @override
  void emit(_i2.FetchPokemonState? state) => super.noSuchMethod(
    Invocation.method(#emit, [state]),
    returnValueForMissingStub: null,
  );

  @override
  void onChange(_i5.Change<_i2.FetchPokemonState>? change) =>
      super.noSuchMethod(
        Invocation.method(#onChange, [change]),
        returnValueForMissingStub: null,
      );

  @override
  void addError(Object? error, [StackTrace? stackTrace]) => super.noSuchMethod(
    Invocation.method(#addError, [error, stackTrace]),
    returnValueForMissingStub: null,
  );

  @override
  void onError(Object? error, StackTrace? stackTrace) => super.noSuchMethod(
    Invocation.method(#onError, [error, stackTrace]),
    returnValueForMissingStub: null,
  );

  @override
  _i4.Future<void> close() =>
      (super.noSuchMethod(
            Invocation.method(#close, []),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);
}