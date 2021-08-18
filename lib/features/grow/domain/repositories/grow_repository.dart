//this is the authentication  repository's contract
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/util/build_info.dart';
import 'package:grow_run_v1/features/grow/data/models/stop_watch/stop_watch_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';

///The repository that handles all the business logic calls to apis and external
///services such as geolocation, animation stuff etc
abstract class GROWRepository {
  ///Retrieves the build number version and platform info
  Future<Either<Failure, BuildInfo>> getBuildInfo();

  ///exposes stream that streams times
  Stream<ElapsedTimeModel> stopWatchStream();
}
