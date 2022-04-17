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
    final textTheme = InheritedItemData.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (context) {
          return QuantityAlert(maxStack: 255, itemSlot: itemSlot,);
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
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 3),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).primaryColor,
          boxShadow: [BoxShadow(
            color: Colors.cyan,
            blurRadius: 2.0
          )]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(this.imagePath),
              flex: 3,
            ),
            SizedBox(width: 5),
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
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Wrap(
        children: [
          AlertDialog(
/*            Colors.cyan[900],
            Colors.teal[800],
            Colors.cyan[800]*/
            backgroundColor:  Colors.cyan[900],
            title: Text("Select quantity", style: textTheme.headline4),
            content: Slider(
              divisions: 254,
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
                  child: Text("Confirm", style: textTheme.headline3),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.cyan[800])
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

