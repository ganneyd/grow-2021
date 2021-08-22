import 'package:grow_run_v1/features/grow/domain/entities/previous/previous_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/stop_watch_entity.dart';
import 'package:pedometer/pedometer.dart';

enum RunStatus { running, stopped, unknown }

///Provides details about the run, such as the gps coordinates and the pace of
///the user
class RunDetailsEntity {
  ///Takes in [latitude], [longitude] and [pace]
  const RunDetailsEntity({
    required this.previous,
    required this.pace,
    required this.status,
  });

  ///Previous entity
  final Previous previous;

  ///Pace of the user
  final double pace;

  ///whether the user is walking, stopped or unknown
  final RunStatus status;
}
