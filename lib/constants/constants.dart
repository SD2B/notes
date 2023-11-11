import 'package:flutter/material.dart';

final enabledBoarder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(28),
  borderSide: BorderSide(color: Colors.white),
);
final focusedBoarder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(28),
  borderSide: BorderSide(color: maincolor, width: 3),
);
final errorBoarder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(28),
  borderSide: BorderSide(color: maincolor, width: 3),
);
final focusedErrorBoarder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(28),
  borderSide: BorderSide(color: maincolor, width: 3),
);
final labelStyle = TextStyle(
  color: Colors.white
);
final Color cursorColor= maincolor;

final Color maincolor=Color.fromRGBO(255, 238, 88, 100);
