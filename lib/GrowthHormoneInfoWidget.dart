import "package:flutter/material.dart";

class GrowthHormoneInfo extends StatelessWidget {
  final bool increasing;

  GrowthHormoneInfo(this.increasing);

  @override
  Widget build(BuildContext context) {
    return (increasing) ? Icon(Icons.trending_up_rounded, color: Colors.lightGreen)
        : Icon(Icons.trending_down_rounded, color: Colors.redAccent);
  }
}
