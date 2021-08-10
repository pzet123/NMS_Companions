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
  final String colour;
  final String imagePath;

  ItemListTile({@required this.child, @required this.itemName, @required this.dose, @required this.itemSlot, @required this.itemEffect, @required this.imagePath, this.neuralAttribute, this.colour});

  @override
  Widget build(BuildContext context) {
    final itemStatus = InheritedItemData.of(context).status;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(this.imagePath),
              flex: 3,
            ),
            SizedBox(width: 5,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(itemName, style: textTheme.headline3,),
                  Text("Dose: $dose", style: textTheme.subtitle2,),
                ],
              ),
              flex: 5,
            ),
            Flexible(
                child: child,
            flex: 7,)
          ],
        ),
        onTap: () {
          itemStatus.setAttrStatus(itemSlot, itemEffect);
          itemStatus.setAttrDose(itemSlot, dose);
          itemStatus.setItemName(itemSlot, itemName);
          if(itemSlot == ItemSlot.DYE_INJECTOR){
            itemStatus.setCompanionColour(colour);
          }
          if(itemSlot == ItemSlot.NEURAL_CALIBRATOR){
            itemStatus.setNeuralAttribute(neuralAttribute);
          }
          itemStatus.setItemImage(itemSlot, this.imagePath);
          Navigator.pop(context);
        },
      ),
    );
  }
}

// ListTile(
// title: Text(itemName, style: textTheme.headline3,),
// subtitle: Text("Dose: $dose", style: textTheme.subtitle2,),
// leading: Image.asset("assets/sampleItem.png"),
// trailing: child
// ),