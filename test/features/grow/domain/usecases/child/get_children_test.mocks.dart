// Mocks generated by Mockito 5.0.15 from annotations
// in grow_run_v1/test/features/grow/domain/usecases/child/get_children_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:grow_run_v1/core/error/failures.dart' as _i5;
import 'package:grow_run_v1/features/grow/domain/entities/child/child_entity.dart'
    as _i6;
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [ChildRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockChildRepository extends _i1.Mock implements _i3.ChildRepository {
  MockChildRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> createChildData(
          _i6.ChildEntity? childUser, String? childID) =>
      (super.noSuchMethod(
              Invocation.method(#createChildData, [childUser, childID]),
              returnValue: Future<_i2.Either<_i5.Failure, void>>.value(
                  _FakeEither_0<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> editChildUser(
          _i6.ChildEntity? child, String? childID) =>
      (super.noSuchMethod(Invocation.method(#editChildUser, [child, childID]),
              returnValue: Future<_i2.Either<_i5.Failure, void>>.value(
                  _FakeEither_0<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.ChildEntity>> getChild(
          String? childID) =>
      (super.noSuchMethod(Invocation.method(#getChild, [childID]),
          returnValue: Future<_i2.Either<_i5.Failure, _i6.ChildEntity>>.value(
              _FakeEither_0<_i5.Failure, _i6.ChildEntity>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i6.ChildEntity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.ChildEntity>>> getChildren(
          String? requestedBy) =>
      (super.noSuchMethod(Invocation.method(#getChildren, [requestedBy]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.ChildEntity>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i6.ChildEntity>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.ChildEntity>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.ChildEntity>>> getChildrenByID(
          List<String>? childrenIDs, String? requestedBy) =>
      (super.noSuchMethod(
              Invocation.method(#getChildrenByID, [childrenIDs, requestedBy]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.ChildEntity>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i6.ChildEntity>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.ChildEntity>>>);
  @override
  _i4.Future<
      _i2.Either<_i5.Failure, List<_i6.ChildEntity>>> getChildrenBySchool(
          String? schoolID, String? requestedBy) =>
      (super.noSuchMethod(
              Invocation.method(#getChildrenBySchool, [schoolID, requestedBy]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.ChildEntity>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i6.ChildEntity>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.ChildEntity>>>);
  @override
  String toString() => super.toString();
}
