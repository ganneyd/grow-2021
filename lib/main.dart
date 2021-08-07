import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
//Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // final String host =
  //     Platform.isAndroid ? '192.168.1.2:8080' : 'http://localhost:8080';
  await FirebaseAuth.instance.useAuthEmulator('192.168.1.2', 9099);
  FirebaseFunctions.instance.useFunctionsEmulator('192.168.1.2', 5001);

  FirebaseFirestore.instance.settings = const Settings(
    host: '192.168.1.2:8080',
    sslEnabled: false,
  );

  runApp(const App());
}
