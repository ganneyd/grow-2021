import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/presentation/bloc/authentication_bloc.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/home/cubit/home_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/home/cubit/home_state.dart';

///The home page for the child user
class HomePage extends StatelessWidget {
  ///Route for this page
  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  ///
  const HomePage() : super(key: const Key('child-home-page'));

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (_) => HomePageCubit(
          childRepository: context.read<ChildRepository>(),
          authenticationRepository: context.read<AuthenticationRepository>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: <Widget>[
            IconButton(
              key: const Key('homePage_logout_iconButton'),
              icon: const Icon(Icons.exit_to_app),
              onPressed: () => context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationLogoutRequested()),
            )
          ],
        ),
        body: HomeBody(),
      ),
    );
  }
}

///The body of the home page
class HomeBody extends StatelessWidget {
  ///
  const HomeBody() : super(key: const Key('child-home-body'));

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) {
        if (state.status == HomeStateStatus.loadedSuccessfully) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: const Text('found your profile!'),
              backgroundColor: Theme.of(context).primaryColor,
            ));
        }

        if (state.status == HomeStateStatus.loadedUnsuccessfully) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(state.error ?? ' '),
              backgroundColor: Colors.red,
            ));
        }
      },
      builder: (context, state) {
        return Container(
          child: Column(
            children: [
              Text('Child first name : ${state.child.firstname}'),
              Text('Child last name : ${state.child.lastname}'),
              Text('Child gender name : ${state.child.gender.toString()}'),
              Text('Child gradeLevel name : ${state.child.gradeLevel}'),
            ],
          ),
        );
      },
    );
  }
}
