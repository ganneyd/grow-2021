import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:grow_run_v1/features/grow/data/datasources/datasources.dart';
import 'package:grow_run_v1/features/grow/data/repositories/grow_repository.dart';
import 'package:grow_run_v1/features/grow/data/repositories/location_repositor_implementation.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/grow_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/location_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/run_details_repository.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/run/widgets/sub_cubit/timer_cubit.dart';

import 'features/grow/data/repositories/run_repository_implementation.dart';

///Service Locator
final GetIt serviceLocator = GetIt.instance;

///Initialize the service locator
Future<void> init() async {
//! Features -GROW

//!Child
//BLOCs
//RunPage
  serviceLocator.registerFactory<TimerCubit>(() => TimerCubit(
      runDetailsRepository: serviceLocator(),
      locationRepository: serviceLocator(),
      growRepository: serviceLocator()));
//!UseCases
//!Repositories
  serviceLocator.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImplementation());
  serviceLocator.registerLazySingleton<GROWRepository>(
      () => GROWRepositoryImplementation(serviceLocator()));
  serviceLocator.registerLazySingleton<RunDetailsRepository>(
      () => RunRepositoryImplementation(remoteDataSource: serviceLocator()));
//!DataSources
  serviceLocator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementation(FirebaseFirestore.instance));
//!Core
//TODO add network checker here
//!External
}
