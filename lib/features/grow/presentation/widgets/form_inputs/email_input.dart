import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_inputs/cubit/form_input_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_inputs/form_inputs.dart';
import 'package:reactive_forms/reactive_forms.dart';

///
class EmailInputControl extends FormInputControl {
  final FormControl<String> _formControl =
      FormControl<String>(validators: [Validators.required, Validators.email]);

  @override
  String getErrorMsg() {
    if (_formControl.hasErrors) {
      return 'Please enter a valid email';
    }
    return ' ';
  }

  @override
  String getValue() {
    return _formControl.value.toString();
  }
}

///
class EmailInput extends FormInput<String> {
  ///
  EmailInput({required FormInputCubitMixin delegate})
      : super(
          key: Key(FORM_INPUT_NAMES.email.toString()),
          formInputControl: EmailInputControl(),
          handler: (String value) => delegate.emailChanged(value),
          inputType: TextInputType.emailAddress,
          helperText: 'Ex: johndoe@example.com',
          labelText: 'Enter your email',
        );
}
