import 'package:flutter/material.dart';
import 'package:nmscompanions/BackgroundDecoration.dart';


class CreditsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Credits", style: textTheme.headline1,),
        centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: BackgroundDecoration,
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Thanks to: ", style: Theme.of(context).textTheme.headline3,),
            SizedBox(height: 5),
            Text("u/Growmaze for providing a dataset of most of the items in the game and their effects on companion colouring", style: Theme.of(context).textTheme.subtitle2,)
          ],

        ),
      ),
    );
  }
}
