import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
            GuideEntryListTile(iconData: Icons.color_lens_rounded, title: "Companion Colouring", text: "sda"),
            GuideEntryListTile(iconData: MaterialCommunityIcons.egg, title: "Attaining a Companion Egg", text: "EGE",),

          ],
        ),
      ),
    );
  }
}

class GuideEntryListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String text;
  GuideEntryListTile({this.iconData, this.title, this.text});
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

