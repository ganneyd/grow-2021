import 'package:grow_run_v1/features/grow/presentation/widgets/form_inputs/form_input_controllers.dart';
import 'package:reactive_forms/reactive_forms.dart';

///Returns form groups that is going to be used by the child's sign up forms
///[username]
///[first_name]
///[last_name]
///[childEmail]
///[gender]
///
///page 2:
///[age] [school] [grade_level]
///page 3:
///[parent_email], [parent_password]
class ChildSignUpForm {
  ///The 1st  page for the child signup form
  static FormGroup buildChildSignUpPage1() => fb.group(<String, Object>{
        'username': FormInputsControllers.getTextFieldInputController(),
        'firstname': FormInputsControllers.getTextFieldInputController(),
        'lastname': FormInputsControllers.getTextFieldInputController(),
        'email': FormInputsControllers.getEmailFieldInputController(
            isRequired: false),
        'gender': FormInputsControllers.getGenderFieldInputController(),
      });

  ///The 2nd page for the child sign up form
  static FormGroup buildChildSignUpPage2(
          {required int min,
          required int max,
          required int minAge,
          required int maxAge}) =>
      fb.group(<String, Object>{
        'age': FormInputsControllers.getMinAndMaxNumberInputController(
            min: minAge, max: maxAge),
        'school': FormInputsControllers.getSchoolFieldInputController(),
        'grade_level': FormInputsControllers.getMinAndMaxNumberInputController(
            min: min, max: max),
      });

  ///The 3rd page for the child sign up form
  ///[child_password][child_password_confirmation]
  ///[parent_email][parent_password]
  static FormGroup buildChildSignUpPage3() => fb.group(<String, Object>{
        'child_password':
            FormInputsControllers.getPasswordFieldInputController(),
        'child_password_confirmation': '',
        'parent_email': FormInputsControllers.getEmailFieldInputController(),
        'parent_password':
            FormInputsControllers.getPasswordFieldInputController(),
      });
}
