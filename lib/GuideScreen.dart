import 'package:flutter/material.dart';

class GuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guide"),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [Colors.cyan[900], Colors.teal[800], Colors.cyan[800]]
            )
        ),
        child: Column(
          children: [
            GuideEntry(iconData: Icons.color_lens_rounded, title: "Companion Colouring", text: "sda"),

          ],
        ),
      ),
    );
  }
}

class GuideEntry extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String text;
  GuideEntry({this.iconData, this.title, this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        SizedBox(width: 25,),
        Text(title),
      ],
    );
  }
}

