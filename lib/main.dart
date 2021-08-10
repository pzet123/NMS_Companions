import "package:flutter/material.dart";
import 'package:nmscompanions/EggSequencer.dart';
import 'ItemMenu.dart';
import "stateWidget.dart";
import 'package:web_scraper/web_scraper.dart';
import 'GuideScreen.dart';

void main() async {

  WebScraper webScraper = WebScraper("https://nomanssky.fandom.com");
  await webScraper.loadWebPage("/wiki/Egg_Sequencer");
  List<Map<String, dynamic>> tableEntries = webScraper.getElement("div.main-container > div.resizable-container >"
      " div.page.has-right-rail > main.page__main > div#content.page-content > "
      "div#mw-content-text.mw-content-ltr > div.mw-parser-output > table.wikitable > tbody > tr", []);


  runApp(InheritedItemData(
      child: new MaterialApp(
        routes: {
          "/": (context) => EggSequencer(),
          "/ItemMenu": (context) => ItemMenu(),
          "/GuideScreen" : (context) => GuideScreen(),
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
                ),
                subtitle2: TextStyle(
                    color: Color.fromARGB(255, 217, 241, 241),
                    fontSize: 16
                )
            )
        ),
      ),
    itemData: new ItemData(tableEntries),
  ));
}