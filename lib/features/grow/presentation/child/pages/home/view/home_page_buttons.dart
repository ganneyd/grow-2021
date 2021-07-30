import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/buttons/buttons_with_icon.dart';

///Widget that provides buttons that will overlay  the ui
class HomePageButtons extends StatelessWidget {
  ///Constructor key is [child-home-page-buttons]
  /// Takes one param that will be placed as the body
  const HomePageButtons(Widget body)
      : _body = body,
        super(key: const Key('child-home-page-buttons'));

  final Widget _body;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Stack(
        children: <Widget>[
          _body,

          ///left column buttons
          Positioned(
            height: constraints.maxHeight / 2.6,
            left: 20,
            top: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWithIcon(
                    icon: FontAwesomeIcons.trophy,
                    onPressed: () {},
                    buttonName: 'rank'),
                ButtonWithIcon(
                    icon: FontAwesomeIcons.calendar,
                    onPressed: () {},
                    buttonName: 'goals'),
                ButtonWithIcon(
                    icon: FontAwesomeIcons.chartPie,
                    onPressed: () {},
                    buttonName: 'Stats'),
              ],
            ),
          ),
          Positioned(
            height: constraints.maxHeight / 4.2,
            right: 20,
            top: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ButtonWithIcon(
                    width: 200,
                    icon: FontAwesomeIcons.tv,
                    onPressed: () {},
                    buttonName: ''),
                ButtonWithIcon(
                    icon: FontAwesomeIcons.route,
                    onPressed: () {},
                    buttonName: 'routes'),
              ],
            ),
          ),
          Positioned(
            width: constraints.maxWidth - 20,
            bottom: 10,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWithIcon(
                  buttonName: 'me',
                  icon: FontAwesomeIcons.userAstronaut,
                  onPressed: () {},
                ),
                ButtonWithIcon(
                  buttonName: 'shop',
                  icon: FontAwesomeIcons.storeAlt,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
