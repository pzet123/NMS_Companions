import "package:flutter/material.dart";
import 'package:nmscompanions/EggSequencer.dart';
import 'ItemMenu.dart';
import "stateWidget.dart";
import 'package:web_scraper/web_scraper.dart';
import 'GuideScreen.dart';
import 'SettingsScreen.dart';

void main() async {

  runApp(InheritedItemData(
      child: new MaterialApp(
        routes: {
          "/": (context) {
            double screenHeight = MediaQuery.of(context).size.height;
            InheritedItemData.of(context).textTheme = Theme.of(context).textTheme.apply(
                fontSizeFactor: screenHeight/760
            );
            return EggSequencer();
          },
          "/ItemMenu": (context) => ItemMenu(),
          "/GuideScreen" : (context) => GuideScreen(),
          "/GuideEntry" : (context) => GuideEntryScreen(),
          "/SettingsScreen" : (context) => SettingsScreen(),
          "/Donation": (context) => null
        },
        initialRoute: "/",

        theme: ThemeData(
            primaryColor: Colors.cyan[900],
            accentColor: Color.fromARGB(255, 217, 241, 241),
            textTheme: TextTheme(
                headline1: TextStyle(
                    color: Color.fromARGB(255, 217, 241, 241),
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    letterSpacing: 2.2
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
                headline4: TextStyle(
                    color: Color.fromARGB(255, 217, 241, 241),
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                ),
                subtitle1: TextStyle(
                    color: Color.fromARGB(255, 217, 241, 241),
                    fontSize: 10
                ),
                subtitle2: TextStyle(
                    color: Color.fromARGB(255, 217, 241, 241),
                    fontSize: 16
                )
            )
        ),
      ),
    itemData: new ItemData(),
  ));
}