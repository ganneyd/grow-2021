import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../repositories/parent_repository.dart';

///When a new child user's account is being made this is the usecase
class GetListOfParents implements UseCase<List, Params> {
  ///Takes an instance of [ParentRepository]
  GetListOfParents(ParentRepository parentRepository)
      : _parentRepository = parentRepository;
  final ParentRepository _parentRepository;
  @override
  Future<Either<Failure, List<ParentEntity>>> call(Params params) async {
    return _parentRepository.getParents(params.requestedBy);
  }
}

///Paramateres needed by the UseCase
class Params extends Equatable {
  ///Takes the [id] of the user who made the request
  const Params(this.requestedBy);

  ///the [id] of the user who requested to have the parents retrieved
  final String requestedBy;

  @override
  List<Object> get props => <Object>[requestedBy];
}
