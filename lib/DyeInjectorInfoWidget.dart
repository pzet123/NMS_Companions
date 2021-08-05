import "package:flutter/material.dart";
import 'stateWidget.dart';

class DyeInjectorInfo extends StatelessWidget {
  final String colours;
  DyeInjectorInfo(this.colours);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(colours, style: textTheme.subtitle2);
  }
}
