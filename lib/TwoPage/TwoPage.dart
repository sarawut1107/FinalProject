import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_icons/weather_icons.dart';

class TwoPage extends StatefulWidget {
  static const String routename = "twopage";
  Map<String, dynamic> data;

  TwoPage({this.data});
  @override
  _TwoPageState createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  Map<String, dynamic> data;
  DatabaseReference refBoxs;
  @override
  void initState() {
    super.initState();
    data = widget.data;
    refBoxs = FirebaseDatabase.instance
        .reference()
        .child("boxs")
        .child(data['id'].toString());
  }

  TextStyle contentBulletStyle = GoogleFonts.prompt(
    fontSize: 17,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    var colors;
    return Scaffold(
      appBar: AppBar(
        title: Text("รายงานสภาพ"),
      ),
      body: StreamBuilder<Event>(
          stream: refBoxs.onValue,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox();
            }
            var _data = snapshot.data.snapshot.value;
            print(snapshot.data.snapshot.value);
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
                      "อาหาร = ${_data["food"]} ",
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
                      "น้ำ = ${_data["water"]}",
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
                      "ความชื้นอากาศ = ${_data["moisture"]} ",
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
                      "อุณหภูมิ = ${_data["temperature"]} องศา",
                      style: contentBulletStyle,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 70,
                    child: Icon(
                      IconData(0x1F39A),
                      size: 80,
                    ),
                  ),
                  Positioned(
                    top: 145,
                    right: 0,
                    child: Text(
                      "ความชื้นอากาศ = ${_data["moisture"]} ",
                      style: contentBulletStyle,
                    ),
                  ),
                  // แสดงค่าตัวเลข

                  //แสดงวันที่เลี้ยง
                  // Positioned(
                  //   top: 700,
                  //   right: 35,
                  //   child: Text(
                  //     "วันที่.....",
                  //     style: contentBulletStyle,
                  //   ),
                  // ),
                ],
              ),
            );
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => LoginScreen()));
      // }),
    );
  }
}
