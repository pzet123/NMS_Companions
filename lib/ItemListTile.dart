import 'package:flutter/material.dart';
import 'stateWidget.dart';
import 'package:nmscompanions/Item.dart';


class ItemListTile extends StatelessWidget {
  final Widget child;
  final String itemName;
  final String dose;
  final ItemStatus itemEffect;
  final ItemSlot itemSlot;
  final String neuralAttribute;

  ItemListTile({@required this.child, @required this.itemName, @required this.dose, @required this.itemSlot, @required this.itemEffect, this.neuralAttribute});

  @override
  Widget build(BuildContext context) {
    final itemStatus = InheritedItemData.of(context).status;
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      child: ListTile(
        title: Text(itemName, style: textTheme.headline3,),
        subtitle: Text("Dose: $dose", style: textTheme.subtitle2,),
        leading: Image.asset("assets/sampleItem.png"),
        trailing: child
      ),
      onTap: () {
        itemStatus.setAttrStatus(itemSlot, itemEffect);
        itemStatus.setAttrDose(itemSlot, dose);
        itemStatus.setItemName(itemSlot, itemName);
        if(itemSlot == ItemSlot.NEURAL_CALIBRATOR){
          itemStatus.setNeuralAttribute(neuralAttribute);
        }
        Navigator.pop(context);
      },
    );
  }
}
