import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/features/grow/domain/entities/parent/parent_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/parent_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../repositories/grow_repository.dart';

///when a user is trying to access a parent's data or parents' data
///they just need a single parent id or a list of parent id
/// this usecase returns a list of parent objects
class GetParentUserByID implements UseCase<List<ParentEntity>, Params> {
  ///Takes an instance of [ParentRepository]
  GetParentUserByID(ParentRepository parentRepository)
      : _parentRepository = parentRepository;
  final ParentRepository _parentRepository;
  @override
  Future<Either<Failure, List<ParentEntity>>> call(Params params) async {
    return _parentRepository.getParentByID(params.parentID, params.requestedBy);
  }
}

///Paramateres to be passed to the class
class Params extends Equatable {
  ///Takes the [id] of the parent and [id] of who requested to get the data
  const Params({required this.parentID, required this.requestedBy});

  ///The [ids] of the parents who's data is to be retrieved
  final List<String> parentID;

  ///The [id] of the user who requested to retrieve the data of the parents
  final String requestedBy;

  @override
  List<Object?> get props => <Object>[parentID, requestedBy];
}
