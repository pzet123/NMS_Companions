import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'package:nmscompanions/DyeInjectorInfoWidget.dart';
import 'package:nmscompanions/GrowthHormoneInfoWidget.dart';
import 'package:nmscompanions/ItemListTile.dart';
import 'package:nmscompanions/NeuralCalibratorInfoWidget.dart';
import 'Item.dart';
import 'stateWidget.dart';


class ItemMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final ItemSlot itemSlot = ModalRoute.of(context).settings.arguments;
    final ItemData itemData = InheritedItemData.of(context).itemData;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Menu", style: textTheme.headline2),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.teal[900],
        child: ListView(
          children: getItemWidgets(itemSlot, itemData),
        ),
      ),
    );
  }

  List<Widget> getGrowthItemWidgets(ItemData itemData){
    List<Widget> growthItemWidgets = [];
    for(Map<String, dynamic> itemEntry in itemData.getGrowthTable()){
      growthItemWidgets.add(
        ItemListTile(
          child: GrowthHormoneInfo(increasing: itemEntry["increasing"],),
          itemName: itemEntry["name"],
          dose: itemEntry["dose"],
          itemSlot: ItemSlot.GROWTH_HORMONE,
          itemEffect: (itemEntry["increasing"]) ? ItemStatus.INCREASING : ItemStatus.DECREASING,
          imagePath: itemEntry["imagePath"],
        ),
      );
    }
    return growthItemWidgets;
  }

  List<Widget> getGeneticItemWidgets(ItemData itemData){
    List<Widget> geneticItemWidgets = [];
    for(Map<String, dynamic> itemEntry in itemData.getGeneTable()) {
      geneticItemWidgets.add(
          ItemListTile(
            child: Align(child: Icon(Icons.multitrack_audio_rounded,
                color: Colors.blue[300]), alignment: Alignment.centerRight,),
            itemName: itemEntry["name"],
            dose: itemEntry["dose"],
            itemSlot: ItemSlot.GENE_SPLITTER,
            itemEffect: ItemStatus.UNSTABLE,
            imagePath: itemEntry["imagePath"],)
      );
    }
    return geneticItemWidgets;
  }

  List<Widget> getDyeItemWidgets(ItemData itemData){
    List<Widget> dyeItemWidgets = [];
    for(Map<String, dynamic> itemEntry in itemData.getDyeTable()){
      dyeItemWidgets.add(
          ItemListTile(
            child: DyeInjectorInfo(itemEntry["colour"]),
            itemName: itemEntry["name"],
            dose: itemEntry["dose"],
            itemSlot: ItemSlot.DYE_INJECTOR,
            itemEffect: ItemStatus.UNSTABLE,
            colour: itemEntry["colour"],
            imagePath: itemEntry["imagePath"],)
      );
    }
    return dyeItemWidgets;
  }

  List<Widget> getNeuralItemWidgets(ItemData itemData){
    List<Widget> neuralItemWidgets = [];
    for(Map<String, dynamic> itemEntry in itemData.getNeuralTable()){
      neuralItemWidgets.add(
          ItemListTile(
            child: NeuralCalibratorInfo(attribute: itemEntry["neuralAttribute"], increasing: true,),
            itemName: itemEntry["name"],
            dose: itemEntry["dose"],
            itemSlot: ItemSlot.NEURAL_CALIBRATOR,
            itemEffect: ItemStatus.INCREASING,
            neuralAttribute: itemEntry["neuralAttribute"],
            imagePath: itemEntry["imagePath"],)
      );
    }
    return neuralItemWidgets;
  }

  List<Widget> getItemWidgets(ItemSlot itemSlot, ItemData itemData){
    List<Widget> itemWidgets = [];
    switch(itemSlot) {
      case ItemSlot.GROWTH_HORMONE : {
          itemWidgets = getGrowthItemWidgets(itemData);
        }
        break;
      case ItemSlot.GENE_SPLITTER : {
          itemWidgets = getGeneticItemWidgets(itemData);
        }
        break;
      case ItemSlot.DYE_INJECTOR : {
        itemWidgets = getDyeItemWidgets(itemData);
      }
      break;
      case ItemSlot.NEURAL_CALIBRATOR : {
        itemWidgets = getNeuralItemWidgets(itemData);
      }
  }

    return itemWidgets;
  }

}
