import 'package:flutter/material.dart';

Widget normalText(String text) {
  return Text(
    style: TextStyle(
      color: Colors.white.withOpacity(0.7),
      fontSize: 18,
    ),
    text,
  );
}

Widget infoText(String text) {
  return Text(
    style: const TextStyle(
      color: Colors.white,
      fontSize: 22,
    ),
    text,
  );
}

const hBox = SizedBox(
  height: 35,
);
Widget box(double size) {
  return SizedBox(
    height: size,
  );
}
