import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/profile/cubit/profile_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/profile/cubit/profile_state.dart';

///
class ProfilePage extends StatelessWidget {
  ///
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
        create: (_) => ProfileCubit(),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (BuildContext context, ProfileState state) {},
          builder: (BuildContext context, ProfileState state) {
            return const Scaffold();
          },
        ));
  }
}
