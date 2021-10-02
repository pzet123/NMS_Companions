import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'BackgroundDecoration.dart';


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        decoration: BackgroundDecoration,
        child: ListView(
          children: [
           RateAppButton(),
          ],
        ),
      ),
    );
  }
}

class RateAppButton extends StatelessWidget {
  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: "rateMyApp_",
    minDays: 0,
    minLaunches: 0,
    googlePlayIdentifier: "com.pzet.nmscompanions",
  );

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    rateMyApp.init();
    return GestureDetector(
      onTap: () => rateMyApp.showRateDialog(
          context,
        message: "",
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        color: Colors.cyan[800],
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(
          children: [
            Icon(Icons.rate_review, size: 42, color: Colors.white70,),
            SizedBox(width: 25,),
            Text("Rate App", style: textTheme.headline3,),
          ],
        )
      ),
    );
  }
}

