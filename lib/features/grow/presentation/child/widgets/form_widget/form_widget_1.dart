import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_group/sign_up_form_group.dart';
import 'package:reactive_forms/reactive_forms.dart';

///
class ChildSignUpFormOne extends StatelessWidget {
  ////
  const ChildSignUpFormOne() : super(key: const Key('child-sign-up-form-2'));

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
        formGroup: ChildSignUpForm.buildChildSignUpPage1(),
        child: Column(
          children: [
            ReactiveTextField<String>(
              formControlName: 'username',
            ),
            ReactiveTextField<String>(
              formControlName: 'email',
            ),
            Row(
              children: [
                ReactiveTextField<String>(
                  formControlName: 'first_name',
                ),
                ReactiveTextField<String>(
                  formControlName: 'last_name',
                ),
              ],
            ),
            //TODO: implement gender
          ],
        ));
  }
}
