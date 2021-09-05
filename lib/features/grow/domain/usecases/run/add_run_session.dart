import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/run_details_repository.dart';

///When the user has finished a run it is added to their runs
class AddRun implements UseCase<void, Params> {
  ///Takes an instance of [RunDetailsRepository]
  const AddRun({
    required RunDetailsRepository runDetailsRepository,
    required AuthenticationRepository authenticationRepository,
  })  : _runDetailsRepository = runDetailsRepository,
        _authenticationRepository = authenticationRepository;

  final RunDetailsRepository _runDetailsRepository;
  final AuthenticationRepository _authenticationRepository;
  @override
  Future<Either<Failure, void>> call(Params params) {
    final Either<Failure, String> results =
        _authenticationRepository.getCurrentUserID();
    return results.fold(
        (Failure l) => Future.value(Left<Failure, void>(l)),
        (String uid) => _runDetailsRepository.addRunSession(
            uid: uid,
            runSession: params.runSession,
            sessionDate: DateTime.now()));
  }
}

///Params for the add run usecase
class Params extends Equatable {
  ///Takes [RunDetailsEntity] instance
  const Params({
    required this.runSession,
  });

  ///The run session the user has just completed
  final RunSessionEntity runSession;

  @override
  List<Object?> get props => <Object>[
        runSession,
      ];
}
