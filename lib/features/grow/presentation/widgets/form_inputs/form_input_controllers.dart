import 'package:flutter/material.dart';
import 'package:grow_run_v1/core/util/gender.dart';
import 'package:grow_run_v1/features/grow/data/models/school/school_model.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_inputs/form_input_types.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:enum_to_string/enum_to_string.dart';

///Returns various controllers to be used in form groups
class FormInputsControllers {
  static const String _passwordRegExp = r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
  String _fieldNameToDisplayName(FORM_INPUT_NAMES fieldName) {
    switch (fieldName) {
      case FORM_INPUT_NAMES.age:
        return 'Age';
      case FORM_INPUT_NAMES.cPassword:
        return 'Confirm Password';
      case FORM_INPUT_NAMES.email:
        return 'Email';
      case FORM_INPUT_NAMES.fName:
        return 'First Name';
      case FORM_INPUT_NAMES.gender:
        return 'Gender';
      case FORM_INPUT_NAMES.gradeLevel:
        return 'Grade Level';
      case FORM_INPUT_NAMES.lName:
        return 'Last Name';
      case FORM_INPUT_NAMES.password:
        return 'Password';
      case FORM_INPUT_NAMES.phoneNumber:
        return 'Phone Number';
      case FORM_INPUT_NAMES.school:
        return 'School';
      case FORM_INPUT_NAMES.username:
        return 'Username';
      default:
        return '$fieldName';
    }
  }

  ///Returns a reactive text field input
  static FormControl<String> getTextFieldInputController() {
    return FormControl<String>(
      validators: [
        Validators.required,
      ],
    );
  }

  ///Returns a reactive password field input
  static FormControl<String> getPasswordFieldInputController() {
    return FormControl<String>(validators: [
      Validators.required,
      Validators.pattern(RegExp(FormInputsControllers._passwordRegExp)),
    ]);
  }

  ///Form Control for the email input
  static FormControl<String> getEmailFieldInputController(
      {bool isRequired = true}) {
    final List<Map<String, dynamic>? Function(AbstractControl control)>
        validators = [
      Validators.email,
      Validators.required,
    ];
    final List<ValidatorFunction> validatorsNotRequired = [Validators.email];

    return FormControl<String>(
        validators: isRequired ? validators : validatorsNotRequired);
  }

  ///Form control for the gender input
  //TODO fix so it can used with Gender and not String
  static FormControl<String> getGenderFieldInputController() {
    return FormControl<String>(
        value: EnumToString.convertToString(Gender.not_specified));
  }

  ///Form controls for age inputs
  static FormControl<int> getAgeFieldInputController() {
    return FormControl<int>(validators: [
      Validators.requiredTrue,
    ]);
  }

  ///Form control for school dropdown
  static FormControl<SchoolModel> getSchoolFieldInputController() {
    return FormControl<SchoolModel>(validators: [Validators.required]);
  }

  ///Form control for inputs with a min and max number range
  static FormControl<int> getMinAndMaxNumberInputController({
    required int min,
    required int max,
  }) {
    return FormControl<int>(validators: [
      Validators.required,
      Validators.max(max),
      Validators.min(min)
    ]);
  }
}

///TODO handle error msgs
///
