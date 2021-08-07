import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/default_ui_elements.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_inputs/form_gender_input.dart';
import 'package:reactive_forms/reactive_forms.dart';

///
class ChildSignUpFormOne extends StatelessWidget {
  ////
  ChildSignUpFormOne({required this.formgroup})
      : super(key: const Key('child-sign-up-form-1'));

  ///Formgroup for the first page
  final FormGroup formgroup;

  ///List of the form inputs
  final List<Widget> _formInputs = [
    ReactiveTextField<String>(
      formControlName: 'username',
      decoration: const InputDecoration(hintText: 'Username'),
    ),
    DefaultUIElements.getEmailInput(formControlName: 'child_email'),
    Row(
      children: <Widget>[
        Expanded(
          flex: 6,
          child: ReactiveTextField<String>(
            formControlName: 'firstname',
            decoration: const InputDecoration(hintText: 'First Name'),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 6,
          child: ReactiveTextField<String>(
            formControlName: 'lastname',
            decoration: const InputDecoration(hintText: 'Last Name'),
          ),
        ),
      ],
    ),
    ReactiveGenderInput(
      formControlName: 'gender',
    ),
  ];

  ///the form group for this form
  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
        form: () => formgroup,
        builder: (BuildContext context, FormGroup form, Widget? child) {
          return ListView.separated(
            itemCount: _formInputs.length,
            itemBuilder: (BuildContext context, int index) {
              return _formInputs[index];
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 50,
            ),
          );
        });
  }
}
