import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/presentation/pages/login/widgets/form_group/login_form_group.dart';
import 'package:reactive_forms/reactive_forms.dart';

///
class LoginForm extends StatelessWidget {
  ///
  const LoginForm({required this.handler})
      : super(key: const Key('login-form'));
  // ignore: public_member_api_docs
  final void Function(String email, String password) handler;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
        form: () => LoginFormGroup.buildLoginPageInputs(),
        builder: (context, form, child) {
          return Column(
            children: <Widget>[
              ReactiveTextField<String>(
                formControlName: 'email',
              ),
              ReactiveTextField<String>(
                formControlName: 'password',
              ),
              ElevatedButton(
                onPressed: () => form.valid
                    ? handler(form.control('email').value.toString(),
                        form.control('password').value.toString())
                    : null,
                child: const Text('submit'),
              )
            ],
          );
        });
  }
}
