import 'package:flutter/material.dart';

Widget horizontalLine(double size) {
  return Row(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0),
        child: Container(
          height: 1.0,
          width: size,
          color: Colors.white,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0),
        child: Container(
          height: 1.0,
          width: size,
          color: Colors.white,
        ),
      )
    ],
  );
}

Widget horizontalColumn() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      horizontalLine(8.0),
      SizedBox(
        height: 2,
      ),
      horizontalLine(5.0),
      SizedBox(
        height: 2,
      ),
      horizontalLine(8.0),
      SizedBox(
        height: 2,
      ),
      horizontalLine(5.0),
      SizedBox(
        height: 2,
      ),
      horizontalLine(8.0),
    ],
  );
}
