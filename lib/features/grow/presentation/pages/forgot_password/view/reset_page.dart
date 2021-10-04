import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_run_v1/features/grow/presentation/pages/forgot_password/cubit/reset_password_state.dart';
import 'package:grow_run_v1/features/grow/presentation/pages/forgot_password/cubit/rest_password_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/default_ui_elements.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_inputs/form_input_controllers.dart';
import 'package:grow_run_v1/service_locator.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordCubit>(
      create: (_) => serviceLocator<ResetPasswordCubit>(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Reset Password'),
        ),
        body: Center(
          child: DefaultUIElements.getDefaultPaddingContainer(
            child: const ResetPasswordBody(),
          ),
        ),
      ),
    );
  }
}

///
class ResetPasswordFormGroup {
  ///
  static FormGroup buildResetPasswordPageInputs() => fb.group(<String, Object>{
        'email': FormInputsControllers.getEmailFieldInputController()
      });
}

///
class ResetPasswordBody extends StatelessWidget {
  ///
  const ResetPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordPageState>(
      listener: (BuildContext context, ResetPasswordPageState state) {
        if (state.status.resetLinkSentUnsuccessfully()) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Unable to send a reset link'),
              ),
            );
        }
        if (state.status.resetLinkSentSuccessfully()) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text('Check your email for the reset link.'),
              ),
            );
        }
      },
      builder: (BuildContext context, ResetPasswordPageState state) {
        return ReactiveFormBuilder(
          form: () => ResetPasswordFormGroup.buildResetPasswordPageInputs(),
          builder: (BuildContext context, FormGroup form, Widget? child) {
            return Column(
              children: [
                DefaultUIElements.getEmailInput(
                  formControlName: 'email',
                  hintText: 'Your email',
                ),
                ElevatedButton(
                  onPressed: () => form.valid
                      ? context.read<ResetPasswordCubit>().resetPassword(
                            form.control('email').value.toString(),
                          )
                      : null,
                  child: const Text('Send Link'),
                )
              ],
            );
          },
        );
      },
    );
  }
}
