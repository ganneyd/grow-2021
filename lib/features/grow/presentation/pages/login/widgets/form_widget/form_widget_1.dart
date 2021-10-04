import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/presentation/pages/login/widgets/form_group/login_form_group.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/default_ui_elements.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../child/pages/sign_up/view/sign_up_page.dart';

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
      builder: (BuildContext context, FormGroup form, Widget? child) {
        return Column(
          children: <Widget>[
            DefaultUIElements.getEmailInput(
              formControlName: 'email',
              hintText: 'Email or Username',
            ),
            DefaultUIElements.getDefaultFormPadding(),
            ReactiveTextField<String>(
              formControlName: 'password',
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            CupertinoButton(
              onPressed: () => Navigator.pushNamed(context, '/reset_password'),
              child: Text(
                'Forgot password?',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () => form.valid
                  ? handler(
                      form.control('email').value.toString(),
                      form.control('password').value.toString(),
                    )
                  : null,
              child: const Text('SUBMIT'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                CupertinoButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/child/sign-up'),
                  child: Text(
                    'Sign up',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
