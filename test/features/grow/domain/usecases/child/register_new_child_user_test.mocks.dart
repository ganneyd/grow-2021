// Mocks generated by Mockito 5.0.3 from annotations
// in grow_run_v1/test/features/grow/domain/usecases/child/register_new_child_user_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:grow_run_v1/core/error/failures.dart' as _i5;
import 'package:grow_run_v1/features/grow/domain/entities/child/child_entity.dart'
    as _i8;
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart'
    as _i6;
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart'
    as _i3;
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart'
    as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [AuthenticationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationRepository extends _i1.Mock
    implements _i3.AuthenticationRepository {
  MockAuthenticationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.UserEntity>> signUpUser(
          String? email, String? password) =>
      (super.noSuchMethod(Invocation.method(#signUpUser, [email, password]),
              returnValue:
                  Future.value(_FakeEither<_i5.Failure, _i6.UserEntity>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.UserEntity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.UserEntity>> registerUser(
          String? email, String? password) =>
      (super.noSuchMethod(Invocation.method(#registerUser, [email, password]),
              returnValue:
                  Future.value(_FakeEither<_i5.Failure, _i6.UserEntity>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.UserEntity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.UserEntity>> loginUser(
          String? email, String? password) =>
      (super.noSuchMethod(Invocation.method(#loginUser, [email, password]),
              returnValue:
                  Future.value(_FakeEither<_i5.Failure, _i6.UserEntity>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.UserEntity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> signOutUser() =>
      (super.noSuchMethod(Invocation.method(#signOutUser, []),
              returnValue: Future.value(_FakeEither<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> disableUserAccount(
          String? userID) =>
      (super.noSuchMethod(Invocation.method(#disableUserAccount, [userID]),
              returnValue: Future.value(_FakeEither<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.UserEntity>> enableUserAccount(
          String? userID) =>
      (super.noSuchMethod(Invocation.method(#enableUserAccount, [userID]),
              returnValue:
                  Future.value(_FakeEither<_i5.Failure, _i6.UserEntity>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.UserEntity>>);
}

/// A class which mocks [ChildRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockChildRepository extends _i1.Mock implements _i7.ChildRepository {
  MockChildRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> createChildData(
          _i8.ChildEntity? childUser) =>
      (super.noSuchMethod(Invocation.method(#createChildData, [childUser]),
              returnValue: Future.value(_FakeEither<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> editChildUser(
          String? childID, _i8.ChildEntity? child) =>
      (super.noSuchMethod(Invocation.method(#editChildUser, [childID, child]),
              returnValue: Future.value(_FakeEither<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.ChildEntity>>> getChildren(
          String? requestedBy) =>
      (super.noSuchMethod(Invocation.method(#getChildren, [requestedBy]),
              returnValue: Future.value(
                  _FakeEither<_i5.Failure, List<_i8.ChildEntity>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i8.ChildEntity>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.ChildEntity>>> getChildrenByID(
          List<String>? childrenIDs, String? requestedBy) =>
      (super.noSuchMethod(
              Invocation.method(#getChildrenByID, [childrenIDs, requestedBy]),
              returnValue: Future.value(
                  _FakeEither<_i5.Failure, List<_i8.ChildEntity>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i8.ChildEntity>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.ChildEntity>>>
      getChildrenBySchool(String? schoolID, String? requestedBy) =>
          (super.noSuchMethod(
              Invocation.method(#getChildrenBySchool, [schoolID, requestedBy]),
              returnValue: Future.value(
                  _FakeEither<_i5.Failure, List<_i8.ChildEntity>>())) as _i4
              .Future<_i2.Either<_i5.Failure, List<_i8.ChildEntity>>>);
}
