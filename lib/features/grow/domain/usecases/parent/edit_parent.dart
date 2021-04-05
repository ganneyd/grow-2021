import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/parent_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../repositories/grow_repository.dart';

///when a user is trying to edit a parent's data
///they just need the parent id and the changed variables
/// this usecase returns void when successful
class UpdateParentData implements UseCase<void, Params> {
  ///Takes an instance of [ParentRepository]
  UpdateParentData(ParentRepository parentRepository)
      : _parentRepository = parentRepository;
  final ParentRepository _parentRepository;

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return _parentRepository.editParentUser(params.parent);
  }
}

///Parameters needed by the Usecase
class Params extends Equatable {
  ///Parameteres required takes [parentID], and the [parent] entity
  const Params({required this.parentID, required this.parent});

  ///the id of the parent whose account data is to be updated
  final String parentID;

  ///The parent data that is to be updated
  final ParentEntity parent;

  @override
  List<Object> get props => <Object>[parentID, parent];
}
