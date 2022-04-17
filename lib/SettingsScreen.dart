import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'BackgroundDecoration.dart';


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: textTheme.headline1,),
        centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: BackgroundDecoration,
        child: ListView(
          children: [
           RateAppButton(),
           CreditsButton(),
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
    rateMyApp.init();
    return SettingsButton(() => rateMyApp.showRateDialog(
      context,
      title: "Rate NMSC",
      rateButton: "RATE",
      laterButton: "MAYBE LATER",
      noButton: "NO",
      message: "If you like this app, please take some time to review it. It helps other players to discover the app.",
      dialogStyle: DialogStyle(
        messageStyle: TextStyle(color: Colors.black, fontSize: 14.0),
      )
    ), "Rate App", Icons.rate_review_rounded);
  }
}

class CreditsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return SettingsButton(() => Navigator.pushNamed(context, "/CreditsScreen"), "Credits", Icons.short_text_rounded);
  }
}

class SettingsButton extends StatelessWidget {

  final Function buttonOnTap;
  final String buttonText;
  final IconData buttonIcon;

  SettingsButton(this.buttonOnTap, this.buttonText, this.buttonIcon);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => buttonOnTap.call(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.cyan[800],
          boxShadow: [BoxShadow(
              color: Colors.cyan[300],
              blurRadius: 2.0
          )]
        ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(
            children: [
              Icon(buttonIcon, size: 42, color: Colors.white70,),
              SizedBox(width: 25,),
              Text(buttonText, style: textTheme.headline3,),
            ],
          )
      ),
    );
  }

}

