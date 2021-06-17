import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 35,
            left: 0,
            child: Icon(
              IconData(0x1F4A7),
              size: 80,
            ),
          ),
          Positioned(
            top: 180,
            left: 0,
            child: Icon(
              IconData(0x1F321),
              size: 80,
            ),
          ),
          Positioned(
            top: 180,
            left: 0,
            child: Icon(
              IconData(0x1F321),
              size: 80,
            ),
          ),
        ],
      ),
    );
  }
}
