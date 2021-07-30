import 'package:flutter/material.dart';
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
      case '/child-sign-up':
        return MaterialPageRoute<void>(
            builder: (_) => const child_view.ChildSignUpForm());
      case '/child-home':
        return MaterialPageRoute<void>(
            builder: (_) => const child_view.HomePage());
      case '/parent-home':
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
    return MaterialPageRoute<void>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('ERROR'),
          ),
          body: const Center(
            child: Text('Error'),
          ));
    });
  }
}