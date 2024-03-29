import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/presentation/pages/forgot_password/view/reset_page.dart';
import 'package:grow_run_v1/features/grow/presentation/parent/pages/home/view/home_page.dart'
    as parent_view;
import 'features/grow/presentation/child/views_bucket.dart' as child_view;
import 'features/grow/presentation/pages/login/view/login_page.dart';

///Generates routes all in one place
class RouteGenerator {
  ///provide the named param [settings.name]
  ///either the route will be returned or the error route
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Getting the arguments passed in while Navigator.pushName
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute<void>(builder: (_) => const LoginPage());
      case '/reset_password':
        return MaterialPageRoute<void>(
          builder: (_) => const ResetPasswordPage(),
        );
      //**********************Child routes************************************
      case '/child/goals':
        return MaterialPageRoute<void>(builder: (_) => child_view.GoalsPage());
      case '/child/home':
        return MaterialPageRoute<void>(builder: (_) => child_view.HomePage());
      case '/child/leaderboard':
        return MaterialPageRoute<void>(
            builder: (_) => const child_view.LeaderBoard());
      case '/child/profile':

      case '/child/route':
        return MaterialPageRoute<void>(builder: (_) => child_view.RoutesPage());
      case '/child/run':
        return MaterialPageRoute<void>(builder: (_) => child_view.RunPage());
      case '/child/shop':
        return MaterialPageRoute<void>(
            builder: (_) => const child_view.StorePage());
      case '/child/sign-up':
        return MaterialPageRoute<void>(
            builder: (_) => const child_view.ChildSignUpForm());
      case '/child/stats':
        return MaterialPageRoute<void>(
            builder: (_) => const child_view.StatsPage());

      //**********************Child routes************************************
      case '/parent/home':
        return MaterialPageRoute<void>(
            builder: (_) => const parent_view.HomePage());
      default:
        //if no correct named provided then this
        return _errorRoute();
    }
  }

  ///Default Error page
  ///TODO IMPLEMENT OTHER ERROR PAGES such as network err etc
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<void>(
        maintainState: false,
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  'Error',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: const Color.fromRGBO(255, 85, 51, 1),
              ),
              body: Center(
                child: Platform.isAndroid
                    ? const CircularProgressIndicator()
                    : const CupertinoActivityIndicator(),
              ));
        });
  }
}
