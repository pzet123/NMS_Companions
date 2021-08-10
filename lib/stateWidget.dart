import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:nmscompanions/Item.dart';



class InheritedItemData extends InheritedWidget {
  final Status status;
  final ItemData itemData;
  final Widget child;

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
  List<Map<String, dynamic>> tableEntries;
  List<String> _growthTableItemNames;
  List<String> _geneTableItemNames;
  List<String> _dyeTableItemNames;
  List<String> _neuralTableItemNames;


  ItemData(List<Map<String, dynamic>> tableEntries) {
    _growthTableItemNames = ["Apple Cake of Lost Souls", "Apple Curiosity", "Legs-in-Pastry", "Abyssal Stew", "Acid", "Activated Cadmium", "Activated Copper", "Activated Emeril", "Activated Indium", "Albumen Pearl", "Aloe Flesh", "Ammonia", "Angelic Fruitcake", "Anomalous Doughnut", "Anomalous Jam", "Aronium", "Cadmium", "Caramel-Encrusted Cake", "Carbon", "Chlorine", "Chromatic Metal", "Cobalt", "Condensed Carbon", "Copper", "Crystal Sulphide", "Cyto-Phosphate", "Di-hydrogen", "Emeril", "Ferrite Dust", "Fungal Mould", "Fusion Accelerant", "Geode", "Gold", "Hexite", "Indium", "Ionised Cobalt", "Larval Core", "Living Pearl", "Magnetised Ferrite", "Oxygen", "Pugneum", "Pure Ferrite", "Salt", "Sodium", "Soft Custard Fancy", "Storm Crystal", "Tritium Hypercluster", "Unstable Plasma"];
    _geneTableItemNames = ["Apple Cake of Lost Souls", "Apple Curiosity", "Legs-in-Pastry", "Abyssal Stew", "Acid", "Activated Cadmium", "Activated Emeril", "Activated Indium", "Aloe Flesh", "Ammonia", "Angelic Fruitcake", "Anomalous Doughnut", "Anomalous Jam", "Aronium", "Caramel-Encrusted Cake", "Carbon", "Geode", "Fusion Accelerant", "Storm Crystal", "Ionised Cobalt", "Sodium", "Magnetised Ferrite", "Di-hydrogen", "Larval Core", "Oxygen", "Condensed Carbon", "Unstable Plasma", "Fungal Mould", "Soft Custard Fancy", "Hexite", "Chromatic Metal"];
    _dyeTableItemNames = ["Apple Cake of Lost Souls", "Apple Curiosity", "Legs-in-Pastry", "Abyssal Stew", "Acid", "Activated Cadmium", "Activated Emeril", "Activated Indium", "Aloe Flesh", "Ammonia", "Angelic Fruitcake", "Anomalous Doughnut", "Anomalous Jam", "Anomalous Tart", "Aronium", "Bromide Salt", "Carbon", "Condensed Carbon", "Enriched Carbon", "Caramel-Encrusted Cake", "Chromatic Metal", "Crystal Sulphide", "Di-hydrogen", "Fireberry", "Frozen Tubers", "Fungal Mould", "Fusion Accelerant", "Geode", "Geodesite", "Grahberry", "Grantine", "Gravitino Ball", "Hadal Core", "Herox", "Hexaberry", "Hexite", "Hot Ice", "Hypnotic Eye", "Ionised Cobalt", "Iridesite", "Jade Peas", "Larval Core", "Leopard-Fruit", "Lemmium", "Living Pearl", "Lubricant", "Magnetised Ferrite", "Magno-Gold", "Nitrogen Salt", "Ohmic Gel", "Optical Solvent", "Organic Catalyst", "Oxygen", "Re-latticed Arc Crystal", "Sac Venom", "Semiconductor", "Tank of Coolant", "Thermic Condensate", "Sodium", "Soft Custard Fancy", "Storm Crystal", "Unrefined Pyrite Grease", "Unstable Gel", "Unstable Plasma", "Welding Soap"];
    _neuralTableEntries = ["Apple Curiosity", "Activated Emeril", "Activated Indium", "Aloe Flesh", "Aronium", "Storm Crystal", "Larval Core", "Hexite", "Indium", "Pugneum", "GekNip", "Product", "Apple Cake of Lost Souls", "Legs-in-Pastry", "Abyssal Stew", "Angelic Fruitcake", "Activated Cadmium", "Activated Copper", "Cadmium", "Emeril", "Ammonia", "Sodium", "Di-hydrogen", "Fusion Accelerant", "Ionised Cobalt", "Soft Custard Fancy", "Caramel-Encrusted Cake", "Gold", "Product", "Acid", "Anomalous Doughnut", "Anomalous Jam", "Carbon", "Copper", "Geode", "Lemmium", "Magnetised Ferrite", "Oxygen", "Condensed Carbon", "Unstable Plasma", "Fungal Mould", "Chromatic Metal"];
    this.tableEntries = tableEntries;
    initialiseTables();

  }

  void initialiseTables() async {
    WidgetsFlutterBinding.ensureInitialized();
    _growthTableEntries = await initialiseGrowthTable();
    // _geneticTableEntries = await initialiseGeneTable();
    // _dyeTableEntries = await initialiseDyeTable();
    // _neuralTableEntries = await initialiseNeuralTable();
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

    List initialiseGeneTable(){
      List geneTable = [];
      for(Map<String, dynamic> entry in tableEntries.sublist(450, 481)){
        String entryText = entry["title"];
        List<String> entryAttributes = entryText.split("\n");
        geneTable.add({"name" : entryAttributes[1], "dose" : entryAttributes[3]});
      }
      return geneTable;
    }

    List initialiseDyeTable(){
      List dyeTable = [];
      for(Map<String, dynamic> entry in tableEntries.sublist(482, 553)){
        String entryText = entry["title"];
        List<String> entryAttributes = (entryText.split("\n"));
        if(entryAttributes[9].length > 0 && entryAttributes[1] != "Product"){
          dyeTable.add({"name": entryAttributes[1], "dose": entryAttributes[9], "colour": entryAttributes[3]});
        }
      }
      return dyeTable;
    }

    List initialiseNeuralTable(){
      List neuralTable = [];
      for(Map<String, dynamic> entry in tableEntries.sublist(554, 596)){
        String entryText = entry["title"];
        List entryAttributes = entryText.split("\n");
        neuralTable.add({"name": entryAttributes[1], "neuralAttribute": entryAttributes[3], "dose": entryAttributes[5]});
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



