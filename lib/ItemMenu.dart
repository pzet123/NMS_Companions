import 'package:flutter/material.dart';
import 'package:nmscompanions/DyeInjectorInfoWidget.dart';
import 'package:nmscompanions/GrowthHormoneInfoWidget.dart';
import 'package:nmscompanions/ItemListTile.dart';
import 'package:nmscompanions/NeuralCalibratorInfoWidget.dart';
import 'Item.dart';
import 'stateWidget.dart';


class ItemMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ItemSlot itemSlot = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Menu"),
      ),
      body: Container(
        color: Colors.teal[900],
        child: ListView(
          children: getItemWidgets(itemSlot),
        ),
      ),
    );
  }

  List<Widget> getItemWidgets(ItemSlot itemSlot){
    List<Widget> itemWigets = [];
    switch(itemSlot) {
      case ItemSlot.GROWTH_HORMONE : {
          for (int x = 0; x < 10; x++) {
            itemWigets.add(
                ItemListTile(
                    child: GrowthHormoneInfo(increasing: true),
                    itemName: "Test",
                    dose: 20,
                    itemSlot: ItemSlot.GROWTH_HORMONE,
                    itemEffect: ItemStatus.INCREASING,)
            );
          }
          for (int x = 0; x < 10; x++) {
            itemWigets.add(
                ItemListTile(
                    child: GrowthHormoneInfo(increasing: false),
                    itemName: "Test",
                    dose: 20,
                    itemSlot: ItemSlot.GROWTH_HORMONE,
                    itemEffect: ItemStatus.DECREASING,)
            );
          }
        }
        break;
      case ItemSlot.GENE_SPLITTER : {
          for (int x = 0; x < 10; x++) {
            itemWigets.add(
              ItemListTile(
                  child: Icon(Icons.multitrack_audio_rounded,
                  color: Colors.blue[300]),
                  itemName: "Test",
                  dose: 20,
                  itemSlot: ItemSlot.GENE_SPLITTER,
                  itemEffect: ItemStatus.DECREASING)
            );
          }
        }
        break;
      case ItemSlot.DYE_INJECTOR : {
        for (int x = 0; x < 10; x++){
          itemWigets.add(
            ItemListTile(
                child: DyeInjectorInfo("White, Red/White"),
                itemName: "Test",
                dose: 0,
                itemSlot: ItemSlot.DYE_INJECTOR,
                itemEffect: ItemStatus.DECREASING)
          );
        }
      }
      break;
      case ItemSlot.NEURAL_CALIBRATOR : {
        for (int x = 0; x < 10; x++){
          itemWigets.add(
            ItemListTile(
                child: NeuralCalibratorInfo(attribute: "Aggression", increasing: false,),
                itemName: "Test",
                dose: 0,
                itemSlot: ItemSlot.NEURAL_CALIBRATOR,
                itemEffect: ItemStatus.DECREASING,
                neuralAttribute: "Aggression",)
          );
          itemWigets.add(
            ItemListTile(
                child: NeuralCalibratorInfo(attribute: "Helpfulness", increasing: true),
                itemName: "Test",
                dose: 0,
                itemSlot: ItemSlot.NEURAL_CALIBRATOR,
                itemEffect: ItemStatus.INCREASING,
                neuralAttribute: "Helpfulness",
            )
          );
        }
      }
  }

    return itemWigets;
  }

  Widget getItemWidget(Item item){
    return null;
  }



}
