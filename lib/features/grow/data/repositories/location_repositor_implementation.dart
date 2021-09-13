import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/data/models/previous/previous_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/previous/previous_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/run_details_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/location_repository.dart';
import 'package:logging/logging.dart';

///Implements the LocationRepository
class LocationRepositoryImplementation extends LocationRepository {
  ///if a [avgNum] is provided defaults to 5
  LocationRepositoryImplementation({this.avgNum = 5, this.paceThreshold = 0.2})
      : _locationLogger = Logger('LocationRepoImpl');

  ///logger
  final Logger _locationLogger;

  ///The number of points that should be taken before they are averaged
  final int avgNum;

  ///The threshold for the pace that determines when the gps points are averaged
  final double paceThreshold;

  ///callback to get the prevLong and lat and distance

  //stream to get the users steps

  @override
  Stream<PreviousModel> get runDetailsStream {
    late StreamController<PreviousModel> _controller;
    late StreamSubscription<Position> subscription;
    final List<PreviousModel> previousModels = <PreviousModel>[];
    double lat = 0, long = 0, distance = 0;
    void startTracking() {
      subscription = Geolocator.getPositionStream().listen((Position position) {
        _locationLogger.fine('''
The current speed ${position.speed} with coords ${position.latitude} and ${position.longitude} ''');

        if (position.speed > paceThreshold) {
          _locationLogger.fine('Point over Threshold');
          previousModels.add(PreviousModel(
              latitude: position.latitude, longitude: position.longitude));
        }
        if (previousModels.length == avgNum) {
          _locationLogger.fine('calculating distance');
          final PreviousModel previousModel = _calculateDistance(
              lat: lat, long: long, previousLatNLong: previousModels);
          lat = previousModel.latitude;
          long = previousModel.longitude;
          distance += previousModel.distance;
          _locationLogger.fine('Distance is : $distance');
          _controller.add(previousModel);
          previousModels.clear();
        } else {
          _controller.add(PreviousModel(
            distance: distance,
            pace: position.speed,
          ));
        }
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

    _controller = StreamController<PreviousModel>(
        onListen: startTracking,
        onPause: pauseTracking,
        onResume: resumeTracking,
        onCancel: endTracking);

    return _controller.stream;
  }

  ///Method to calculate the distance between averaged gps points

  PreviousModel _calculateDistance(
      {required double lat,
      required double long,
      required List<PreviousModel> previousLatNLong}) {
    double avgLat = 0;
    double avgLong = 0;
    for (final PreviousModel previous in previousLatNLong) {
      _locationLogger.fine(
          // ignore: lines_longer_than_80_chars
          'Points are lat: ${previous.latitude} and long: ${previous.longitude}');
      avgLat += previous.latitude;
      avgLong += previous.longitude;
    }
    avgLong /= previousLatNLong.length;
    avgLat /= previousLatNLong.length;
    if (lat == 0 && long == 0) {
      _locationLogger.fine('both lat and long are 0');
      return PreviousModel(latitude: avgLat, longitude: avgLong);
    }

    return PreviousModel(
        latitude: avgLat,
        longitude: avgLong,
        distance: Geolocator.distanceBetween(lat, long, avgLat, avgLong));
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
