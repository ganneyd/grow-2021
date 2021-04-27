import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_widget/form_widget_1.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_widget/form_widget_2.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_widget/form_widget_3.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/default_ui_elements.dart';

///
class ChildSignUpPage extends StatefulWidget {
  ///
  const ChildSignUpPage() : super(key: const Key('child-sign-up-page'));

  @override
  _ChildSignUpPageState createState() => _ChildSignUpPageState();
}

class _ChildSignUpPageState extends State<ChildSignUpPage> {
  final List<Widget> formPages = <Widget>[];
  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
