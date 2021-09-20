import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/date_slider.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/app_bar_icons.dart';

///
class SliverAppBarWithShape extends StatefulWidget {
  ///
  const SliverAppBarWithShape(
      {Key? key,
      required ScrollController scrollController,
      required String titleName,
      required Widget background,
      required String pageName,
      Widget slider = const SizedBox.shrink(),
      bool slantedRight = true,
      Color? backgroundColor})
      : _scrollController = scrollController,
        _titleName = titleName,
        _pageName = pageName,
        _isSlantedRight = slantedRight,
        _background = background,
        _backgroundColor = backgroundColor,
        _slider = slider,
        super(key: key);
  final ScrollController _scrollController;
  final String _titleName;
  final Widget _background;
  final Widget _slider;
  final Color? _backgroundColor;
  final String _pageName;
  final bool _isSlantedRight;
  @override
  _SliverAppBarWithShapeState createState() => _SliverAppBarWithShapeState();
}

class _SliverAppBarWithShapeState extends State<SliverAppBarWithShape> {
  bool sliverCollapsed = false;
  String myTitle = 'TEst';
  double angle = 0;
  final double containerSize = 60;
  final double expandedSize = 400;
  @override
  Widget build(BuildContext context) {
    angle = atan(50 / MediaQuery.of(context).size.width) *
        (widget._isSlantedRight ? 1 : -1);
    widget._scrollController.addListener(() {
      if (widget._scrollController.offset > 220 &&
          !widget._scrollController.position.outOfRange) {
        if (!sliverCollapsed) {
          // do what ever you want when silver is collapsing !

          setState(() {
            sliverCollapsed = true;
          });
        }
      }
      if (widget._scrollController.offset <= 220 &&
          !widget._scrollController.position.outOfRange) {
        if (sliverCollapsed) {
          // do what ever you want when silver is expanding !

          setState(() {
            sliverCollapsed = false;
          });
        }
      }
    });
    return SliverAppBar(
      pinned: true,
      elevation: 10,
      shape: sliverCollapsed
          ? null
          : SlantedRectangleShape(slantRight: widget._isSlantedRight),
      forceElevated: true,
      leading: getIconForAppBar(context),
      title: Text(widget._pageName,
          style: TextStyle(
              fontSize: 36,
              fontFamily: GoogleFonts.balooThambi().fontFamily,
              shadows: const <Shadow>[
                Shadow(
                  offset: Offset(0, 4),
                  blurRadius: 6.0,
                  color: Color.fromRGBO(0, 0, 0, 0.10),
                ),
              ])),
      backgroundColor: widget._backgroundColor,
      collapsedHeight: kToolbarHeight + containerSize,
      expandedHeight: expandedSize,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Transform(
              transform: sliverCollapsed
                  ? Matrix4(
                      1,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                      0,
                      15.8,
                      0,
                      1,
                    )
                  : Matrix4(
                      1,
                      angle,
                      0,
                      0,
                      0,
                      1,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                      0,
                      widget._isSlantedRight ? -22.5 : 10.7,
                      0,
                      1,
                    ),
              child: Container(
                color: const Color.fromRGBO(0, 0, 0, 0.25),
                height: containerSize,
                child: widget._slider,
              )),
          background: ClipPath(
              clipBehavior: Clip.hardEdge,
              clipper: const RectangleClipping(),
              child: widget._background)),
      centerTitle: true,
    );
  }
}

///
class SlantedRectangleShape extends ContinuousRectangleBorder {
  ///
  const SlantedRectangleShape({bool slantRight = true})
      : _slantRight = slantRight;
  final bool _slantRight;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path();
    path.lineTo(0, _slantRight ? rect.height - 50 : rect.height);
    path.lineTo(rect.width, _slantRight ? rect.height : rect.height - 50);
    path.lineTo(rect.width, 0.0);
    path.close();
    return path;
  }
}

///
class RectangleClipping extends CustomClipper<Path> {
  ///
  const RectangleClipping({bool slantRight = true}) : _slantRight = slantRight;
  final bool _slantRight;

  @override
  Path getClip(Size rect) {
    final Path path = Path();
    path.lineTo(0, _slantRight ? rect.height - 50 : rect.height);
    path.lineTo(rect.width, _slantRight ? rect.height : rect.height - 50);
    path.lineTo(rect.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
