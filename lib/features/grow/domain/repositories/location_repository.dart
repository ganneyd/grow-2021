import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/data/models/previous/previous_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/previous/previous_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';

///Deals with receiving the raw gps data and processing that data
abstract class LocationRepository {
  ///Stream of , [RunDetailsEntity] which will emit the gps coords and the
  ///pace of the user
  Stream<Previous> get runDetailsStream;

  ///Checks if the app has permission to use the GPS services
  Future<Either<Failure, bool>> checkPermissions();
}
