///A [GOAL_OCCURRENCE] tells what category the goal belongs to

enum GOAL_OCCURRENCE {
  /// specifies that a goal is going to be
  /// attempted every week
  weekly,

  /// specifies that a goal is going to be
  /// attempted every day
  daily,

  ///if the occurrence of the goal is not specified
  unknown
}

///[GOAL_TYPE] specifies what kind of activity the goal is for
enum GOAL_TYPE {
  ///specifies that the goal is achieved if an activity
  ///is completed in x distance
  distance,

  /// specifies that the goal is achieved if an activity is
  ///completed  in x number of times
  time,

  ///specifies that the goal is achieved if an activity
  /// is completed x number of times over a number of days
  frequency,

  ///specifies that the goal is achieved if an activity is
  ///completed x number of times
  number,

  ///If the goal type is unknown
  unknown,
}
