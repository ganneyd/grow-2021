import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_group/sign_up_form_group.dart';
import 'package:grow_run_v1/features/grow/presentation/utils/forms_interface.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/default_ui_elements.dart';
import 'package:reactive_forms/reactive_forms.dart';

///
class ChildSignUpFormThree extends ReactiveFormGroup {
  ///
  ChildSignUpFormThree() : super(key: const Key('child-sign-up-form-3'));
  final FormGroup _formGroup = ChildSignUpForm.buildChildSignUpPage3();
  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
        form: () => _formGroup,
        builder: (context, form, child) {
          return DefaultUIElements.getDefaultPaddingContainer(
              child: Column(
            children: <Widget>[
              Flexible(
                  child: ReactiveTextField<String>(
                formControlName: 'child_password',
                decoration: const InputDecoration(hintText: 'Your password'),
              )),
              DefaultUIElements.getDefaultFormPadding(),
              ReactiveTextField<String>(
                formControlName: 'child_password_confirmation',
                decoration:
                    const InputDecoration(hintText: 'Confirm your Password'),
              ),
              DefaultUIElements.getDefaultFormPadding(),
              Flexible(
                child: ReactiveTextField<String>(
                  formControlName: 'parent_email',
                  decoration: const InputDecoration(hintText: "Parent's Email"),
                ),
              ),
              DefaultUIElements.getDefaultFormPadding(),
              Flexible(
                  child: ReactiveTextField<String>(
                formControlName: 'parent_password',
                decoration:
                    const InputDecoration(hintText: "Parent's Password"),
              ))
            ],
          ));
        });
  }

  @override
  FormGroup get reactiveFormGroup => _formGroup;
}
