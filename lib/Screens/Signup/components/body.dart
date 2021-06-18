import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/Screens/Signup/profile.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  final formKry = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    //firebase ตรวจสอบError
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          //ไม่มีข้อผิดพลาดเกิดข้นแอปแสดงขึ้นได้
          if (snapshot.connectionState == ConnectionState.done) {
            Size size = MediaQuery.of(context).size;
            return Background(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "SIGNUP",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Image.asset(
                      "assets/icons/login.png",
                      height: size.height * 0.35,
                    ),
                    RoundedInputField(
                      hintText: "Your Email",
                      onChanged: (String email) {
                        profile.email = email;
                      },
                    ),
                    RoundedPasswordField(
                      onChanged: (String password) {
                        profile.password = password;
                      },
                    ),
                    RoundedButton(
                      text: "SIGNUP",
                      press: () {},
                    ),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          //Reload
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
    //
  }
}
