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
  final quantity;

  ItemListTile({@required this.child, @required this.itemName, @required this.dose, @required this.itemSlot, @required this.itemEffect, @required this.imagePath, @required this.quantity, this.neuralAttribute, this.colour});

  @override
  Widget build(BuildContext context) {
    final itemStatus = InheritedItemData.of(context).status;
    final textTheme = InheritedItemData.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (context) {
          return QuantityAlert(maxStack: 100, itemSlot: itemSlot,);
        }).then((value) {
          if(value == true) {
            itemStatus.setAttrStatus(itemSlot, itemEffect);
            itemStatus.setAttrDose(itemSlot, dose.replaceAll("%", ""));
            itemStatus.setItemName(itemSlot, itemName);
            if (itemSlot == ItemSlot.DYE_INJECTOR) {
              itemStatus.setCompanionColour(colour);
            }
            if (itemSlot == ItemSlot.NEURAL_CALIBRATOR) {
              itemStatus.setNeuralAttribute(neuralAttribute);
            }
            itemStatus.setItemImage(itemSlot, this.imagePath);
            Navigator.pop(context);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
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
      ),
    );
  }
}

class QuantityAlert extends StatefulWidget {
  final int maxStack;
  final ItemSlot itemSlot;

  QuantityAlert({this.maxStack, this.itemSlot});

  @override
  _QuantityAlertState createState() => _QuantityAlertState();
}

class _QuantityAlertState extends State<QuantityAlert> {
  double sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    final itemStatus = InheritedItemData.of(context).status;
    return Center(
      child: Wrap(
        children: [
          AlertDialog(
            title: Text("Select quantity"),
            content: Slider(
              value: sliderVal,
              label: "$sliderVal",
              activeColor: Colors.tealAccent,
              inactiveColor: Colors.teal,
              min: 1,
              max: widget.maxStack.toDouble(),
              onChanged: (newVal) {
                setState(() {
                  sliderVal = newVal;
                });
              },
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    itemStatus.setItemQuantity(widget.itemSlot, sliderVal.toInt());
                    Navigator.pop(context, true);
                  },
                  child: Text("Confirm"))
            ],
          ),
        ],
      ),
    );
  }
}

