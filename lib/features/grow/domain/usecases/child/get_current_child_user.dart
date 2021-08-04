import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/util/gender.dart';
import 'package:grow_run_v1/features/grow/data/models/child_user_model.dart';
import 'package:grow_run_v1/features/grow/data/models/models_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/entities/child_user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/entities/school/school_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/school_repository.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/school/get_school.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../entities/child/child_entity.dart';
import '../../repositories/child_repository.dart';

///when a user is trying to access a child's data or children's data
///they just need a single child id or a list of child id
/// this usecase returns a list of child objects
class GetCurrentChildUser implements UseCase<ChildUserEntity, NoParams> {
  ///Takes a [ChildRepository] instance to make the necessary calls
  GetCurrentChildUser(
      {required ChildRepository childRepository,
      required SchoolRepository schoolRepository,
      required AuthenticationRepository authenticationRepository})
      : _childRepository = childRepository,
        _authenticationRepository = authenticationRepository,
        _getSchool = GetSchool(schoolRepository: schoolRepository);

  final GetSchool _getSchool;
  final ChildRepository _childRepository;
  final AuthenticationRepository _authenticationRepository;

  @override
  Future<Either<Failure, ChildUserEntity>> call(_) async {
    final Either<Failure, UserEntity> currentUser =
        await _authenticationRepository.getCredentials();
    return await currentUser
        .fold((Failure failure) => Left<Failure, ChildUserEntity>(failure),
            (UserEntity user) async {
      //fetch the child data
      final Either<Failure, ChildEntity> result2 =
          await _childRepository.getChild(user.userID);
      //fold said result
      return result2.fold(
          //immediate failure return from func
          (Failure failure) => Left<Failure, ChildUserEntity>(failure),
          //might result to where we want continue folding
          (ChildEntity child) async {
        //now we have a child entity here
        //fetch the school now since we have the child user
        final Either<Failure, SchoolEntity> schoolResult =
            await _getSchool.call(Params(schoolID: child.schoolID));
        return schoolResult.fold(
            (Failure failure) => Left<Failure, ChildUserModel>(
                FetchDataFailure(errMsg: failure.message)),
            (SchoolEntity schoolEntity) {
          return Right<Failure, ChildUserEntity>(ChildUserEntity(
              childEntity: child,
              email: user.userEmail,
              uid: user.userID,
              schoolEntity: schoolEntity,
              parentEntity: ParentEntity(
                  uid: 'parent',
                  firstname: 'parent-f-name',
                  lastname: 'parent-lname',
                  dateOfBirth: DateTime.now(),
                  childrenIDs: <String>[user.userID],
                  gender: Gender.male,
                  phonenumber: '0000')));
        });
      });
    });
  }
}
