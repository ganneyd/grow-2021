import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_run_v1/core/error/exceptions.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/util/build_info.dart';
import 'package:grow_run_v1/features/grow/data/models/school/school_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/school/school_entity.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../domain/repositories/grow_repository.dart';
import '../datasources/datasources.dart';

///The different collections in firestore that will be interacted with

enum Collections {
  ///The [School] collection that contains all relevant info for the school(s)
  school
}

///Implementation of the grow repository
class GROWRepositoryImplementation extends GROWRepository {
  ///Constructor , takes a [FireBaseAuth] instance
  GROWRepositoryImplementation(RemoteDataSource remoteDataSource)
      : _firebaseAuth = FirebaseAuth.instance,
        _remoteDataSource = remoteDataSource;
  final FirebaseAuth _firebaseAuth;
  final RemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, BuildInfo>> getBuildInfo() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final BuildInfo buildInfo = BuildInfo(
          appName: packageInfo.appName,
          version: packageInfo.version,
          buildNumber: packageInfo.buildNumber);

      return Right<Failure, BuildInfo>(buildInfo);
    } catch (error) {
      ///TODO crashlytics implementation
      return const Left<Failure, BuildInfo>(FetchDataFailure());
    }
  }
}
