import 'package:flutter/material.dart';

///Displays a circular progress indicator
class SplashPage extends StatelessWidget {
  ///
  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
