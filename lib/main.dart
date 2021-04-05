import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings =
      const Settings(host: 'localhost:8070', sslEnabled: false);
  runApp(const MyAwesomeApp());
}

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RichText(
      text: const TextSpan(text: 'Failure'),
      textDirection: TextDirection.ltr,
    ));
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

class MyAwesomeApp extends StatelessWidget {
  const MyAwesomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('message')
          .doc('B00ebxJiFFW7j1r2sYtJ')
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          final String err = snapshot.error!.toString();
          print(err);
          return const Center(
            child: Text(
              'Firebase initialized but Something went wrong;',
              textDirection: TextDirection.ltr,
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          final Map<String, dynamic> data = snapshot.data!.data()!;
          return Center(
              child: Text(
            "Success: ${data['text']} ",
            textDirection: TextDirection.ltr,
          ));
        }

        return const Loading();
      },
    );
  }
}
