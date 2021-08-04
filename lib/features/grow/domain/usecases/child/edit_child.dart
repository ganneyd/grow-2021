import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../entities/child/child_entity.dart';

///when a user is trying to edit a child's data
///they just need the child id and the changed variables
/// this usecase returns a the credentials of the child who's data was updated
class UpdateChildData implements UseCase<void, Params> {
  ///Takes a [ChildRepository] instance to make the neccessary calls
  const UpdateChildData(ChildRepository childRepository)
      : _childRepository = childRepository;

  final ChildRepository _childRepository;

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return _childRepository.editChildUser(params.child, params.childID);
  }
}

///Parameters required by the [UpdateChildData] UseCase
class Params extends Equatable {
  ///Constructor
  const Params({required this.child, required this.childID});

  ///The child entity
  final ChildEntity child;

  ///The child's id
  final String childID;
  @override
  List<Object> get props => <Object>[child, childID];
}
