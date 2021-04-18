import 'package:flutter/material.dart';

part 'constant_sizes.dart';
part 'constant_colors.dart';

///Functions that return defaut UI elements that may be used accross the app

///Returns the default app bar based on the theme contained in the passed
///[context] with the [appBarName]
AppBar getDefaultAppBar({
  required BuildContext context,
  required String appBarName,
}) =>
    AppBar(
      toolbarHeight: defaultToolbarHeight,
      title: Text(
        appBarName,
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(gradient: gradient1),
      ),
    );
