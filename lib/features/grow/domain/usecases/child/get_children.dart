import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../entities/child/child_entity.dart';

///when a user is trying to access a child's data or children's data
///they just need to provide thier id to access these
/// this usecase returns a list of child objects
class GetChildUsers implements UseCase<List<ChildEntity>, Params> {
  ///Takes a [ChildRepository] instance to make the neccessary calls
  const GetChildUsers(ChildRepository childRepository)
      : _childRepository = childRepository;

  final ChildRepository _childRepository;

  @override
  Future<Either<Failure, List<ChildEntity>>> call(Params params) async {
    return _childRepository.getChildren(params.requestedBy);
  }
}

///Paramateres to be passed to the class
class Params extends Equatable {
  ///pass who made the request
  const Params(this.requestedBy);

  ///The person who requested to see all the children
  final String requestedBy;
  @override
  List<Object?> get props => <Object>[requestedBy];
}
