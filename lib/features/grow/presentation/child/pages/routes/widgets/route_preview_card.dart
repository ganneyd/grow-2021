import 'package:flutter/material.dart';

///Shows a preview of a route the user ran
class RoutePreviewCard extends StatelessWidget {
  ///
  const RoutePreviewCard({required String imagePath})
      : _imagePath = imagePath,
        super(key: const Key('child-route-preview'));
  final String _imagePath;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Stack(
          children: <Widget>[
            Align(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(_imagePath), fit: BoxFit.fitHeight),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                width: constraints.maxWidth - 100,
                height: 300,
              ),
            ),
            Positioned(
              left: 40,
              right: 40,
              bottom: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: Text('Place',
                          style: Theme.of(context).primaryTextTheme.headline4),
                    ),
                    Flexible(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('2.00km  ',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline1!
                                .copyWith(color: Colors.black87)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
