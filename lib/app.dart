import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_run_v1/features/grow/data/datasources/remote/firebase/grow_remote_datasource.dart';
import 'package:grow_run_v1/features/grow/data/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/data/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/data/repositories/grow_repository.dart';
import 'package:grow_run_v1/features/grow/data/repositories/location_repositor_implementation.dart';
import 'package:grow_run_v1/features/grow/data/repositories/parent_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/grow_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/location_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/parent_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/school_repository.dart';
import 'package:grow_run_v1/route_generator.dart';

import 'features/grow/data/repositories/school_repository.dart';
import 'features/grow/domain/repositories/authentication_repository.dart';
import 'features/grow/domain/repositories/child_repository.dart';
import 'features/grow/presentation/bloc/authentication_bloc.dart';
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
          RepositoryProvider<LocationRepository>(
              create: (_) => LocationRepositoryImplementation()),
          RepositoryProvider<SchoolRepository>(
              create: (_) => SchoolRepositoryImplementation(
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
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      navigatorKey: _navigatorKey,
      initialRoute: '/child/home',
      builder: (BuildContext context, Widget? child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (BuildContext context, AuthenticationState state) {
            if (state.status == AuthenticationStatus.childAuthenticated) {
              _navigator.pushNamedAndRemoveUntil('/child/home', (_) => false);
            }
            if (state.status == AuthenticationStatus.unauthenticated) {
              _navigator.pushNamedAndRemoveUntil('/child/home', (_) => false);
            }
            if (state.status == AuthenticationStatus.parentAuthenticated) {
              _navigator.pushNamedAndRemoveUntil('/parent/home', (_) => false);
            }
            if (state.status == AuthenticationStatus.uninitialized) {
              _navigator.pushNamedAndRemoveUntil('/child/home', (_) => false);
            }
          },
          child: child,
        );
      },
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
