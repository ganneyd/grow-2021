import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../theme.dart';

part 'constant_sizes.dart';
part 'constant_colors.dart';

class DefaultUIElements {
  ///Functions that return defaut UI elements that may be used accross the app

  ///Returns the default app bar based on the theme contained in the passed
  ///[context] with the [appBarName]
  static AppBar getDefaultAppBar({
    required BuildContext context,
    required String appBarName,
  }) =>
      AppBar(
        toolbarHeight: defaultToolbarHeight,
        title: Text(
          appBarName,
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: gradient1),
        ),
      );

  ///Provides default padding inbetween elements
  static Padding getDefaultFormPadding() => const Padding(
      padding: EdgeInsets.only(
          top: defaultPaddingInBetweenForms, left: 10.0, right: 10.0));

  ///Padding element that provides a default padding
  static Padding getDefaultPaddingContainer({required Widget child}) => Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          color: theme.scaffoldBackgroundColor,
          child: child,
        ),
      );

  static ReactiveTextField<String> getEmailInput(
          {required String formControlName, String? hintText}) =>
      ReactiveTextField<String>(
        formControlName: formControlName,
        decoration: InputDecoration(
          hintText: hintText ?? 'Email',
        ),
        keyboardType: TextInputType.emailAddress,
        autofillHints: const <String>[AutofillHints.email],
      );
}
