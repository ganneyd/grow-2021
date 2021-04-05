import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_run_v1/core/util/util.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../entities/child/child_entity.dart';
import '../../repositories/grow_repository.dart';

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
    return _childRepository.editChildUser(params.childID, params.child);
  }
}

///Parameters required by the [UpdateChildData] UseCase
class Params extends Equatable {
  ///Constructor
  const Params({required this.childID, required this.child});

  ///The child entity
  final ChildEntity child;

  ///The id of the child user
  final String childID;
  @override
  List<Object> get props => <Object>[childID, child];
}
