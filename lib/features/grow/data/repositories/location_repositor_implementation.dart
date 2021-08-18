import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/location_repository.dart';
import 'package:logging/logging.dart';
import 'package:pedometer/pedometer.dart';

///Implements the LocationRepository
class LocationRepositoryImplementation extends LocationRepository {
  Logger locationLogger = Logger('LocationRepoImpl');
  //stream to get the users steps

  @override
  Stream<RunDetailsEntity> get runDetailsStream {
    late StreamController<RunDetailsEntity> _controller;
    late StreamSubscription<Position> subscription;
    late StreamSubscription<StepCount> _stepCountStream;
    late StreamSubscription<PedestrianStatus> _pedestrianStatus;
    double distance = 0.0;
    List<Position> coordsList = <Position>[];
    double prevLat = 0;
    double prevLong = 0;
    double pace = 0.0;
    int steps = 0;
    RunStatus status = RunStatus.unknown;
    void startTracking() {
      _stepCountStream =
          Pedometer.stepCountStream.listen((StepCount stepCount) {
        steps = stepCount.steps;
        _controller.add(RunDetailsEntity(
            latitude: prevLong,
            longitude: prevLat,
            pace: pace,
            distance: distance,
            steps: stepCount.steps,
            status: status));
        locationLogger.fine('The step count is ${stepCount.steps}');
      });
      _pedestrianStatus = Pedometer.pedestrianStatusStream
          .listen((PedestrianStatus pedestrianStatus) {
        _controller.add(RunDetailsEntity(
            latitude: prevLong,
            longitude: prevLat,
            pace: pace,
            distance: distance,
            steps: steps,
            status: status));
        locationLogger.fine('The status is ${pedestrianStatus.status}');
      });
      subscription = Geolocator.getPositionStream(
              intervalDuration: const Duration(milliseconds: 1))
          .listen((Position position) {
        locationLogger.fine('The current speed ${position.speed} ');
        locationLogger.fine('The current distance $distance ');

        if (position.speed > 0.5) {
          coordsList.add(position);
          locationLogger.fine('Coords list count ${coordsList.length}');
          if (coordsList.length == 5) {
            double avgLong, avgLat;
            avgLong = 0;
            avgLat = 0;
            for (final Position pos in coordsList) {
              avgLat += pos.latitude;
              avgLong += pos.longitude;
            }
            locationLogger.fine('AvgLat $avgLat AvgLong $avgLong');
            avgLong /= 5;
            avgLat /= 5;
            locationLogger.fine('AvgLat $avgLat AvgLong $avgLong');

            if (prevLong != 0 && prevLat != 0) {
              locationLogger.fine('Old pos is not null, walk detected');
              distance += Geolocator.distanceBetween(
                  prevLat, prevLong, avgLat, avgLong);
            }
            prevLat = avgLat;
            prevLong = avgLong;
            pace = position.speed;
            coordsList.clear();
          }
        }
        _controller.add(RunDetailsEntity(
            latitude: prevLong,
            longitude: prevLat,
            pace: pace,
            distance: distance,
            steps: steps,
            status: status));
      });
    }

    void pauseTracking() {
      subscription.pause();
      _stepCountStream.pause();
      _pedestrianStatus.pause();
    }

    void resumeTracking() {
      subscription.resume();
      _stepCountStream.resume();
      _pedestrianStatus.resume();
    }

    void endTracking() {
      distance = 0.0;
      prevLong = 0;
      prevLat = 0;
      steps = 0;
      pace = 0;
      coordsList.clear();
      _controller.close();
      _stepCountStream.cancel();
      _pedestrianStatus.cancel();
      subscription.cancel();
    }

    _controller = StreamController<RunDetailsEntity>(
        onListen: startTracking,
        onPause: pauseTracking,
        onResume: resumeTracking,
        onCancel: endTracking);

    return _controller.stream;
  }

  double _calculateDistance(
      {required double lat1,
      required double long1,
      required double lat2,
      required double long2}) {
    return 0.0;
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
