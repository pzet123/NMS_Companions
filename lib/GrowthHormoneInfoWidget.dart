import "package:flutter/material.dart";

class GrowthHormoneInfo extends StatelessWidget {
  final bool increasing;

  GrowthHormoneInfo({@required this.increasing});

  @override
  Widget build(BuildContext context) {
    return Align(
        child: (increasing) ? Icon(Icons.trending_up_rounded, color: Colors.lightGreen[400])
        : Icon(Icons.trending_down_rounded, color: Colors.redAccent),
      alignment: Alignment.centerRight,
    );
  }
}
