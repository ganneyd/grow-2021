import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context),
        child: Drawer(
          child: Material(
            child: ListView(
              children: <Widget>[
                _buildMenuItem(
                  label: 'Profile',
                  icon: FontAwesomeIcons.userCog,
                  onTap: () {},
                ),
                _buildMenuItem(
                  label: 'School',
                  icon: Icons.school,
                  onTap: () {},
                ),
                _buildMenuItem(
                  label: 'Routes',
                  icon: FontAwesomeIcons.route,
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.airbnb,
                    color: Theme.of(context).iconTheme.color ?? Colors.red,
                  ),
                  title: const Text('Test'),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildMenuItem(
      {required String label,
      required IconData icon,
      required VoidCallback onTap}) {
    return ListTile(leading: Icon(icon), title: Text(label), onTap: onTap);
  }
}
