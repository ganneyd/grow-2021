import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/presentation/pages/login/cubit/login_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/pages/login/cubit/login_state.dart';
import 'package:grow_run_v1/features/grow/presentation/pages/login/widgets/form_widget/form_widget_1.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/default_ui_elements.dart';

///
class LoginPage extends StatelessWidget {
  ///
  const LoginPage() : super(key: const Key('login-page'));

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginPageCubit>(
        create: (_) => LoginPageCubit(
            authenticationRepository: context.read<AuthenticationRepository>()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: Center(
            child: DefaultUIElements.getDefaultPaddingContainer(
                child: const LoginPageBody()),
          ),
        ));
  }
}

///
class LoginPageBody extends StatelessWidget {
  ///
  const LoginPageBody() : super(key: const Key('login-page-body'));
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginPageCubit, LoginPageState>(
        listener: (BuildContext context, LoginPageState state) {
      if (state.status == LoginStateStatus.submittedUnsuccessfully) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(state.error ?? ' '),
            backgroundColor: Colors.red,
          ));
        if (state.status == LoginStateStatus.submittedSuccessfully) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: const Text('Found your profile'),
                backgroundColor: Theme.of(context).primaryColor));
        }
      }
    }, builder: (BuildContext context, LoginPageState state) {
      return LoginForm(
        // ignore: always_specify_types
        handler: (email, password) {
          context.read<LoginPageCubit>().login(email, password);
        },
      );
    });
  }
}
