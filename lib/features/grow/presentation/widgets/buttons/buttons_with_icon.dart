import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

///Provides  buttons that have an icon withi
class ButtonWithIcon extends StatelessWidget {
  ///Provides a button with a default [icon size = 30]
  ///that has the icon provided within
  ///pass the [icon] [iconsize] if you want it to be bigger
  ///[onPressed] for when the button is pressed
  ///[button name]
  //TODO sized box might overflow fix
  const ButtonWithIcon({
    required IconData icon,
    double width = 70,
    double height = 70,
    double scaleFactor = 0.55,
    required VoidCallback onPressed,
    required String buttonName,
  })  : _icon = icon,
        _width = width,
        _height = height,
        _onPressed = onPressed,
        _buttonName = buttonName,
        _scaleFactor = scaleFactor,
        super();

  final IconData _icon;
  final double _width;
  final double _height;
  final VoidCallback _onPressed;
  final String _buttonName;
  final double _scaleFactor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(
        maxHeight: _height,
        maxWidth: _width,
      ),
      shape: const RoundedRectangleBorder()
          .copyWith(borderRadius: const BorderRadius.all(Radius.circular(15))),
      fillColor: Theme.of(context).buttonColor,
      splashColor: Theme.of(context).splashColor,
      onPressed: _onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FaIcon(
                _icon,
                size: _height < _width
                    ? _height * _scaleFactor
                    : _width * _scaleFactor,
              ),
            ),
          ),
          Flexible(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: RichText(
              text: TextSpan(
                  text: _buttonName.toUpperCase(),
                  style: Theme.of(context).primaryTextTheme.button),
            ),
          ))
        ],
      ),
    );
  }
}
