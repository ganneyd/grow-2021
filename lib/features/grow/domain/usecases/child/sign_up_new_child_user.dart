import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../entities/child/child_entity.dart';
import 'package:cloud_functions/cloud_functions.dart';

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
    //todo move this to auth repo
    try {
      final HttpsCallableResult<Map<String, dynamic>> result =
          await _callable.call(<String, dynamic>{
        'child': <String, dynamic>{
          'email': params.childEmail,
          'password': params.childPassword,
          'data': Child.toChild(params.child).toJson(),
        },
        'parent': <String, dynamic>{
          'email': params.parentEmail,
          'password': params.parentPassword,
        }
      });
      print(result.data);
      if (result.data['success'] as bool) {
        Either<Failure, void> res = await _authenticationRepository.loginUser(
            params.childEmail, params.childPassword);
        return res.fold(
            (Failure l) => Left<Failure, String>(AuthenticationFailure()),
            (void r) =>
                Right<Failure, String>(result.data['childUID'] as String));
      } else {
        final Map<String, dynamic> error =
            result.data['errorMsg'] as Map<String, dynamic>;
        return Left<Failure, String>(SignUpFailure(
            errMsg: error['error']['errorInfo']['message'] as String));
      }
    } catch (error) {
      return Left<Failure, String>(SignUpFailure(errMsg: error.toString()));
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
      required this.child});

  ///Email of the child being signed  up
  final String childEmail, childPassword, parentEmail, parentPassword;

  ///Child entity with all other information for the child being signed up
  final ChildEntity child;

  @override
  List<Object> get props =>
      [childEmail, childPassword, parentEmail, parentPassword, child];
}
