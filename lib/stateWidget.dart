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
  Status() : attributeStatus = {ItemSlot.GROWTH_HORMONE: [ItemStatus.INHERITED, "0", "", 1],
    ItemSlot.GENE_SPLITTER: [ItemStatus.INHERITED, "0", "", 1],
    ItemSlot.DYE_INJECTOR: [ItemStatus.INHERITED, "0", "", 1, "None"],
    ItemSlot.NEURAL_CALIBRATOR: [ItemStatus.INHERITED, "0", "", 1, "Aggression"]} {
  _itemImagePaths = {
  ItemSlot.GROWTH_HORMONE :"assets/emptyItem.png",
  ItemSlot.GENE_SPLITTER : "assets/emptyItem.png",
  ItemSlot.DYE_INJECTOR : "assets/emptyItem.png",
  ItemSlot.NEURAL_CALIBRATOR : "assets/emptyItem.png"
  };
}

  void setItemQuantity(ItemSlot itemSlot, int quantity){
    attributeStatus[itemSlot][3] = quantity;
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
    attributeStatus[ItemSlot.NEURAL_CALIBRATOR][4] = attribute;
  }

  void setCompanionColour(String colour){
    attributeStatus[ItemSlot.DYE_INJECTOR][4] = colour;
  }

  void setItemImage(ItemSlot itemSlot, String newImagePath){
    _itemImagePaths[itemSlot] = newImagePath;
  }

  String getItemImagePath(ItemSlot itemSlot){
    return _itemImagePaths[itemSlot];
  }

  int getItemDose(ItemSlot itemSlot){
    return (attributeStatus[itemSlot][3] * convertDoseToInt(attributeStatus[itemSlot][1])).toInt();
  }

  int getItemQuantity(ItemSlot itemSlot){
    return attributeStatus[itemSlot][3];
  }

  double convertDoseToInt(String dose){
    String trimmedDose = dose.replaceAll("%", "");
    double numericalDose = double.parse(trimmedDose);
    return numericalDose;
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
    _growthTableItemNames = ["Apple Cake of Lost Souls", "Apple Curiosity", "Legs-in-Pastry", "Abyssal Stew", "Acid", "Activated Cadmium", "Activated Copper", "Activated Emeril", "Activated Indium", "Albumen Pearl", "Aloe Flesh", "Ammonia", "Angelic Fruitcake", "Anomalous Doughnut", "Anomalous Jam", "Aronium", "Cadmium", "Caramel-Encrusted Cake", "Carbon", "Chlorine", "Chromatic Metal", "Cobalt", "Condensed Carbon", "Copper", "Crystal Sulphide", "Cyto-Phosphate", "Di-hydrogen", "Emeril", "Faecium", "Ferrite Dust", "Fungal Mould", "Fusion Accelerant", "Geode", "Gold", "Hexite", "Indium", "Ionised Cobalt", "Larval Core", "Living Pearl", "Magnetised Ferrite", "Magno-Gold", "Meaty Chunks", "Mordite", "NipNip Buds", "Oxygen", "Paraffinium", "Pugneum", "Pulpy Roots", "Pure Ferrite", "Pyrite", "Rusted Metal", "Salt", "Silver", "Sodium", "Soft Custard Fancy", "Storm Crystal", "Tritium", "Tritium Hypercluster", "Unstable Plasma"];
    _geneTableItemNames = ["Apple Cake of Lost Souls", "Apple Curiosity", "Abyssal Stew", "Acid", "Activated Cadmium", "Activated Emeril", "Activated Indium", "Aloe Flesh", "Ammonia", "Angelic Fruitcake", "Anomalous Doughnut", "Anomalous Jam", "Aronium", "Caramel-Encrusted Cake", "Carbon", "Chlorine", "Chromatic Metal", "Condensed Carbon", "Di-hydrogen", "Faecium",  "Fungal Mould", "Fusion Accelerant", "Geode", "Gold", "Hexite", "Ionised Cobalt", "Larval Core", "Legs-in-Pastry", "Magnetised Ferrite",  "Oxygen", "Salt", "Silver", "Sodium", "Soft Custard Fancy", "Storm Crystal", "Sodium Nitrate", "Tritium", "Unstable Plasma",];
    _dyeTableItemNames = ["Apple Cake of Lost Souls", "Apple Curiosity", "Legs-in-Pastry", "Abyssal Stew", "Acid", "Activated Cadmium", "Activated Emeril", "Activated Indium", "Aloe Flesh", "Ammonia", "Angelic Fruitcake", "Anomalous Doughnut", "Anomalous Jam", "Anomalous Tart", "Aronium", "Bromide Salt", "Carbon", "Chlorine", "Condensed Carbon", "Enriched Carbon", "Caramel-Encrusted Cake", "Chromatic Metal", "Crystal Sulphide", "Di-hydrogen", "Emeril", "Faecium", "Fireberry", "Frozen Tubers", "Fungal Mould", "Fusion Accelerant", "Geode", "Geodesite", "Grahberry", "Grantine", "Gravitino Ball", "Hadal Core", "Herox", "Hexaberry", "Hexite", "Hot Ice", "Hypnotic Eye", "Ionised Cobalt", "Iridesite", "Jade Peas", "Larval Core", "Leopard-Fruit", "Lemmium", "Living Pearl", "Lubricant", "Magnetised Ferrite", "Magno-Gold", "Nitrogen Salt", "Ohmic Gel", "Optical Solvent", "Organic Catalyst", "Oxygen", "Re-latticed Arc Crystal", "Sac Venom", "Salt", "Semiconductor", "Sodium Nitrate", "Tank of Coolant", "Thermic Condensate", "Tritium", "Sodium", "Soft Custard Fancy", "Storm Crystal", "Unrefined Pyrite Grease", "Unstable Gel", "Unstable Plasma", "Welding Soap"];
    _neuralTableItemNames = ["Apple Cake of Lost Souls", "Apple Curiosity", "Abyssal Stew", "Angelic Fruitcake", "Anomalous Doughnut", "Anomalous Jam", "Acid", "Activated Emeril", "Activated Indium", "Aloe Flesh", "Activated Cadmium", "Activated Copper",  "Ammonia", "Aronium", "Cadmium","Carbon", "Condensed Carbon", "Caramel-Encrusted Cake", "Chlorine", "Chromatic Metal",  "Copper", "Di-hydrogen","Emeril", "Faecium", "Fungal Mould", "Fusion Accelerant", "GekNip", "Geode", "Gold",  "Hexite", "Indium","Ionised Cobalt", "Larval Core", "Legs-in-Pastry", "Lemmium", "Magnetised Ferrite", "Oxygen", "Pugneum",  "Salt", "Silver",  "Sodium", "Soft Custard Fancy", "Sodium Nitrate", "Storm Crystal", "Tritium", "Unstable Plasma"];

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
  INCREASING, DECREASING, UNSTABLE, INHERITED
}



