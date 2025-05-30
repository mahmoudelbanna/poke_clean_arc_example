// Mocks generated by Mockito 5.4.5 from annotations
// in poke_clean_arc_example/test/features/pokemon/presentation/widgets/pokemon_page_widgets/search_pokemon_widgets/search_data_widget_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:hydrated_bloc/hydrated_bloc.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;
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

class _FakeSelectedPokemonItemState_0 extends _i1.SmartFake
    implements _i2.SelectedPokemonItemState {
  _FakeSelectedPokemonItemState_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [SelectedPokemonItemCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockSelectedPokemonItemCubit extends _i1.Mock
    implements _i2.SelectedPokemonItemCubit {
  MockSelectedPokemonItemCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SelectedPokemonItemState get state =>
      (super.noSuchMethod(
            Invocation.getter(#state),
            returnValue: _FakeSelectedPokemonItemState_0(
              this,
              Invocation.getter(#state),
            ),
          )
          as _i2.SelectedPokemonItemState);

  @override
  _i3.Stream<_i2.SelectedPokemonItemState> get stream =>
      (super.noSuchMethod(
            Invocation.getter(#stream),
            returnValue: _i3.Stream<_i2.SelectedPokemonItemState>.empty(),
          )
          as _i3.Stream<_i2.SelectedPokemonItemState>);

  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);

  @override
  String get id =>
      (super.noSuchMethod(
            Invocation.getter(#id),
            returnValue: _i4.dummyValue<String>(this, Invocation.getter(#id)),
          )
          as String);

  @override
  String get storagePrefix =>
      (super.noSuchMethod(
            Invocation.getter(#storagePrefix),
            returnValue: _i4.dummyValue<String>(
              this,
              Invocation.getter(#storagePrefix),
            ),
          )
          as String);

  @override
  String get storageToken =>
      (super.noSuchMethod(
            Invocation.getter(#storageToken),
            returnValue: _i4.dummyValue<String>(
              this,
              Invocation.getter(#storageToken),
            ),
          )
          as String);

  @override
  void changeParamsId({required int? newId}) => super.noSuchMethod(
    Invocation.method(#changeParamsId, [], {#newId: newId}),
    returnValueForMissingStub: null,
  );

  @override
  _i2.SelectedPokemonItemState? fromJson(Map<String, dynamic>? json) =>
      (super.noSuchMethod(Invocation.method(#fromJson, [json]))
          as _i2.SelectedPokemonItemState?);

  @override
  Map<String, dynamic>? toJson(_i2.SelectedPokemonItemState? state) =>
      (super.noSuchMethod(Invocation.method(#toJson, [state]))
          as Map<String, dynamic>?);

  @override
  void emit(_i2.SelectedPokemonItemState? state) => super.noSuchMethod(
    Invocation.method(#emit, [state]),
    returnValueForMissingStub: null,
  );

  @override
  void onChange(_i5.Change<_i2.SelectedPokemonItemState>? change) =>
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
  _i3.Future<void> close() =>
      (super.noSuchMethod(
            Invocation.method(#close, []),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  void hydrate() => super.noSuchMethod(
    Invocation.method(#hydrate, []),
    returnValueForMissingStub: null,
  );

  @override
  _i3.Future<void> clear() =>
      (super.noSuchMethod(
            Invocation.method(#clear, []),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);
}
