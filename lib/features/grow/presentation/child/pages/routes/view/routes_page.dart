import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/routes/cubit/route_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/routes/cubit/route_state.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/routes/widgets/drawer.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/routes/widgets/route_preview_card.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/app_bar_icons.dart';

///Displays the routes the user has previously made,
///they can also just initialize a run from this screen
class RoutesPage extends StatelessWidget {
  ///
  RoutesPage()
      : _scaffoldKey = GlobalKey(debugLabel: 'child-home-scaffold'),
        super(key: const Key('child-route-page'));
  final GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RouteCubit>(
        create: (_) => RouteCubit(),
        child: BlocConsumer<RouteCubit, RoutePageState>(
          listener: (BuildContext context, RoutePageState state) {},
          builder: (BuildContext context, RoutePageState state) {
            return Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                  leading: getIconForAppBar(context),
                  title: const Text('Route'),
                  centerTitle: true,
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.cog,
                        color: Colors.white,
                        semanticLabel: 'Settings',
                        size: 35,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState!.openEndDrawer();
                      },
                    ),
                  ]),
              endDrawer: const RoutePageDrawer(),
              body: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                    return const RoutePreviewCard(
                      imagePath: 'assets/images/test-map.jpg',
                    );
                  }, childCount: 50))
                ],
              ),
            );
          },
        ));
  }
}
