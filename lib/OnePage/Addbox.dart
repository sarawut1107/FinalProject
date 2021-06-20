import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Addbox extends StatefulWidget {
  @override
  _AddboxState createState() => _AddboxState();
}

class _AddboxState extends State<Addbox> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final keybox = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เพิ่มกล่อง"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: keybox,
            decoration: InputDecoration(labelText: "รหัสกล่อง"),
          ),
          MaterialButton(
            minWidth: 200.0,
            height: 35,
            color: Color(0xFF801E48),
            child: new Text(
              'เพิ่มกล่อง',
              style: new TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            onPressed: addboxs,
          ),
        ],
      ),
    );
  }

  void addboxs() async {
    try {
      firestore.collection("esp").doc(keybox.text).get().then((value) {
        if (value.data() != null) {
          if (value.data()["connection"]) {
            print("ถูกเชื่อมต่อแล้ว");
          } else {
            print("ยังไม่ถูกเชื่อมต่อ");
            firestore.collection("boxs").doc(keybox.text).set({
              "temperature": 0,
              "moisture": 0,
              "water": 0,
              "food": 0,
              "userID": auth.currentUser?.uid
            }).then((value) => print("ok"));
            firestore.collection("esp").doc(keybox.text).set({
              "connection":true
            }).then((value) => print("ok"));
          }
        } else {
          print("ไม่พบเซ็นเซอร์");
        }
      }).catchError((e) {
        print(e);
      });
    } catch (e) {
      print(e);
    }
  }
}
