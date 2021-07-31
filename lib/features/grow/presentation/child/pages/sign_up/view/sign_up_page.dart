import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/grow_repository.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/sign_up/cubit/child_sign_up_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/sign_up/view/sign_up_body.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/default_ui_elements.dart';

///The child's sign up form

class ChildSignUpForm extends StatefulWidget {
  ///
  const ChildSignUpForm() : super(key: const Key('Child-Sign-Up-Form'));

  @override
  _ChildSignUpFormState createState() => _ChildSignUpFormState();
}

class _ChildSignUpFormState extends State<ChildSignUpForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChildSignUpCubit>(
      create: (_) => ChildSignUpCubit(
          growRepository: context.read<GROWRepository>(),
          childRepository: context.read<ChildRepository>(),
          authenticationRepository: context.read<AuthenticationRepository>())
        ..getData(),
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: DefaultUIElements.getDefaultAppBar(
            context: context, appBarName: 'SignUP'),
        body: Center(
          child: DefaultUIElements.getDefaultPaddingContainer(
              child: const SignUpPageBody()),
        ),
      ),
    );
  }
}
