import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/TwoPage/background.dart';

class TwoPage extends StatefulWidget {
  static const String routename = "twopage";
  @override
  _TwoPageState createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายงานสภาพ"),
      ),
      body: Background(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => LoginScreen()));
      // }),
    );
  }
}
