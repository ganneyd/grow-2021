import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/grow_repository.dart';
import '../datasources/datasources.dart';

///Implementation of the grow repository
class GROWRepositoryImplementation extends GROWRepository {
  ///Constrcutor , takes a [FireBaseAuth] instance
  GROWRepositoryImplementation(FirebaseAuth auth,
      {required this.remoteDataSource})
      : _firebaseAuth = auth;
  final FirebaseAuth _firebaseAuth;
  final RemoteDataSource remoteDataSource;
  //TODO: implement localdatasource
  //final LocalDataSource localDataSource;

}
