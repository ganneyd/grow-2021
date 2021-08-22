import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/data/models/previous/previous_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/previous/previous_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/location_repository.dart';
import 'package:logging/logging.dart';
import 'package:pedometer/pedometer.dart';

///Implements the LocationRepository
class LocationRepositoryImplementation extends LocationRepository {
  Logger locationLogger = Logger('LocationRepoImpl');

  ///callback to get the prevLong and lat and distance

  //stream to get the users steps

  @override
  Stream<RunDetailsEntity> get runDetailsStream {
    late StreamController<RunDetailsEntity> _controller;
    late StreamSubscription<Position> subscription;

    RunStatus status = RunStatus.unknown;
    void startTracking() {
      subscription = Geolocator.getPositionStream(
              intervalDuration: const Duration(milliseconds: 1))
          .listen((Position position) {
        locationLogger.fine('The current speed ${position.speed} ');

        _controller.add(RunDetailsEntity(
          previous: Previous(
              distance: 0,
              latitude: position.latitude,
              longitude: position.latitude),
          pace: position.speed,
          status: status,
        ));
      });
    }

    void pauseTracking() {
      subscription.pause();
    }

    void resumeTracking() {
      subscription.resume();
    }

    void endTracking() {
      _controller.close();

      subscription.cancel();
    }

    _controller = StreamController<RunDetailsEntity>(
        onListen: startTracking,
        onPause: pauseTracking,
        onResume: resumeTracking,
        onCancel: endTracking);

    return _controller.stream;
  }

  ///Method to calculate the distance between averaged gps points
  @override
  PreviousModel calculateDistance(
      {required double lat,
      required double long,
      required List<Previous> previousLatNLong}) {
    if (lat == 0 && long == 0) {
      return const PreviousModel(
          distance: 0987632, latitude: -57693.003, longitude: 080809.199);
    }
    double avgLat = 0;
    double avgLong = 0;
    double distance = 0;
    for (final Previous previous in previousLatNLong) {
      distance += previous.distance;
      avgLat += previous.latitude;
      avgLong += previous.longitude;
    }
    avgLong /= previousLatNLong.length;
    distance /= previousLatNLong.length;
    avgLat /= previousLatNLong.length;
    return PreviousModel(
        latitude: avgLat,
        longitude: avgLong,
        distance:
            distance + Geolocator.distanceBetween(lat, long, avgLat, avgLong));
  }

  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  @override
  Future<Either<Failure, bool>> checkPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return const Left<Failure, bool>(
          PermissionFailure(errMsg: 'Location services are disabled.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return const Left<Failure, bool>(
            PermissionFailure(errMsg: 'Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return const Left<Failure, bool>(PermissionFailure());
    }
    return const Right<Failure, bool>(true);
  }
}
