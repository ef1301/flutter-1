import 'package:budget_tracker/firebase_options.dart';
import 'package:budget_tracker/google_auth.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker/form_panel.dart';
import 'package:budget_tracker/all_panels.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Budget Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Error");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return const AuthGate();
            }
            return const CircularProgressIndicator();
          },
        ));
  }
}
