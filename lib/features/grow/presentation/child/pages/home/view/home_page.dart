import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_run_v1/core/util/util.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/grow_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/school_repository.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/home/cubit/home_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/home/cubit/home_state.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/home/view/drawer.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/home/view/home_page_buttons.dart';
import 'package:grow_run_v1/features/grow/theme.dart';

///The home page for the child user
class HomePage extends StatelessWidget {
  ///
  HomePage()
      : _scaffoldKey = GlobalKey(debugLabel: 'child-home-scaffold'),
        super(key: const Key('child-home-page'));
  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (_) => HomePageCubit(
          schoolRepository: context.read<SchoolRepository>(),
          childRepository: context.read<ChildRepository>(),
          authenticationRepository: context.read<AuthenticationRepository>(),
          growRepository: context.read<GROWRepository>())
        ..init(),
      child: BlocConsumer<HomePageCubit, HomePageState>(
        listener: (BuildContext context, HomePageState state) {
          if (state.status == HomeStateStatus.loadedSuccessfully) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                action: SnackBarAction(
                  label: 'Cancel',
                  onPressed: () {},
                ),
                content: const Text('found your profile!'),
                backgroundColor: Theme.of(context).primaryColor,
              ));
          }

          if (state.status == HomeStateStatus.loadedUnsuccessfully) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.error ?? ' '),
                backgroundColor: Colors.red,
              ));
          }
        },
        builder: (BuildContext context, HomePageState state) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                leadingWidth: 120,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: GestureDetector(
                    onTap: () => print('getting coins'),
                    child: const CoinsDisplay('1234'),
                  ),
                ),
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
            endDrawer: HomePageDrawer(
              buildInfo: state.buildInfo,
              child: state.child,
            ),
            body: Center(
              child: HomeBody(state),
            ),
          );
        },
      ),
    );
  }
}

///The body of the home page
class HomeBody extends StatelessWidget {
  ///
  const HomeBody(HomePageState state, {double imageWidth = 250})
      : _state = state,
        _imageWidth = imageWidth,
        super(key: const Key('child-home-body'));
  final HomePageState _state;
  final double _imageWidth;
  @override
  Widget build(BuildContext context) {
    final String pathToGenderAvatar = _state.child.childEntity.gender.isMale()
        ? 'assets/avatar/male/male.png'
        : 'assets/avatar/female/female.png';
    return HomePageButtons(
      GestureDetector(
          //let the white piece respond to gestures too
          behavior: HitTestBehavior.translucent,
          onTap: () => Navigator.of(context).pushNamed('/child/run'),
          child: Align(
            child: Image.asset(
              pathToGenderAvatar,
              width: _imageWidth,
              filterQuality: FilterQuality.high,
              fit: BoxFit.fitWidth,
            ),
          )),
      context: context,
    );
  }
}

///The balance of the user coins
class CoinsDisplay extends StatelessWidget {
  ///Creates a widget to display how much coins(in game currency) the user has
  const CoinsDisplay(this.coinsBalance)
      : super(key: const Key('child-coins-display'));
  final String coinsBalance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 1)],
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5),
                )),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: Icon(
                    FontAwesomeIcons.medal,
                    color: Theme.of(context).splashColor,
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Text(
                      coinsBalance,
                      style: Theme.of(context).primaryTextTheme.headline1,
                    ))
              ],
            ),
          ),
          Positioned(
            right: -45,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: const <BoxShadow>[BoxShadow(blurRadius: 2.5)],
                  color: Theme.of(context).splashColor,
                  border: Border.all(color: Colors.blueGrey, width: 6.5),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              width: 45,
              height: 45,
              child: const Icon(
                FontAwesomeIcons.plus,
                color: Colors.black26,
              ),
            ),
          )
        ],
      ),
    );
  }
}
