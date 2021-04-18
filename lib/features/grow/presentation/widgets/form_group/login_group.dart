import 'package:grow_run_v1/features/grow/presentation/widgets/form_inputs/form_input_controllers.dart';
import 'package:reactive_forms/reactive_forms.dart';

///Hnadles form login for all users
class LoginForm {
  ///Returns the controllers for the email and password fields
  static FormGroup buildLoginFormGroup() => fb.group(<String, Object>{
        'email': FormInputsControllers.getEmailFieldInputController(),
        'password': FormInputsControllers.getPasswordFieldInputController(),
      });
}
