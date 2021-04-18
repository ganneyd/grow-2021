import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_group/sign_up_form_group.dart';
import 'package:reactive_forms/reactive_forms.dart';

///
class ChildSignUpFormThree extends StatelessWidget {
  ///
  const ChildSignUpFormThree() : super(key: const Key('child-sign-up-form-3'));

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
        formGroup: ChildSignUpForm.buildChildSignUpPage3(),
        child: Column(
          children: <Widget>[
            ReactiveTextField<String>(
              formControlName: 'child_password',
            ),
            ReactiveTextField<String>(
              formControlName: 'child_password_confirmation',
            ),
            ReactiveTextField<String>(
              formControlName: 'parent_email',
            ),
            ReactiveTextField<String>(
              formControlName: 'parent_password',
            )
          ],
        ));
  }
}
