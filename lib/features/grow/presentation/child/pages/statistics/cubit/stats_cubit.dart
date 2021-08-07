import 'package:bloc/bloc.dart';

import 'stats_state.dart';

///The leaderboard page cubit
class StatsCubit extends Cubit<StatsState> {
  ///
  StatsCubit() : super(StatsState());
}
