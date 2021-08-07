import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_run_v1/core/util/build_info.dart';
import 'package:grow_run_v1/features/grow/presentation/bloc/authentication_bloc.dart';
import 'package:provider/provider.dart';

///Returns a drawer
Align getDrawerBottomInfo(
  BuildContext context,
  BuildInfo buildInfo,
) =>
    Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.signOutAlt,
                    color: Theme.of(context).iconTheme.color ?? Colors.red,
                  ),
                  title: const Text('Log Out'),
                  onTap: () => context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationLogoutRequested()),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(
                        text: 'GROW ',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        children: <TextSpan>[
                      TextSpan(text: buildInfo.version),
                      TextSpan(
                          text: '+${buildInfo.buildNumber}',
                          style: TextStyle(
                              color: Theme.of(context).iconTheme.color ??
                                  Colors.red)),
                    ])),
                RichText(
                    text: const TextSpan(
                  text: '-Developed By- ',
                  style: TextStyle(color: Colors.black, fontSize: 8),
                )),
                RichText(
                    text: const TextSpan(
                  text: '👨🏽‍💻 Ganney A. Dortch 👨🏽‍💻',
                  style: TextStyle(color: Colors.black, fontSize: 10),
                )),
              ],
            ),
          )),
    );
