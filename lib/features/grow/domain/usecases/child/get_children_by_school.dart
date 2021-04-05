import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/core/util/util.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../entities/child/child_entity.dart';
import '../../repositories/child_repository.dart';

///when a user is trying to access a child's data or children's data
///they just need a school id and then the
/// usecase returns a list of child objects that
class GetChildUserBySchool implements UseCase<List<ChildEntity>, Params> {
  ///Takes a [ChildRepository] instance to make the neccessary calls
  const GetChildUserBySchool(ChildRepository childRepository)
      : _childRepository = childRepository;

  final ChildRepository _childRepository;

  @override
  Future<Either<Failure, List<ChildEntity>>> call(Params params) async {
    //TODO log who made the request
    return _childRepository.getChildrenBySchool(
        params.schoolID, params.requestedBy);
  }
}

///Paramateres to be passed to the class
class Params extends Equatable {
  ///Params
  const Params({required this.schoolID, required this.requestedBy});

  ///Id of school that should correspond to the children's school and once
  ///a match is found the child entity is returned.
  final String schoolID;

  ///ID of who made the request
  final String requestedBy;

  @override
  List<Object?> get props => <Object>[schoolID, requestedBy];
}
