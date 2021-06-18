import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Background extends StatelessWidget {
  // TextStyle kkfont = GoogleFonts.baiJamjuree(fontSize:20 );
  TextStyle contentBulletStyle = GoogleFonts.prompt(
    fontSize: 20,
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var colors;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 40,
            left: 20,
            child: Icon(
              IconData(0x1F35A),
              size: 80,
            ),
          ),
          Positioned(
            top: 145,
            left: 40,
            child: Text(
              "อาหาร",
              style: contentBulletStyle,
            ),
          ),
          Positioned(
            top: 200,
            left: 20,
            child: Icon(
              IconData(0x1F4A7),
              size: 80,
            ),
          ),
          Positioned(
            top: 300,
            left: 60,
            child: Text(
              "น้ำ",
              style: contentBulletStyle,
            ),
          ),
          Positioned(
            top: 350,
            left: 20,
            child: Icon(
              IconData(0x1F321),
              size: 80,
            ),
          ),
          Positioned(
            top: 450,
            left: 35,
            child: Text(
              "อุณหภูมิ",
              style: contentBulletStyle,
            ),
          ),
          Positioned(
            top: 520,
            left: 20,
            child: Icon(
              IconData(0x1F39A),
              size: 80,
            ),
          ),
          Positioned(
            top: 620,
            left: 15,
            child: Text(
              "ความชื้นอากาศ",
              style: contentBulletStyle,
            ),
          ),
          // แสดงค่าตัวเลข

          //Logout
          Positioned(
              top: 690,
              left: 25,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.redAccent, // foreground
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  'Log Out ',
                  style: contentBulletStyle,
                ),
              )),
          //แสดงวันที่เลี้ยง
          Positioned(
            top: 700,
            right: 35,
            child: Text(
              "วันที่.....",
              style: contentBulletStyle,
            ),
          ),
        ],
      ),
    );
  }
}
