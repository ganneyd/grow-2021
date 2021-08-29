import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';

///Handles the run session details
abstract class RunDetailsRepository {
  ///Add a newly completed run session
  Future<Either<Failure, void>> addRunSession(
      {required RunDetailsEntity runSession, required DateTime sessionDate});

  ///Retrieve all the run sessions
  Future<Either<Failure, List<RunDetailsEntity>>> getRunSession();

  ///Set a new goal
  Future<Either<Failure, void>> setGoal({required GoalEntity goal});

  ///query the run sessions based on the [query] passed
  Future<Either<Failure, List<RunDetailsEntity>>> queryRunSessions({required});
}
