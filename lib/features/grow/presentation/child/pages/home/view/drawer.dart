import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_run_v1/features/grow/presentation/bloc/authentication_bloc.dart';
import 'package:grow_run_v1/features/grow/presentation/parent/pages/home/cubit/home_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:provider/provider.dart';

///Provides a drawer to the  child homepage
class HomePageDrawer extends StatelessWidget {
  ///takes no param key is [child-home-page-drawer]
  const HomePageDrawer() : super(key: const Key('child-home-page-drawer'));

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context),
        child: Drawer(
          child: Material(
            child: ListView(
              children: <Widget>[
                _buildMenuItem(
                  context: context,
                  label: 'Profile',
                  icon: FontAwesomeIcons.userCog,
                  onTap: () {},
                ),
                _buildMenuItem(
                  context: context,
                  label: 'School',
                  icon: Icons.school,
                  onTap: () {},
                ),
                _buildMenuItem(
                  context: context,
                  label: 'Routes',
                  icon: FontAwesomeIcons.route,
                  onTap: () {},
                ),
                _buildMenuItem(
                  context: context,
                  label: 'Log Out',
                  icon: FontAwesomeIcons.signOutAlt,
                  onTap: () => context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationLogoutRequested()),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildMenuItem(
      {required String label,
      required IconData icon,
      required VoidCallback onTap,
      required BuildContext context}) {
    return ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).iconTheme.color ?? Colors.red,
        ),
        title: Text(label),
        onTap: onTap);
  }
}
