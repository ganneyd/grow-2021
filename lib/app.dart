import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_run_v1/features/grow/data/datasources/remote/firebase/grow_remote_datasoure.dart';
import 'package:grow_run_v1/features/grow/data/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/data/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/data/repositories/grow_repository.dart';
import 'package:grow_run_v1/features/grow/data/repositories/parent_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/grow_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/parent_repository.dart';

import 'features/grow/domain/repositories/authentication_repository.dart';
import 'features/grow/domain/repositories/child_repository.dart';
import 'features/grow/presentation/bloc/authentication_bloc.dart';
import 'features/grow/presentation/child/pages/home/view/home_page.dart';
import 'features/grow/presentation/pages/login/view/login_page.dart';
import 'features/grow/presentation/pages/splash_page.dart';
import 'features/grow/theme.dart';

///Main start point for the app
class App extends StatelessWidget {
  ///
  const App() : super(key: const Key('app'));
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: <RepositoryProvider<dynamic>>[
          RepositoryProvider<AuthenticationRepository>(
              create: (_) => AuthenticationRepositoryImplementation(
                  FirebaseAuth.instance)),
          RepositoryProvider<ChildRepository>(
              create: (_) => ChildRepositoryImplementation(
                  RemoteDataSourceImplementation(FirebaseFirestore.instance))),
          RepositoryProvider<ParentRepository>(
              create: (_) => ParentRepositoryImplementation(
                  RemoteDataSourceImplementation(FirebaseFirestore.instance))),
          RepositoryProvider<GROWRepository>(
              create: (_) => GROWRepositoryImplementation(
                  RemoteDataSourceImplementation(FirebaseFirestore.instance))),
        ],
        child: BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(
              authenticationRepository:
                  context.read<AuthenticationRepository>()),
          child: const AppView(),
        ));
  }
}

///The ui
class AppView extends StatefulWidget {
  ///
  const AppView() : super(key: const Key('app-view'));

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      navigatorKey: _navigatorKey,
      builder: (BuildContext context, Widget? child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (BuildContext context, AuthenticationState state) {
            print(state.status);
            if (state.status == AuthenticationStatus.childAuthenticated) {
              _navigator.pushAndRemoveUntil(HomePage.route(), (_) => false);
            }
            if (state.status == AuthenticationStatus.unauthenticated) {
              _navigator.pushAndRemoveUntil(LoginPage.route(), (_) => false);
            }
            if (state.status == AuthenticationStatus.authenticated) {
              _navigator.pushAndRemoveUntil(HomePage.route(), (_) => false);
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
