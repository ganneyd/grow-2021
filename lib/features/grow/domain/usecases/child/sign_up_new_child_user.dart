import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';

///When a new child user's account is being made this is the usecase
class SignUpNewChildUser implements UseCase<String, Params> {
  ///Constructor
  SignUpNewChildUser(AuthenticationRepository authenticationRepository)
      : _callable =
            FirebaseFunctions.instance.httpsCallable('signUpNewChildAcc'),
        _authenticationRepository = authenticationRepository;

  final HttpsCallable _callable;
  final AuthenticationRepository _authenticationRepository;
  @override
  Future<Either<Failure, String>> call(Params params) async {
    // when a child acc is created a parent is always attached to the account
    //convert formJSON intot a child obj thne back to JSON
    try {
      final Child child = Child.fromJson(params.childJSON);
      final Either<Failure, UserEntity> result =
          await _authenticationRepository.signUpUser(
              dependentEmail: params.childEmail,
              dependentPassword: params.childPassword,
              dependentUserType: UserType.child,
              dependentData: child.toJson(),
              dependencyEmail: params.parentEmail,
              dependencyPassword: params.parentPassword,
              dependencyUserType: UserType.parent);
//return the failure with the message
      return result.fold(
          (Failure l) =>
              Left<Failure, String>(SignUpFailure(errMsg: l.message)),
          (UserEntity user) async {
        //attempt to log the user in
        final Either<Failure, void> loginResult =
            await _authenticationRepository.loginUser(
                params.childEmail, params.childPassword);
        //return either a failure or the user's id
        return loginResult.fold(
            (Failure l) =>
                Left<Failure, String>(SignUpFailure(errMsg: l.message)), (_) {
          return Right<Failure, String>(user.userID);
        });
      });
    } catch (e) {
      return Left<Failure, String>(AuthenticationFailure());
    }
  }
}

///Parameters for the usecase
class Params extends Equatable {
  ///Constructor takes an [childEmail], [childPassword], and the [child] entity
  const Params(
      {required this.childEmail,
      required this.childPassword,
      required this.parentEmail,
      required this.parentPassword,
      required this.childJSON});

  ///Email of the child being signed  up
  final String childEmail, childPassword, parentEmail, parentPassword;

  ///Child entity with all other information for the child being signed up
  final Map<String, dynamic> childJSON;

  @override
  List<Object> get props =>
      [childEmail, childPassword, parentEmail, parentPassword, childJSON];
}
