import 'package:grow_run_v1/core/util/util.dart';
import 'package:grow_run_v1/features/grow/domain/entities/stop_watch_entity.dart';

///Represents a user set goal
class GoalEntity {
  ///Constructor takes in
  ///[goalOccurrence]
  ///[goalType], [goalName],
  ///if [dateMade] is null then the [DateTime.now()] is used
  ///[datesAttempted] is filled with the  dates that the goal was attempted and
  ///if [dateCompleted] is not null then the goal has been completed if not then
  ///the goal is still active
  GoalEntity({
    required this.goalOccurrence,
    required this.goalType,
    required this.goalName,
    DateTime? dateMade,
    this.dateCompleted,
    required this.datesAttempted,
    required this.attemptThreshold,
    required this.frequencyThreshold,
    required this.distanceThreshold,
    required this.timeThreshold,
  }) : dateMade = dateMade ?? DateTime.now();

  ///How often then goal should be repeated
  final GOAL_OCCURRENCE goalOccurrence;

  ///The  threshold that should be surpassed ex [GOAL_TYPE.distance] will be
  ///focused on having the distance threshold be surpassed
  final GOAL_TYPE goalType;

  ///The Name of the goal
  final String goalName;

  ///The dates that goal were attempted, all the run session dates contributes
  ///to this until its completed
  final List<DateTime> datesAttempted;

  ///The date that the goal was completed on, if null then the goal has not been
  ///achieved
  final DateTime? dateCompleted;

  ///The date that the goal was made
  final DateTime dateMade;

  ///The minimum distance that should be completed
  final double distanceThreshold;

  ///the maximum time it should take to complete a session or x number of
  /// sessions
  final ElapsedTimeEntity timeThreshold;

  ///how often the goal should be completed
  final int frequencyThreshold;

  /// the number of times the goal should be completed
  final int attemptThreshold;
}
