///A [GOAL_OCCURANCE] tells what category the goal belongs to
/// [GOAL_OCCURANCE.WEEKLY] specifies that a goal is going to be attempted every week
/// [GOAL_OCCURANCE.DAILY] specifies that a goal is going to be attempted every day

enum GOAL_OCCURANCE { WEEKLY, DAILY, UNKNOWN }

///[GOAL_TYPE] specifies what kind of activity the goal is for
///[GOAL_TYPE.DISTANCE] specifies that the goal is achieved if an activity is completed in x distance
///[GOAL_TYPE.TIME] specifies that the goal is achieved if an activity is completed  in x number of time
///[GOAL_TYPE.FREQUENCY] specifies that the goal is achieved if an activity is completed x number of times over a number of days
///[GOAL_TYPE.NUMBER]specifies that the goal is achieved if an activity is completed x number of times
enum GOAL_TYPE { DISTANCE, TIME, FREQUENCY, NUMBER, UNKNOWN }
