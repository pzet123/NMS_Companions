import "package:flutter/material.dart";
import 'package:nmscompanions/stateWidget.dart';

class Item extends StatelessWidget {
  final String itemName;
  final String itemGraphicName;
  final ItemSlot itemSlot;
  final callBack;
  Item(this.itemName, this.itemGraphicName, this.itemSlot, this.callBack);
  @override
  Widget build(BuildContext context) {

    final textTheme = InheritedItemData.of(context).textTheme;
    final double imageScale = 3.5 * (760 / MediaQuery.of(context).size.height);
    return Padding(
        padding: EdgeInsets.all(5),
      child: GestureDetector(
        child: Column(
          children: [
            Text(itemName, style: textTheme.subtitle1),
            Image.asset(itemGraphicName, scale: imageScale,),
          ],
        ),
        onTap: (callBack != null) ? () => openItemMenu(context, itemSlot) : null,
      ),
    );
  }

  void openItemMenu(BuildContext context, ItemSlot itemSlot){
    Navigator.pushNamed(context, "/ItemMenu", arguments: itemSlot).then(
            (_) {
              callBack();
            });
  }
}

enum ItemSlot{
  GROWTH_HORMONE, GENE_SPLITTER, DYE_INJECTOR, NEURAL_CALIBRATOR, COMPANION_EGG
}
