import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/default_ui_elements.dart';
import 'package:reactive_forms/reactive_forms.dart';

///
class ChildSignUpFormThree extends StatelessWidget {
  ///
  ChildSignUpFormThree({required this.formGroup})
      : super(key: const Key('child-sign-up-form-3'));

  ///
  final FormGroup formGroup;

  ///list of the form inputs
  final List<Widget> _formInputs = <Widget>[
    ReactiveTextField<String>(
      formControlName: 'child_password',
      decoration: const InputDecoration(hintText: 'Your password'),
    ),
    ReactiveTextField<String>(
      formControlName: 'child_password_confirmation',
      decoration: const InputDecoration(hintText: 'Confirm your Password'),
    ),
    DefaultUIElements.getEmailInput(formControlName: 'parent_email'),
    ReactiveTextField<String>(
      formControlName: 'parent_password',
      decoration: const InputDecoration(hintText: "Parent's Password"),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
        form: () => formGroup,
        builder: (BuildContext context, FormGroup form, Widget? child) {
          return ListView.separated(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _formInputs.length,
            itemBuilder: (BuildContext context, int items) {
              return _formInputs[items];
            },
            separatorBuilder: (BuildContext context, int items) =>
                const SizedBox(
              height: 30,
            ),
          );
        });
  }
}
