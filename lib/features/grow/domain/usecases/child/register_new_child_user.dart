// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
// import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
// import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
// import 'package:grow_run_v1/features/grow/domain/usecases/mixins.dart';
// import '../../../../../core/error/failures.dart';
// import '../../../../../core/usecases/usecases.dart';
// import '../../entities/child/child_entity.dart';

// ///When a new child user's account is being made this is the usecase
// ///It uses the [registerUser()] from the [AuthenticationRepository] and then
// ///uses the returned [UserCredential] to populate the database using
// ///the [createChildUserData()] mehtod from the [ChildRepository]
// class RegisterNewChildUser implements UseCase<UserEntity, Params> {
//   ///Constructor
//   RegisterNewChildUser(
//       {required AuthenticationRepository authenticationRepository,
//       required ChildRepository childRepository})
//       : _authenticationRepository = authenticationRepository,
//         _childRepository = childRepository;

//   final AuthenticationRepository _authenticationRepository;
//   final ChildRepository _childRepository;

//   @override
//   Future<Either<Failure, UserEntity>> call(Params params) async {
//     final Either<Failure, UserEntity> parentCredential =
//         await _authenticationRepository.getCredentials();

//     return await parentCredential
//         .fold((_) => const Left<Failure, UserEntity>(AuthenticationFailure()),
//             (UserEntity parent) async {
//       final Either<Failure, UserEntity> userCredential =
//           await _authenticationRepository.registerUser(
//               params.email, Params.defaultPassword);
//       return await userCredential
//           .fold((_) => const Left<Failure, UserEntity>(AuthenticationFailure()),
//               (UserEntity child) async {
//         final ChildEntity childWithID =
//             toChilEntityWithID(params.child, child.userID, parent.userID);

//         //if successful try to poppulate the children collection with the
//         //child's information
//         final Either<Failure, void> createData =
//             await _childRepository.createChildData(childWithID);

//         //if the user data was created successfully then
//         //return the UserEntity object
//         if (createData.isRight()) {
//           return Right<Failure, UserEntity>(child);
//         } else {
//           return Left<Failure, UserEntity>(CreateDataFailure());
//         }
//       });
//     });
//   }
// }

// ///params
// class Params extends Equatable {
//   ///Params
//   const Params({required this.email, required this.child});

//   ///Email of the child being registered
//   final String email;

//   ///password of the child being registered by default its [password12]
//   static const String defaultPassword = 'password12';

//   ///the child entity containing the child's info
//   final ChildEntity child;
//   @override
//   List<Object> get props => <Object>[email, defaultPassword, child];
// }
