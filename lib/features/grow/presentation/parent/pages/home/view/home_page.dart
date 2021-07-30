import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/parent_repository.dart';
import 'package:grow_run_v1/features/grow/presentation/bloc/authentication_bloc.dart';
import 'package:grow_run_v1/features/grow/presentation/parent/pages/home/cubit/home_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/default_ui_elements.dart';

///The HomePage for the Parent
class HomePage extends StatelessWidget {
  ///The Parent's home page with key [parent-home-page]
  const HomePage() : super(key: const Key('parent-home-page'));

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (_) => HomePageCubit(
          authenticationRepository: context.read<AuthenticationRepository>(),
          parentRepository: context.read<ParentRepository>()),
      child: Scaffold(
        appBar: DefaultUIElements.getDefaultAppBar(
          context: context,
          appBarName: 'Parent',
          actions: <IconButton>[
            IconButton(
              key: const Key('parent_home_page_logout_iconButton'),
              icon: const Icon(Icons.exit_to_app),
              onPressed: () => context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationLogoutRequested()),
            )
          ],
        ),
        body: const HomeBody(),
      ),
    );
  }
}

///The HomeBody for the Parent
class HomeBody extends StatelessWidget {
  ///The home body constructor key [parent-home-body]
  const HomeBody() : super(key: const Key('parent-home-body'));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedTextKit(
        animatedTexts: <AnimatedText>[
          RotateAnimatedText('Coming soon ...',
              textStyle: Theme.of(context)
                  .primaryTextTheme
                  .bodyText1!
                  .copyWith(fontSize: 40)),
        ],
        repeatForever: true,
      ),
    );
  }
}
