import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/OnePage/OnePage.dart';
import 'package:flutter_auth/Screens/Login/components/body.dart';

class LoginScreen extends StatelessWidget {
  static const String routename = "login";
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // //
    // if (auth.currentUser != null) {
    //   Navigator.push(context,
    //                   MaterialPageRoute(builder: (context) => OnePage()));
    // }
    return Scaffold(
      body: Body(),
    );
  }
}
