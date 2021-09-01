import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/routes/leaderboard/cubit/leaderboard_state.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/routes/leaderboard/cubit/leaderboard_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/sliver_app_bar_with_shape.dart';

///
class LeaderBoard extends StatelessWidget {
  ///
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LeaderboardCubit>(
      create: (_) => LeaderboardCubit(),
      child: BlocConsumer<LeaderboardCubit, LeaderboardState>(
        listener: (BuildContext context, LeaderboardState state) {},
        builder: (BuildContext context, LeaderboardState state) {
          final ScrollController myScrollController = ScrollController();
          return Scaffold(
              backgroundColor: const Color.fromRGBO(149, 229, 253, 1),
              body: Theme(
                data: ThemeData(accentColor: Colors.black),
                child: CustomScrollView(
                  controller: myScrollController,
                  slivers: <Widget>[
                    SliverAppBarWithShape(
                      pageName: 'Rank',
                      scrollController: myScrollController,
                      titleName: 'Ganney A. Dortch',
                      background: LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return const SizedBox();
                      }),
                    ),
                    SliverFixedExtentList(
                      itemExtent: 100,
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return _getRankCard(
                            playerName: index == 4 ? 'You!' : 'Ganney Dortch',
                            rank: index + 1,
                            score: 50 - index,
                            isThisPlayer: index == 4);
                      }, childCount: 50),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }

  Container _getRankCard(
      {required String playerName,
      required int rank,
      required int score,
      bool isThisPlayer = false}) {
    return Container(
        padding: const EdgeInsets.all(20),
        color: isThisPlayer ? Colors.white38 : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Visibility(
                  visible: isThisPlayer,
                  replacement: const Icon(
                    FontAwesomeIcons.star,
                    color: Colors.black54,
                  ),
                  child: const Icon(
                    FontAwesomeIcons.starAndCrescent,
                    color: Colors.amber,
                  )),
            ),
            const Spacer(),
            Flexible(
              child: Text('$rank',
                  style: TextStyle(
                      color: isThisPlayer ? Colors.amber : null,
                      fontSize: isThisPlayer ? 20 : null)),
            ),
            const Spacer(),
            Flexible(
                child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitWidth,
                      image: AssetImage(
                        'assets/avatar/male/male.png',
                      )),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black87),
            )),
            const Spacer(),
            Expanded(
              flex: 5,
              child: Text(
                playerName,
                style: TextStyle(
                    color: isThisPlayer ? Colors.amber : null,
                    fontSize: isThisPlayer ? 20 : null),
              ),
            ),
            Flexible(
                child: Text('$score',
                    style: TextStyle(
                        color: isThisPlayer ? Colors.amber : null,
                        fontSize: isThisPlayer ? 20 : null))),
          ],
        ));
  }
}
