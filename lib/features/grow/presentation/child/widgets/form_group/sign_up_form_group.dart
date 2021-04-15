import 'package:grow_run_v1/features/grow/presentation/widgets/form_inputs/form_text_inputs.dart';
import 'package:reactive_forms/reactive_forms.dart';

///
final FormInputs formInputs = FormInputs();

///The 1st  page for the child signup form
FormGroup buildSignUpPage1() => fb.group(<String, Object>{
      'username': formInputs.getTextFieldControl(),
      'first_name': formInputs.getTextFieldControl(),
      'last_name': formInputs.getTextFieldControl(),
      'email': formInputs.getEmailFieldInput(isRequired: false),
      'gender': formInputs.getGenderFieldInput(),
    });

///The 2nd page for the child sign up form
FormGroup buildSignUpPage2({required int min, required int max}) =>
    fb.group(<String, Object>{
      'age': formInputs.getAgeFieldInputController(),
      'school': formInputs.getSchoolFieldInputController(),
      'grade_level':
          formInputs.getMinAndMaxNumberInputController(min: min, max: max),
    });

///The 3rd page for the child sign up form
FormGroup buildSignUpPage3() => fb.group(<String, Object>{
      'parent-email': formInputs.getEmailFieldInput(),
      'parent-password': formInputs.getPasswordFieldInput(),
    });
