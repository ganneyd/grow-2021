// Mocks generated by Mockito 5.0.15 from annotations
// in grow_run_v1/test/features/grow/data/repositories/authentication_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:grow_run_v1/core/error/failures.dart' as _i6;
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart'
    as _i5;
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart'
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

/// A class which mocks [AuthenticationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationRepository extends _i1.Mock
    implements _i3.AuthenticationRepository {
  MockAuthenticationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<_i5.UserEntity> get user =>
      (super.noSuchMethod(Invocation.getter(#user),
              returnValue: Stream<_i5.UserEntity>.empty())
          as _i4.Stream<_i5.UserEntity>);
  @override
  _i4.Future<_i2.Either<_i6.Failure, _i5.UserEntity>> authenticateUser(
          String? email, String? password) =>
      (super.noSuchMethod(
          Invocation.method(#authenticateUser, [email, password]),
          returnValue: Future<_i2.Either<_i6.Failure, _i5.UserEntity>>.value(
              _FakeEither_0<_i6.Failure, _i5.UserEntity>())) as _i4
          .Future<_i2.Either<_i6.Failure, _i5.UserEntity>>);
  @override
  _i4.Future<_i2.Either<_i6.Failure, _i5.UserEntity>> signUpUser(
          {String? dependentEmail,
          String? dependentPassword,
          String? dependencyEmail,
          String? dependencyPassword,
          _i5.UserType? dependentUserType,
          _i5.UserType? dependencyUserType,
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
          returnValue: Future<_i2.Either<_i6.Failure, _i5.UserEntity>>.value(
              _FakeEither_0<_i6.Failure, _i5.UserEntity>())) as _i4
          .Future<_i2.Either<_i6.Failure, _i5.UserEntity>>);
  @override
  _i4.Future<_i2.Either<_i6.Failure, _i5.UserEntity>> registerUser(
          String? email, String? password) =>
      (super.noSuchMethod(Invocation.method(#registerUser, [email, password]),
          returnValue: Future<_i2.Either<_i6.Failure, _i5.UserEntity>>.value(
              _FakeEither_0<_i6.Failure, _i5.UserEntity>())) as _i4
          .Future<_i2.Either<_i6.Failure, _i5.UserEntity>>);
  @override
  _i4.Future<_i2.Either<_i6.Failure, void>> loginUser(
          String? email, String? password) =>
      (super.noSuchMethod(Invocation.method(#loginUser, [email, password]),
              returnValue: Future<_i2.Either<_i6.Failure, void>>.value(
                  _FakeEither_0<_i6.Failure, void>()))
          as _i4.Future<_i2.Either<_i6.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i6.Failure, void>> signOutUser() =>
      (super.noSuchMethod(Invocation.method(#signOutUser, []),
              returnValue: Future<_i2.Either<_i6.Failure, void>>.value(
                  _FakeEither_0<_i6.Failure, void>()))
          as _i4.Future<_i2.Either<_i6.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i6.Failure, void>> disableUserAccount(
          String? userID) =>
      (super.noSuchMethod(Invocation.method(#disableUserAccount, [userID]),
              returnValue: Future<_i2.Either<_i6.Failure, void>>.value(
                  _FakeEither_0<_i6.Failure, void>()))
          as _i4.Future<_i2.Either<_i6.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i6.Failure, _i5.UserEntity>> enableUserAccount(
          String? userID) =>
      (super.noSuchMethod(Invocation.method(#enableUserAccount, [userID]),
          returnValue: Future<_i2.Either<_i6.Failure, _i5.UserEntity>>.value(
              _FakeEither_0<_i6.Failure, _i5.UserEntity>())) as _i4
          .Future<_i2.Either<_i6.Failure, _i5.UserEntity>>);
  @override
  _i4.Future<_i2.Either<_i6.Failure, _i5.UserEntity>> getCredentials() =>
      (super.noSuchMethod(Invocation.method(#getCredentials, []),
          returnValue: Future<_i2.Either<_i6.Failure, _i5.UserEntity>>.value(
              _FakeEither_0<_i6.Failure, _i5.UserEntity>())) as _i4
          .Future<_i2.Either<_i6.Failure, _i5.UserEntity>>);
  @override
  _i2.Either<_i6.Failure, String> getCurrentUserID() =>
      (super.noSuchMethod(Invocation.method(#getCurrentUserID, []),
              returnValue: _FakeEither_0<_i6.Failure, String>())
          as _i2.Either<_i6.Failure, String>);
  @override
  _i4.Future<_i2.Either<_i6.Failure, void>> resetPassword(
          {String? email, String? newPassword}) =>
      (super.noSuchMethod(
          Invocation.method(
              #resetPassword, [], {#email: email, #newPassword: newPassword}),
          returnValue: Future<_i2.Either<_i6.Failure, void>>.value(
              _FakeEither_0<_i6.Failure, void>())) as _i4
          .Future<_i2.Either<_i6.Failure, void>>);
  @override
  String toString() => super.toString();
}
