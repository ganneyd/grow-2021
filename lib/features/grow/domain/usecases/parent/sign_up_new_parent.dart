import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/parent_repository.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../mixins.dart';

///When a new parent user's account is being made this is the usecase
class SignUpNewParentUser implements UseCase<UserEntity, Params> {
  ///Constructor
  SignUpNewParentUser(
      {required AuthenticationRepository authenticationRepository,
      required ParentRepository parentRepository})
      : _authenticationRepository = authenticationRepository,
        _parentRepository = parentRepository;

  final AuthenticationRepository _authenticationRepository;
  final ParentRepository _parentRepository;
  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    String parentJSONString = jsonEncode(params.parent);
    Map<String, dynamic> json =
        jsonDecode(parentJSONString) as Map<String, dynamic>;
    //attemp to authenticate the user and store it in a variable
    final Either<Failure, UserEntity> result =
        await _authenticationRepository.signUpUser(
      dependentEmail: params.email,
      dependentPassword: params.password,
      dependentUserType: UserType.parent,
      dependentData: json,
    );
    return result.fold(
        (Failure l) => Left<Failure, UserEntity>(SignUpFailure()),
        (UserEntity user) => Right<Failure, UserEntity>(user));
  }
}

///Parameters required by the UseCase
class Params extends Equatable {
  ///Params needed
  Params({required this.email, required this.password, required this.parent});

  ///Email of the parent to be signed up
  final String email;

  ///Password of the parent to be signed up
  final String password;

  ///The parent's data that will be used to populate the database
  final ParentEntity parent;

  @override
  List<Object> get props => <Object>[email, password, parent];
}
