import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/OnePage/Addbox.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/TwoPage/TwoPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';

class OnePage extends StatefulWidget {
  static const String routename = "onepage";
  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  var recentJobsRef = FirebaseDatabase.instance
      .reference()
      .child('recent')
      .orderByChild('created_at')
      .limitToFirst(10);
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    TextStyle bulletStyle = GoogleFonts.baiJamjuree(
      fontSize: 20,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text("สถานะการเลี้ยง"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber[800],
                ),
                child: Text('Log Out'),
              ),
              ListTile(
                title: Text('Log Out'),
                onTap: () {
                  auth.signOut().then(
                        (value) =>
                            Navigator.pushNamed(context, LoginScreen.routename),
                      );
                },
              ),
            ],
          ),
        ),
       
        body: Background(
            child: StreamBuilder<QuerySnapshot>(
          stream: firestore
              .collection('boxs')
              .where("uid", isEqualTo: auth.currentUser.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox();}
              // ignore: dead_code
              final data = snapshot.data?.docs
                  ?.map((e) => e.data() as Map<String, dynamic>)
                  ?.toList();
                  

              return GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 8 / 8,
                children: <Widget>[
                  for (var i = 0; i < data.length; i++)
                   Container(
                    padding: new EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => TwoPage(data: data[i],)));
                      },
                      child: Center(
                        child: Text(
                          "กล่องที่ ${i+1}",
                          style: bulletStyle,
                        ),
                      ),
                    ),
                    color: Colors.amber[200],
                  ),
                  new Container(
                    padding: new EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Addbox()));
                      },
                      child: Center(
                        child: Text(
                          "เพิ่มกล่อง",
                          style: bulletStyle,
                        ),
                      ),
                    ),
                    color: Colors.amber[200],
                  ),
                ],
              );

          },
        )
        ),
        );
  }
}
