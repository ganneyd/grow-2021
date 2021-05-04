import 'package:grow_run_v1/features/grow/presentation/widgets/form_inputs/form_input_controllers.dart';
import 'package:reactive_forms/reactive_forms.dart';

///Returns a form group that is going to be used by the login page
///collects :
///[email]
///[password]

class LoginFormGroup {
  /// the login fields
  static FormGroup buildLoginPageInputs() => fb.group(<String, Object>{
        'email': FormInputsControllers.getEmailFieldInputController(),
        'password': FormInputsControllers.getPasswordFieldInputController()
      });
}
