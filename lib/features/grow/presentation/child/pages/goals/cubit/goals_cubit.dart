import 'package:bloc/bloc.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/goals/cubit/goals_state.dart';

import 'goals_state.dart';

///The leaderboard page cubit
class GoalCubit extends Cubit<GoalsState> {
  ///
  GoalCubit() : super(GoalsState());
}
