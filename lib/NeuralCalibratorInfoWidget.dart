import 'package:flutter/material.dart';
import 'package:nmscompanions/stateWidget.dart';

class NeuralCalibratorInfo extends StatelessWidget {
  final String attribute;
  final bool increasing;
  NeuralCalibratorInfo({@required this.attribute, @required this.increasing});
  @override
  Widget build(BuildContext context) {
    final textTheme = InheritedItemData.of(context).textTheme;
    return Align(
      child: Column(
        children: [
          (increasing) ? Icon(Icons.trending_up_rounded, color: Colors.lightGreen[400]) : Icon(Icons.trending_down_rounded, color: Colors.redAccent,),
          Text(attribute, style: textTheme.subtitle2,)
        ],
      ),
      alignment: Alignment.centerRight,
    );
  }
}
