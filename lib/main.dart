import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/OnePage/OnePage.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';
import 'package:flutter_auth/TwoPage/TwoPage.dart';
import 'package:flutter_auth/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute:
          auth.currentUser != null ? OnePage.routename : LoginScreen.routename,
      routes: {
        LoginScreen.routename: (_) => LoginScreen(),
        OnePage.routename: (_) => OnePage(),
        TwoPage.routename: (_) => TwoPage()
      },
    );
  }
}
