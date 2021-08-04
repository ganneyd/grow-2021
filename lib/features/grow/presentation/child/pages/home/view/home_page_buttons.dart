import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/buttons/buttons_with_icon.dart';

///Widget that provides buttons that will overlay  the ui
class HomePageButtons extends StatelessWidget {
  ///Constructor key is [child-home-page-buttons]
  /// Takes one param that will be placed as the body
  const HomePageButtons(
    Widget body, {
    double edgeInset = 20,
    double spacingFactor = 20,
  })  : _body = body,
        _edgeInset = edgeInset,
        _spacingFactor = spacingFactor,
        super(key: const Key('child-home-page-buttons'));
  final Widget _body;
  final double _edgeInset;
  final double _spacingFactor;

  List<ButtonWithIcon> get _leftButtonsWithIcon => <ButtonWithIcon>[
        ButtonWithIcon(
            icon: FontAwesomeIcons.trophy,
            onPressed: () {
              print('routing to rank');
            },
            buttonName: 'rank'),
        ButtonWithIcon(
            icon: FontAwesomeIcons.calendar,
            onPressed: () {
              print('routing to goals');
            },
            buttonName: 'goals'),
        ButtonWithIcon(
            icon: FontAwesomeIcons.chartPie,
            onPressed: () {
              print('routing to stats');
            },
            buttonName: 'Stats'),
      ];

  List<Widget> get _rightButtonsWithIcon => <Widget>[
        ButtonWithIcon(
            width: 200,
            icon: FontAwesomeIcons.tv,
            onPressed: () {
              print('routing to ads');
            },
            buttonName: ''),
        Container(
          alignment: Alignment.centerRight,
          child: ButtonWithIcon(
              icon: FontAwesomeIcons.route,
              onPressed: () {
                print('routing to routes');
              },
              buttonName: 'routes'),
        )
      ];

  List<ButtonWithIcon> get _bottomButtonsWithIcon => <ButtonWithIcon>[
        ButtonWithIcon(
          buttonName: 'me',
          icon: FontAwesomeIcons.userAstronaut,
          onPressed: () {
            print('routing to me');
          },
        ),
        ButtonWithIcon(
          buttonName: 'shop',
          icon: FontAwesomeIcons.storeAlt,
          onPressed: () {
            print('routing to shop');
          },
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SizedBox(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: Stack(
          children: <Widget>[
            _body,

            Padding(
              padding: const EdgeInsets.only(bottom: 300),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedTextKit(
                      repeatForever: true,
                      pause: const Duration(milliseconds: 0),
                      animatedTexts: <AnimatedText>[
                        ScaleAnimatedText(
                          'Tap to Start',
                          textStyle:
                              Theme.of(context).primaryTextTheme.headline5!,
                        )
                      ])),
            ),

            ///left column buttons
            Positioned(
                // height: constraints.maxHeight,
                width: 70,
                left: _edgeInset,
                top: _edgeInset,
                child: _getListView(_leftButtonsWithIcon)),

            Positioned(
                //height: constraints.maxHeight,
                width: 120,
                right: _edgeInset,
                top: _edgeInset,
                child: _getListView(_rightButtonsWithIcon)),
            Positioned(
              width: constraints.maxWidth - _edgeInset * 2,
              bottom: _edgeInset,
              left: _edgeInset,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _bottomButtonsWithIcon,
              ),
            ),
          ],
        ),
      );
    });
  }

//returns a list view
  ListView _getListView(List<Widget> buttonList) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: buttonList.length,
      itemBuilder: (BuildContext context, int items) {
        return buttonList[items];
      },
      separatorBuilder: (BuildContext context, int items) => SizedBox(
        height: _spacingFactor,
      ),
    );
  }
}
