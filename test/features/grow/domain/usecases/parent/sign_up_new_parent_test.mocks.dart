// Mocks generated by Mockito 5.0.13 from annotations
// in grow_run_v1/test/features/grow/domain/usecases/parent/sign_up_new_parent_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:grow_run_v1/core/error/failures.dart' as _i5;
import 'package:grow_run_v1/features/grow/domain/entities/parent/parent_entity.dart'
    as _i6;
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart'
    as _i8;
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart'
    as _i7;
import 'package:grow_run_v1/features/grow/domain/repositories/parent_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [ParentRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockParentRepository extends _i1.Mock implements _i3.ParentRepository {
  MockParentRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> createParentData(
          _i6.ParentEntity? parentUser) =>
      (super.noSuchMethod(Invocation.method(#createParentData, [parentUser]),
              returnValue: Future<_i2.Either<_i5.Failure, void>>.value(
                  _FakeEither<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> editParentUser(
          _i6.ParentEntity? user) =>
      (super.noSuchMethod(Invocation.method(#editParentUser, [user]),
              returnValue: Future<_i2.Either<_i5.Failure, void>>.value(
                  _FakeEither<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.ParentEntity>>> getParents(
          String? requestedBy) =>
      (super.noSuchMethod(Invocation.method(#getParents, [requestedBy]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.ParentEntity>>>.value(
                      _FakeEither<_i5.Failure, List<_i6.ParentEntity>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.ParentEntity>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.ParentEntity>>> getParentByID(
          List<String>? parentIDs, String? requestedBy) =>
      (super.noSuchMethod(
              Invocation.method(#getParentByID, [parentIDs, requestedBy]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.ParentEntity>>>.value(
                      _FakeEither<_i5.Failure, List<_i6.ParentEntity>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.ParentEntity>>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [AuthenticationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationRepository extends _i1.Mock
    implements _i7.AuthenticationRepository {
  MockAuthenticationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<_i8.UserEntity> get user =>
      (super.noSuchMethod(Invocation.getter(#user),
              returnValue: Stream<_i8.UserEntity>.empty())
          as _i4.Stream<_i8.UserEntity>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i8.UserEntity>> authenticateUser(
          String? email, String? password) =>
      (super.noSuchMethod(
          Invocation.method(#authenticateUser, [email, password]),
          returnValue: Future<_i2.Either<_i5.Failure, _i8.UserEntity>>.value(
              _FakeEither<_i5.Failure, _i8.UserEntity>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i8.UserEntity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i8.UserEntity>> signUpUser(
          {String? dependentEmail,
          String? dependentPassword,
          String? dependencyEmail,
          String? dependencyPassword,
          _i8.UserType? dependentUserType,
          _i8.UserType? dependencyUserType,
          Map<String, dynamic>? dependentData}) =>
      (super.noSuchMethod(
          Invocation.method(#signUpUser, [], {
            #dependentEmail: dependentEmail,
            #dependentPassword: dependentPassword,
            #dependencyEmail: dependencyEmail,
            #dependencyPassword: dependencyPassword,
            #dependentUserType: dependentUserType,
            #dependencyUserType: dependencyUserType,
            #dependentData: dependentData
          }),
          returnValue: Future<_i2.Either<_i5.Failure, _i8.UserEntity>>.value(
              _FakeEither<_i5.Failure, _i8.UserEntity>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i8.UserEntity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i8.UserEntity>> registerUser(
          String? email, String? password) =>
      (super.noSuchMethod(Invocation.method(#registerUser, [email, password]),
          returnValue: Future<_i2.Either<_i5.Failure, _i8.UserEntity>>.value(
              _FakeEither<_i5.Failure, _i8.UserEntity>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i8.UserEntity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> loginUser(
          String? email, String? password) =>
      (super.noSuchMethod(Invocation.method(#loginUser, [email, password]),
              returnValue: Future<_i2.Either<_i5.Failure, void>>.value(
                  _FakeEither<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> signOutUser() =>
      (super.noSuchMethod(Invocation.method(#signOutUser, []),
              returnValue: Future<_i2.Either<_i5.Failure, void>>.value(
                  _FakeEither<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> disableUserAccount(
          String? userID) =>
      (super.noSuchMethod(Invocation.method(#disableUserAccount, [userID]),
              returnValue: Future<_i2.Either<_i5.Failure, void>>.value(
                  _FakeEither<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i8.UserEntity>> enableUserAccount(
          String? userID) =>
      (super.noSuchMethod(Invocation.method(#enableUserAccount, [userID]),
          returnValue: Future<_i2.Either<_i5.Failure, _i8.UserEntity>>.value(
              _FakeEither<_i5.Failure, _i8.UserEntity>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i8.UserEntity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i8.UserEntity>> getCredentials() =>
      (super.noSuchMethod(Invocation.method(#getCredentials, []),
          returnValue: Future<_i2.Either<_i5.Failure, _i8.UserEntity>>.value(
              _FakeEither<_i5.Failure, _i8.UserEntity>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i8.UserEntity>>);
  @override
  _i2.Either<_i5.Failure, String> getCurrentUserID() =>
      (super.noSuchMethod(Invocation.method(#getCurrentUserID, []),
              returnValue: _FakeEither<_i5.Failure, String>())
          as _i2.Either<_i5.Failure, String>);
  @override
  String toString() => super.toString();
}
