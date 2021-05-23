import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/data/models/models_bucket.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_widget/form_widget_1.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_widget/form_widget_2.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_widget/form_widget_3.dart';
import 'package:grow_run_v1/features/grow/presentation/utils/forms_interface.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/default_ui_elements.dart';

///The child's sign up form

class ChildSignUpForm extends StatefulWidget {
  ///
  const ChildSignUpForm() : super(key: const Key('Child-Sign-Up-Form'));
  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const ChildSignUpForm());
  }

  @override
  _ChildSignUpFormState createState() => _ChildSignUpFormState();
}

class _ChildSignUpFormState extends State<ChildSignUpForm> {
  int pageNumber = 0;
  final List<ReactiveFormGroup> formPages = [
    ChildSignUpFormOne(),
    ChildSignUpFormTwo(
      schools: [SchoolModel(name: 'St.Martin'), SchoolModel(name: 'St.Joe')],
    ),
    ChildSignUpFormThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultUIElements.getDefaultAppBar(
            context: context, appBarName: 'Sign Up'),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  final Animation<Offset> inAnimation = Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: const Offset(0.0, 0.0))
                      .animate(animation);
                  final Animation<Offset> outAnimation = Tween<Offset>(
                          begin: const Offset(-1.0, 0.0),
                          end: const Offset(0.0, 0.0))
                      .animate(animation);
                  if (child.key == formPages[pageNumber].key) {
                    return SlideTransition(
                      position: inAnimation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  } else {
                    return SlideTransition(
                      position: outAnimation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  }
                },
                child: formPages[pageNumber],
              ),
            ),
            Expanded(
                child: Center(
              child: ElevatedButton(
                onPressed: () => formPages[pageNumber].reactiveFormGroup.valid
                    ? setState(() {
                        if (pageNumber < formPages.length - 1) {
                          ++pageNumber;
                        }
                      })
                    : () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(const SnackBar(
                            content: Text('Please fill out the form'),
                            backgroundColor: Colors.red,
                          ));
                      },
                child: const Text('Continue'),
              ),
            )),
          ],
        ));
  }
}
