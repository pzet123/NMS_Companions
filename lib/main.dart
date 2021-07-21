import "package:flutter/material.dart";
import 'package:nmscompanions/EggSequencer.dart';
import 'ItemMenu.dart';

void main() => runApp(new MaterialApp(
  routes: {
    "/" : (context) => EggSequencer(),
    "/ItemMenu" : (context) => ItemMenu(),
    "/Donation" : (context) => null
  },
  initialRoute: "/",

  theme: ThemeData(
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Color.fromARGB(255, 217, 241, 241),
        fontWeight: FontWeight.bold,
        fontSize: 24,
        letterSpacing: 1.5
      ),
      headline2: TextStyle(
        color: Color.fromARGB(255, 217, 241, 241),
        fontWeight: FontWeight.bold,
        fontSize: 26,
        letterSpacing: 2
      ),
      headline3: TextStyle(
        color: Color.fromARGB(255, 217, 241, 241),
        fontWeight: FontWeight.bold,
        fontSize: 18
      ),
      subtitle1: TextStyle(
        color: Color.fromARGB(255, 217, 241, 241),
        fontSize: 11
      )
    )
  ),
));