import "package:flutter/material.dart";

class Item extends StatelessWidget {
  final String itemName;
  final String itemGraphicName;
  final ItemSlot itemSlot;
  Item(this.itemName, this.itemGraphicName, this.itemSlot);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
        padding: EdgeInsets.all(5),
      child: GestureDetector(
        child: Column(
          children: [
            Text(itemName, style: textTheme.headline3),
            Image.asset(itemGraphicName, scale: 3.5,),
          ],
        ),
        onTap: () => openItemMenu(context, itemSlot),
      ),
    );
  }

  void openItemMenu(BuildContext context, ItemSlot itemSlot){
    Navigator.pushNamed(context, "/ItemMenu", arguments: itemSlot);
  }
}

enum ItemSlot{
  GROWTH_HORMONE, GENE_SPLITTER, DYE_INJECTOR, NEURAL_CALIBRATOR, COMPANION_EGG
}
