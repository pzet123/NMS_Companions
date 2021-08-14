import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:nmscompanions/Item.dart';



class InheritedItemData extends InheritedWidget {
  final Status status;
  final ItemData itemData;
  final Widget child;
  TextTheme textTheme;

  InheritedItemData({@required this.child, @required this.itemData}) : status = new Status(), super(child : child);

  @override
  Widget build(BuildContext context) {
    return child;
  }


  @override
  bool updateShouldNotify(InheritedItemData oldWidget) {
      if(oldWidget.status != status){
        return true;
      }
      return false;
  }

  static InheritedItemData of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType(aspect: InheritedItemData);
  }
}


class Status {
  final Map attributeStatus;
  Map<ItemSlot, String> _itemImagePaths;

  Status() : attributeStatus = {ItemSlot.GROWTH_HORMONE: [ItemStatus.DECREASING, "0", ""],
    ItemSlot.GENE_SPLITTER: [ItemStatus.UNSTABLE, "0", ""],
    ItemSlot.DYE_INJECTOR: [ItemStatus.UNSTABLE, "0", "", "None"],
    ItemSlot.NEURAL_CALIBRATOR: [ItemStatus.INCREASING, "0", "", "Aggression"]} {
  _itemImagePaths = {
  ItemSlot.GROWTH_HORMONE :"assets/sampleItem.png",
  ItemSlot.GENE_SPLITTER : "assets/sampleItem.png",
  ItemSlot.DYE_INJECTOR : "assets/sampleItem.png",
  ItemSlot.NEURAL_CALIBRATOR : "assets/sampleItem.png"
  };
}


  void setAttrStatus(ItemSlot itemSlot, ItemStatus itemStatus){
    attributeStatus[itemSlot][0] = itemStatus;
  }

  void setAttrDose(ItemSlot itemSlot, String dose){
    attributeStatus[itemSlot][1] = dose;
  }

  void setItemName(ItemSlot itemSlot, String name){
    attributeStatus[itemSlot][2] = name;
  }

  void setNeuralAttribute(String attribute){
    attributeStatus[ItemSlot.NEURAL_CALIBRATOR][3] = attribute;
  }

  void setCompanionColour(String colour){
    attributeStatus[ItemSlot.DYE_INJECTOR][3] = colour;
  }

  void setItemImage(ItemSlot itemSlot, String newImagePath){
    _itemImagePaths[itemSlot] = newImagePath;
  }

  String getItemImagePath(ItemSlot itemSlot){
    return _itemImagePaths[itemSlot];
  }


}

class ItemData{
  List _growthTableEntries;
  List _geneticTableEntries;
  List _dyeTableEntries;
  List _neuralTableEntries;
  List<String> _growthTableItemNames;
  List<String> _geneTableItemNames;
  List<String> _dyeTableItemNames;
  List<String> _neuralTableItemNames;


  ItemData() {
    _growthTableItemNames = ["Apple Cake of Lost Souls", "Apple Curiosity", "Legs-in-Pastry", "Abyssal Stew", "Acid", "Activated Cadmium", "Activated Copper", "Activated Emeril", "Activated Indium", "Albumen Pearl", "Aloe Flesh", "Ammonia", "Angelic Fruitcake", "Anomalous Doughnut", "Anomalous Jam", "Aronium", "Cadmium", "Caramel-Encrusted Cake", "Carbon", "Chlorine", "Chromatic Metal", "Cobalt", "Condensed Carbon", "Copper", "Crystal Sulphide", "Cyto-Phosphate", "Di-hydrogen", "Emeril", "Ferrite Dust", "Fungal Mould", "Fusion Accelerant", "Geode", "Gold", "Hexite", "Indium", "Ionised Cobalt", "Larval Core", "Living Pearl", "Magnetised Ferrite", "Oxygen", "Pugneum", "Pure Ferrite", "Salt", "Sodium", "Soft Custard Fancy", "Storm Crystal", "Tritium Hypercluster", "Unstable Plasma"];
    _geneTableItemNames = ["Apple Cake of Lost Souls", "Apple Curiosity", "Legs-in-Pastry", "Abyssal Stew", "Acid", "Activated Cadmium", "Activated Emeril", "Activated Indium", "Aloe Flesh", "Ammonia", "Angelic Fruitcake", "Anomalous Doughnut", "Anomalous Jam", "Aronium", "Caramel-Encrusted Cake", "Carbon", "Geode", "Fusion Accelerant", "Storm Crystal", "Ionised Cobalt", "Sodium", "Magnetised Ferrite", "Di-hydrogen", "Larval Core", "Oxygen", "Condensed Carbon", "Unstable Plasma", "Fungal Mould", "Soft Custard Fancy", "Hexite", "Chromatic Metal"];
    _dyeTableItemNames = ["Apple Cake of Lost Souls", "Apple Curiosity", "Legs-in-Pastry", "Abyssal Stew", "Acid", "Activated Cadmium", "Activated Emeril", "Activated Indium", "Aloe Flesh", "Ammonia", "Angelic Fruitcake", "Anomalous Doughnut", "Anomalous Jam", "Anomalous Tart", "Aronium", "Bromide Salt", "Carbon", "Condensed Carbon", "Enriched Carbon", "Caramel-Encrusted Cake", "Chromatic Metal", "Crystal Sulphide", "Di-hydrogen", "Fireberry", "Frozen Tubers", "Fungal Mould", "Fusion Accelerant", "Geode", "Geodesite", "Grahberry", "Grantine", "Gravitino Ball", "Hadal Core", "Herox", "Hexaberry", "Hexite", "Hot Ice", "Hypnotic Eye", "Ionised Cobalt", "Iridesite", "Jade Peas", "Larval Core", "Leopard-Fruit", "Lemmium", "Living Pearl", "Lubricant", "Magnetised Ferrite", "Magno-Gold", "Nitrogen Salt", "Ohmic Gel", "Optical Solvent", "Organic Catalyst", "Oxygen", "Re-latticed Arc Crystal", "Sac Venom", "Semiconductor", "Tank of Coolant", "Thermic Condensate", "Sodium", "Soft Custard Fancy", "Storm Crystal", "Unrefined Pyrite Grease", "Unstable Gel", "Unstable Plasma", "Welding Soap"];
    _neuralTableItemNames = ["Apple Curiosity", "Activated Emeril", "Activated Indium", "Aloe Flesh", "Aronium", "Storm Crystal", "Larval Core", "Hexite", "Indium", "Pugneum", "GekNip", "Apple Cake of Lost Souls", "Legs-in-Pastry", "Abyssal Stew", "Angelic Fruitcake", "Activated Cadmium", "Activated Copper", "Cadmium", "Emeril", "Ammonia", "Sodium", "Di-hydrogen", "Fusion Accelerant", "Ionised Cobalt", "Soft Custard Fancy", "Caramel-Encrusted Cake", "Gold", "Acid", "Anomalous Doughnut", "Anomalous Jam", "Carbon", "Copper", "Geode", "Lemmium", "Magnetised Ferrite", "Oxygen", "Condensed Carbon", "Unstable Plasma", "Fungal Mould", "Chromatic Metal"];

  }

  Future<void> initialiseTables() async {
    WidgetsFlutterBinding.ensureInitialized();
    _dyeTableEntries = await initialiseDyeTable();
    _growthTableEntries = await initialiseGrowthTable();
    _geneticTableEntries = await initialiseGeneTable();
    _neuralTableEntries = await initialiseNeuralTable();
  }

  Future<List> initialiseGrowthTable() async {
    List growthTable = [];
    for(String itemName in _growthTableItemNames){
      String itemImagePath = "assets/itemData/$itemName/image.png";
      String growthEffectsFile = await rootBundle.loadString("assets/itemData/$itemName/growthEffects.txt");
      Map growthEffectsMap = jsonDecode(growthEffectsFile);
      growthEffectsMap["imagePath"] = itemImagePath;
      growthTable.add(growthEffectsMap);
      }
    return growthTable;
    }

    Future<List> initialiseGeneTable() async {
      List geneTable = [];
      for(String itemName in _geneTableItemNames){
        String itemImagePath = "assets/itemData/$itemName/image.png";
        String geneEffectsFile = await rootBundle.loadString("assets/itemData/$itemName/geneEffects.txt");
        Map geneEffectsMap = jsonDecode(geneEffectsFile);
        geneEffectsMap["imagePath"] = itemImagePath;
        geneTable.add(geneEffectsMap);
      }
      return geneTable;
    }

    Future<List> initialiseDyeTable() async {
      List dyeTable = [];
      for(String itemName in _dyeTableItemNames){
        String itemImagePath = "assets/itemData/$itemName/image.png";
        String dyeEffectsFile = await rootBundle.loadString("assets/itemData/$itemName/dyeEffects.txt");
        Map dyeEffectsMap = jsonDecode(dyeEffectsFile);
        dyeEffectsMap["imagePath"] = itemImagePath;
        dyeTable.add(dyeEffectsMap);
      }
      return dyeTable;
    }

    Future<List> initialiseNeuralTable() async {
      List neuralTable = [];
      for(String itemName in _neuralTableItemNames){
        String itemImagePath = "assets/itemData/$itemName/image.png";
        String neuralEffectsFile = await rootBundle.loadString("assets/itemData/$itemName/neuralEffects.txt");
        Map neuralEffectsMap = jsonDecode(neuralEffectsFile);
        neuralEffectsMap["imagePath"] = itemImagePath;
        neuralTable.add(neuralEffectsMap);
      }
      return neuralTable;
    }


  List getGrowthTable(){
    return _growthTableEntries;
  }

  List getGeneTable(){
    return _geneticTableEntries;
  }

  List getDyeTable(){
    return _dyeTableEntries;
  }

  List getNeuralTable(){
    return _neuralTableEntries;
  }



}



enum ItemStatus{
  INCREASING, DECREASING, UNSTABLE
}



