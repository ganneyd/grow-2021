import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'should ',
    () async {
      // arrange

      // act

      // assert
      expect('', '');
    },
  );
}

// //@dart=2.9
// import 'package:grow_v1/core/error/exceptions.dart';
// import 'package:grow_v1/core/error/failures.dart';
// import 'package:grow_v1/features/grow/data/datasources/datasources.dart';
// import 'package:grow_v1/features/grow/data/models/models_bucket.dart' as models;
// import 'package:grow_v1/features/grow/data/repositories/grow_repository.dart';
// import 'package:grow_v1/features/grow/domain/entities/entities_bucket.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mockito/mockito.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:grow_v1/core/util/util.dart';

// //mocking the database
// class MockRemoteDataSource extends Mock implements RemoteDataSource {}

// //TODO mock local datasource

// //mock authentication repo
// class MockAuthenticationRepo extends Mock implements FirebaseAuth {}

// void main() {
//   final MockAuthenticationRepo mockAuthenticationRepo =
//       MockAuthenticationRepo();

//   final MockRemoteDataSource mockRemoteDataSource = MockRemoteDataSource();
//   final GROWRepositoryImplementation repository = GROWRepositoryImplementation(
//       mockAuthenticationRepo,
//       remoteDataSource: mockRemoteDataSource);

//   setUp(() {});
// //test Varibales
//   const String tEmail = 'ganneyd@gmail.com';
//   const String tPassword = '123456';
//   const String tWeakPassword = '1234';
//   final models.Child tChildModel = models.Child(
//     username: 'ganneyd15',
//     firstname: 'Ganney',
//     lastname: 'Dortch',
//     gender: Gender.male,
//     dateOfBirth: DateTime.utc(1999, 8, 8),
//     gradeLevel: 12,
//   );

//   final ChildEntity tChild = tChildModel;

//   group('child related tests', () {
//     test(
//       'should return a SignUpFailure when the password is too weak',
//       () async {
//         // arrange
//         when(mockAuthenticationRepo.createUserWithEmailAndPassword(
//                 email: tEmail, password: tWeakPassword))
//             .thenAnswer((Invocation realInvocation) =>
//                 throw FirebaseAuthException(
//                     message: 'weak password provided', code: 'weak-password'));
//         // act
//         final Either<Failure,> result =
//             await repository.signUpChild(tEmail, tWeakPassword, tChild);
//         // assert
//         verify(mockAuthenticationRepo.createUserWithEmailAndPassword(
//             email: tEmail, password: tWeakPassword));
//         expect(result, equals(Left<SignUpFailure,dynamic>(SignUpFailure(''))));
//       },
//     );
//   });
//   //setup the repository with the mocked classes;
// }
