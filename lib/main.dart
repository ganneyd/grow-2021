import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/data/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'app.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // final String host =
  //     Platform.isAndroid ? '10.0.2.2:8070' : 'http://localhost:8070';
  // await FirebaseAuth.instance.useEmulator('http://localhost:9099');
  // FirebaseFirestore.instance.settings = Settings(
  //   host: host,
  //   sslEnabled: false,
  // );
  runApp(const App());
}
