import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';

class OnePage extends StatefulWidget {
  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  // int _counter = 1;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
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
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text("He'd have you all unravel at the"),
              color: Colors.teal[100],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Heed not the rabble'),
              color: Colors.teal[200],
            ),
          ],
        ),
      ),
    );
  }
}
