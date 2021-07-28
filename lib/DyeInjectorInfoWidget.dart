import "package:flutter/material.dart";

class DyeInjectorInfo extends StatelessWidget {
  final String colours;
  DyeInjectorInfo(this.colours);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text("Dye Colours: " + colours, style: textTheme.subtitle2);
  }
}
