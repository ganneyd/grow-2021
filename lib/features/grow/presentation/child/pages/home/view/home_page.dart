import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/home/cubit/home_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/home/cubit/home_state.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/home/view/drawer.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/home/view/home_page_buttons.dart';

///The home page for the child user
class HomePage extends StatelessWidget {
  ///
  const HomePage() : super(key: const Key('child-home-page'));

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (_) => HomePageCubit(
          childRepository: context.read<ChildRepository>(),
          authenticationRepository: context.read<AuthenticationRepository>())
        ..getChildModel(),
      child: Scaffold(
        appBar: AppBar(),
        endDrawer: HomePageDrawer(),
        body: BlocConsumer<HomePageCubit, HomePageState>(
          listener: (BuildContext context, HomePageState state) {
            if (state.status == HomeStateStatus.loadedSuccessfully) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  action: SnackBarAction(
                    label: 'Cancel',
                    onPressed: () {},
                  ),
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
          builder: (BuildContext context, HomePageState state) {
            return Center(
              child: HomeBody(state),
            );
          },
        ),
      ),
    );
  }
}

///The body of the home page
class HomeBody extends StatelessWidget {
  ///
  const HomeBody(HomePageState state)
      : _state = state,
        super(key: const Key('child-home-body'));
  final HomePageState _state;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        HomePageButtons(GestureDetector(
          onTap: () {
            print('Background tapped');
          },
          child: Container(color: Colors.white10),
        )),
      ],
    );
  }
}
