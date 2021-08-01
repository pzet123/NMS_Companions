import "package:flutter/material.dart";

class Item extends StatelessWidget {
  final String itemName;
  final String itemGraphicName;
  final ItemSlot itemSlot;
  final callBack;
  Item(this.itemName, this.itemGraphicName, this.itemSlot, this.callBack);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
        padding: EdgeInsets.all(5),
      child: GestureDetector(
        child: Column(
          children: [
            Text(itemName, style: textTheme.subtitle1),
            Image.asset(itemGraphicName, scale: 3.5,),
          ],
        ),
        onTap: () => openItemMenu(context, itemSlot),
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
