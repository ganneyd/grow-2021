import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';
import '../../entities/child/child_entity.dart';
import '../mixins.dart';

///When a new child user's account is being made this is the usecase
class SignUpNewChildUser implements UseCase<UserEntity, Params> {
  ///Constructor
  SignUpNewChildUser(
      {required AuthenticationRepository authenticationRepository,
      required ChildRepository childRepository})
      : _authenticationRepository = authenticationRepository,
        _childRepository = childRepository;

  final AuthenticationRepository _authenticationRepository;
  final ChildRepository _childRepository;
  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    final Either<Failure, UserEntity> authBy = await _authenticationRepository
        .authenticateUser(params.parentEmail, params.parentPassword);
    if (authBy.isRight()) {
      //get the auth_id for the parent
      final UserEntity parent = authBy.getOrElse(() => const UserEntity(
          userEmail: 'test-email', userID: 'test-id ', name: 'test-name'));

      //attemp to authenticate the user and store it in a variable

      //call the sign up method and then wait for the UserEntity that contains the
      // user's uid and email
      final Either<Failure, UserEntity> userCredential =
          await _authenticationRepository.signUpUser(
              params.childEmail, params.childPassword);

      //check to see if the userCredential returns successfully, which is right
      // and then create the user data in the db
      if (userCredential.isRight()) {
        final UserEntity user = userCredential.getOrElse(() => const UserEntity(
            userEmail: 'test-email', userID: 'test-id ', name: 'tese-name'));
        final ChildEntity childWithID =
            toChilEntityWithID(params.child, user.userID, parent.userID);

        //if successful try to poppulate the children collection with the
        //child's information
        final Either<Failure, void> createData =
            await _childRepository.createChildData(childWithID);

        //if the user data was created successfully then
        //return the UserEntity object
        if (createData.isRight()) {
          return Right<Failure, UserEntity>(user);
        }
      }
    }
    //if userCredential isn't an instance of Right then it must be left
    //so we return a failure
    return Left<Failure, UserEntity>(SignUpFailure());
  }
}

///Parameters for the usecase
class Params extends Equatable {
  ///Constructor takes an [childEmail], [childPassword], and the [child] entity
  const Params(
      {required this.childEmail,
      required this.childPassword,
      required this.parentEmail,
      required this.parentPassword,
      required this.child});

  ///Email of the child being signed  up
  final String childEmail, childPassword, parentEmail, parentPassword;

  ///Child entity with all other information for the child being signed up
  final ChildEntity child;

  @override
  List<Object> get props =>
      [childEmail, childPassword, parentEmail, parentPassword, child];
}
