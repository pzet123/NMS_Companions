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
    final ItemData itemData = InheritedItemData.of(context).itemData;
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Menu"),
      ),
      body: Container(
        color: Colors.teal[900],
        child: ListView(
          children: getItemWidgets(itemSlot, itemData),
        ),
      ),
    );
  }

  List<Widget> getItemWidgets(ItemSlot itemSlot, ItemData itemData){
    List<Widget> itemWidgets = [];
    switch(itemSlot) {
      case ItemSlot.GROWTH_HORMONE : {
          for(Map<String, dynamic> itemEntry in itemData.getGrowthTable()){
            itemWidgets.add(
              ItemListTile(
                  child: GrowthHormoneInfo(increasing: itemEntry["increasing"],),
                  itemName: itemEntry["name"],
                  dose: itemEntry["dose"],
                  itemSlot: itemSlot,
                  itemEffect: (itemEntry["increasing"]) ? ItemStatus.INCREASING : ItemStatus.DECREASING)
            );
          }
        }
        break;
      case ItemSlot.GENE_SPLITTER : {
          for (Map<String, dynamic> itemEntry in itemData.getGeneTable()) {
            itemWidgets.add(
              ItemListTile(
                  child: Icon(Icons.multitrack_audio_rounded,
                  color: Colors.blue[300]),
                  itemName: itemEntry["name"],
                  dose: itemEntry["dose"],
                  itemSlot: ItemSlot.GENE_SPLITTER,
                  itemEffect: ItemStatus.UNSTABLE)
            );
          }
        }
        break;
      case ItemSlot.DYE_INJECTOR : {
        for (int x = 0; x < 10; x++){
          itemWidgets.add(
            ItemListTile(
                child: DyeInjectorInfo("White, Red/White"),
                itemName: "Test",
                dose: "0",
                itemSlot: ItemSlot.DYE_INJECTOR,
                itemEffect: ItemStatus.DECREASING)
          );
        }
      }
      break;
      case ItemSlot.NEURAL_CALIBRATOR : {
        for (int x = 0; x < 10; x++){
          itemWidgets.add(
            ItemListTile(
                child: NeuralCalibratorInfo(attribute: "Aggression", increasing: false,),
                itemName: "Test",
                dose: "0",
                itemSlot: ItemSlot.NEURAL_CALIBRATOR,
                itemEffect: ItemStatus.DECREASING,
                neuralAttribute: "Aggression",)
          );
          itemWidgets.add(
            ItemListTile(
                child: NeuralCalibratorInfo(attribute: "Helpfulness", increasing: true),
                itemName: "Test",
                dose: "0",
                itemSlot: ItemSlot.NEURAL_CALIBRATOR,
                itemEffect: ItemStatus.INCREASING,
                neuralAttribute: "Helpfulness",
            )
          );
        }
      }
  }

    return itemWidgets;
  }

  Widget getItemWidget(Item item){
    return null;
  }



}
