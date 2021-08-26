import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/run_details_repository.dart';

///When the user has finished a run it is added to their runs
class AddRun implements UseCase<void, Params> {
  ///Takes an instance of [RunDetailsRepository]
  const AddRun({
    required RunDetailsRepository runDetailsRepository,
  }) : _runDetailsRepository = runDetailsRepository;

  final RunDetailsRepository _runDetailsRepository;
  @override
  Future<Either<Failure, void>> call(Params params) {
    return _runDetailsRepository.addRunSession(
        runSession: params.runSession, sessionDate: DateTime.now());
  }
}

///Params for the add run usecase
class Params extends Equatable {
  ///Takes [RunDetailsEntity] instance
  const Params({
    required this.runSession,
  });

  ///The run session the user has just completed
  final RunDetailsEntity runSession;

  @override
  List<Object?> get props => <Object>[
        runSession,
      ];
}
