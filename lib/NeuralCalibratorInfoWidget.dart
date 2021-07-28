import 'package:flutter/material.dart';

class NeuralCalibratorInfo extends StatelessWidget {
  final String attribute;
  final bool increasing;
  NeuralCalibratorInfo({@required this.attribute, @required this.increasing});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        (increasing) ? Icon(Icons.trending_up_rounded, color: Colors.lightGreen[400]) : Icon(Icons.trending_down_rounded, color: Colors.redAccent,),
        Text(attribute, style: textTheme.subtitle2,)
      ],
    );
  }
}
