import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:grow_run_v1/core/util/build_info.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/drawer_bottom_info.dart';

///Settings drawer for the route page
class RoutePageDrawer extends StatelessWidget {
  ///
  const RoutePageDrawer() : super(key: const Key('child-route-page-drawer'));

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.blueGrey),
        child: Drawer(
          child: Material(
            child: Stack(
              children: <Widget>[
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    AnimatedTextKit(animatedTexts: <FadeAnimatedText>[
                      FadeAnimatedText('Coming soon')
                    ])
                  ],
                ),
                getDrawerBottomInfo(context, const BuildInfo()),
              ],
            ),
          ),
        ));
  }
}
