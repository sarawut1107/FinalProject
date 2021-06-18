import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/TwoPage/TwoPage.dart';
import 'package:google_fonts/google_fonts.dart';

class OnePage extends StatefulWidget {
  static const String routename = "onepage";
  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  @override
  Widget build(BuildContext context) {
    TextStyle bulletStyle = GoogleFonts.baiJamjuree(
      fontSize: 20,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("สถานะการเลี้ยง"),
      ),
      body: Background(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 8 / 8,
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TwoPage()));
                },
                child: Center(
                  child: Text(
                    "กล่องที่1",
                    style: bulletStyle,
                  ),
                ),
              ),
              color: Colors.amber[200],
            ),
          ],
        ),
      ),
    );
  }
}
