import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../entities/child/child_entity.dart';
import '../../repositories/child_repository.dart';

///when a user is trying to access a child's data or children's data
///they just need a single child id or a list of child id
/// this usecase returns a list of child objects
class GetChildUserByID implements UseCase<List<ChildEntity>, Params> {
  ///Takes a [ChildRepository] instance to make the neccessary calls
  const GetChildUserByID(ChildRepository childRepository)
      : _childRepository = childRepository;

  final ChildRepository _childRepository;

  @override
  Future<Either<Failure, List<ChildEntity>>> call(Params params) async {
    return _childRepository.getChildrenByID(
        params.childIDs, params.requestedBy);
  }
}

//Paramateres to be passed to the class
class Params extends Equatable {
  ///Params
  const Params({required this.childIDs, required this.requestedBy});

  ///List of children ids that are to be found and returned
  final List<String> childIDs;

  ///ID of the user who made the request
  final String requestedBy;

  @override
  List<Object?> get props => <Object>[childIDs, requestedBy];
}
