import 'package:flutter/material.dart';

class ItemListTile extends StatelessWidget {
  final Widget child;
  final String itemName;
  final int dose;

  ItemListTile({@required this.child, @required this.itemName, @required this.dose});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      title: Text(itemName, style: textTheme.headline3,),
      subtitle: Text("Dose: $dose%", style: textTheme.subtitle2,),
      leading: Image.asset("assets/sampleItem.png"),
      trailing: child
    );
  }
}
