import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../entities/child/child_entity.dart';
import '../../repositories/child_repository.dart';

///when a user is trying to access a child's data or children's data
///they just need a single child id or a list of child id
/// this usecase returns a list of child objects
class GetCurrentChildUser implements UseCase<ChildEntity, NoParams> {
  ///Takes a [ChildRepository] instance to make the neccessary calls
  const GetCurrentChildUser(
      {required ChildRepository childRepository,
      required AuthenticationRepository authenticationRepository})
      : _childRepository = childRepository,
        _authenticationRepository = authenticationRepository;

  final ChildRepository _childRepository;
  final AuthenticationRepository _authenticationRepository;

  @override
  Future<Either<Failure, ChildEntity>> call(_) async {
    final Either<Failure, UserEntity> currentUser =
        await _authenticationRepository.getAuthenticatedUser();
    return await currentUser
        .fold((Failure failure) => Left<Failure, ChildEntity>(failure),
            (UserEntity user) async {
      final Either<Failure, List<ChildEntity>> result2 = await _childRepository
          .getChildrenByID(<String>[user.userID], user.userID);
      return result2.fold(
          (Failure failure) => Left<Failure, ChildEntity>(failure),
          (List<ChildEntity> child) =>
              Right<Failure, ChildEntity>(child.first));
    });
  }
}
