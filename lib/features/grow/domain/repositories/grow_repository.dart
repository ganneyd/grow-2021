//this is the authentication  repository's contract
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_run_v1/core/util/util.dart';
import 'package:grow_run_v1/features/grow/data/models/models_bucket.dart';
import '../entities/user/user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';

///The repository that handles all the business logic calls to apis and external
///services such as geolocation, animation stuff etc
abstract class GROWRepository {}
