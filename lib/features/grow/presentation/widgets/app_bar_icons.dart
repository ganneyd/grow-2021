import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Padding getIconForAppBar(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: 20),
      child: IconButton(
        icon: const Icon(
          FontAwesomeIcons.arrowCircleLeft,
          size: 35,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
