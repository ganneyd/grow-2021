import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_run_v1/core/util/build_info.dart';
import 'package:grow_run_v1/features/grow/data/models/child_user_model.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/widgets/drawer_bottom_info.dart';

///Provides a drawer to the  child homepage
class HomePageDrawer extends StatelessWidget {
  ///takes no param key is [child-home-page-drawer]
  const HomePageDrawer(
      {required BuildInfo buildInfo, required ChildUserModel child})
      : _buildInfo = buildInfo,
        _child = child,
        super(key: const Key('child-home-page-drawer'));
  final BuildInfo _buildInfo;
  final ChildUserModel _child;
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.blueGrey),
        child: Drawer(
          child: Material(
            child: Stack(children: <Widget>[
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _buildExpansionHeader(
                    icon: FontAwesomeIcons.userCog,
                    title: 'Profile',
                    children: <ListTile>[
                      _buildExpansionItem(
                        context: context,
                        title: _child.childEntity.username,
                        subtitle: 'Username',
                        onTap: () {},
                      ),
                      _buildExpansionItem(
                        context: context,
                        title:
                            // ignore: lines_longer_than_80_chars
                            '${_child.childEntity.firstname} ${_child.childEntity.lastname}',
                        subtitle: 'Name',
                        onTap: () {},
                      ),
                      _buildExpansionItem(
                        context: context,
                        title: _child.email,
                        subtitle: 'Email',
                        onTap: () {},
                      ),
                      _buildExpansionItem(
                        context: context,
                        title:
                            // ignore: lines_longer_than_80_chars
                            '${DateTime.now().year - _child.childEntity.dateOfBirth!.year}',
                        subtitle: 'Age',
                        onTap: () {},
                      ),
                    ],
                  ),
                  _buildExpansionHeader(
                    icon: FontAwesomeIcons.school,
                    title: 'School',
                    children: <ListTile>[
                      _buildExpansionItem(
                        context: context,
                        title: _child.schoolEntity.name,
                        subtitle: 'Name',
                        onTap: () {},
                      ),
                      _buildExpansionItem(
                        context: context,
                        title: _child.schoolEntity.address,
                        subtitle: 'Address',
                        onTap: () {},
                      ),
                      _buildExpansionItem(
                        context: context,
                        title: '${_child.childEntity.gradeLevel}',
                        subtitle: 'Your Grade Level',
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              getDrawerBottomInfo(context, _buildInfo),
            ]),
          ),
        ));
  }

  ListTile _buildExpansionItem(
      {required String subtitle,
      required String title,
      required VoidCallback onTap,
      required BuildContext context}) {
    return ListTile(
        trailing: const Icon(
          CupertinoIcons.arrow_right,
          size: 15,
        ),
        title: Text(title),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.black26, fontSize: 10),
        ),
        onTap: onTap);
  }

  Widget _buildExpansionHeader(
      {required String title,
      required List<Widget> children,
      required IconData icon}) {
    return ExpansionTile(
      leading: Icon(icon),
      title: Text(
        title,
      ),
      children: children,
    );
  }
}
