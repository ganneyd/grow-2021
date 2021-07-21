import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_group/sign_up_form_group.dart';
import 'package:grow_run_v1/features/grow/presentation/utils/forms_interface.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/default_ui_elements.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_group/get_form_validators.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_inputs/form_gender_input.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_status.dart';
import 'package:reactive_forms/reactive_forms.dart';

///
class ChildSignUpFormOne extends StatelessWidget {
  ////
  ChildSignUpFormOne({required this.formgroup})
      : super(key: const Key('child-sign-up-form-1'));
  final FormGroup formgroup;

  ///the form group for this form
  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
        form: () => formgroup,
        builder: (context, form, child) {
          return DefaultUIElements.getDefaultPaddingContainer(
              child: Column(
            children: <Widget>[
              Flexible(
                child: ReactiveTextField<String>(
                  formControlName: 'username',
                  decoration: const InputDecoration(hintText: 'Username'),
                ),
              ),
              DefaultUIElements.getDefaultFormPadding(),
              Flexible(
                child: DefaultUIElements.getEmailInput(
                    formControlName: 'child_email'),
              ),
              DefaultUIElements.getDefaultFormPadding(),
              Flexible(
                  child: Row(
                children: <Widget>[
                  Flexible(
                    child: ReactiveTextField<String>(
                      formControlName: 'firstname',
                      decoration: const InputDecoration(hintText: 'First Name'),
                    ),
                  ),
                  DefaultUIElements.getDefaultFormPadding(),
                  Flexible(
                    child: ReactiveTextField<String>(
                      formControlName: 'lastname',
                      decoration: const InputDecoration(hintText: 'Last Name'),
                    ),
                  ),
                ],
              )),
              DefaultUIElements.getDefaultFormPadding(),
              Flexible(
                child: ReactiveGenderInput(
                  size: MediaQuery.of(context).size,
                  formControlName: 'gender',
                ),
              )
            ],
          ));
        });
  }
}
