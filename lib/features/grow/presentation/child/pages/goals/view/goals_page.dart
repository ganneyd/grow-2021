import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/goals/cubit/goals_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/goals/cubit/goals_state.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/sliver_app_bar_with_shape.dart';

///
class GoalsPage extends StatelessWidget {
  ///
  GoalsPage({Key? key})
      : _pageMainColor = const Color.fromRGBO(255, 31, 75, 1),
        super(key: key);
  final Color _pageMainColor;
  @override
  Widget build(BuildContext context) {
    final ScrollController _myScrollController = ScrollController();

    return BlocProvider<GoalCubit>(
        create: (_) => GoalCubit(),
        child: BlocConsumer<GoalCubit, GoalsState>(
            listener: (BuildContext context, GoalsState state) {},
            builder: (BuildContext context, GoalsState state) {
              return Theme(
                  data: ThemeData(accentColor: _pageMainColor),
                  child: Scaffold(
                    body: CustomScrollView(
                      controller: _myScrollController,
                      slivers: <Widget>[
                        SliverAppBarWithShape(
                            slantedRight: false,
                            pageName: 'Goals',
                            scrollController: _myScrollController,
                            titleName: 'Goals',
                            backgroundColor: _pageMainColor,
                            background: Text('Hey'))
                      ],
                    ),
                  ));
            }));
  }
}
