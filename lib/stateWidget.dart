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

  Status() : attributeStatus = {ItemSlot.GROWTH_HORMONE: [ItemStatus.INCREASING, "0", ""],
    ItemSlot.GENE_SPLITTER: [ItemStatus.UNSTABLE, "0", ""],
    ItemSlot.DYE_INJECTOR: [ItemStatus.UNSTABLE, "0", ""],
    ItemSlot.NEURAL_CALIBRATOR: [ItemStatus.DECREASING, "0", "", "Aggression"]};


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

}

class ItemData{
  List _growthTableEntries;
  List _geneticTableEntries;
  List _dyeTableEntries;
  List _neuralTableEntries;
  List<Map<String, dynamic>> tableEntries;

  ItemData(List<Map<String, dynamic>> tableEntries) {
    this.tableEntries = tableEntries;
    _growthTableEntries = initialiseTableGrowth();
    _geneticTableEntries = initialiseTableGene();
    _dyeTableEntries = null;
    _neuralTableEntries = null;
  }

  List initialiseTableGrowth(){
    List growthTable = [];
    for(Map<String, dynamic> entry in tableEntries.sublist(1)){
      String entryText = entry["title"];
      List<String> entryAttributes = entryText.split("\n");
      if(entryAttributes[1] == "Writhing, Roiling Batter") {
        print(tableEntries.indexOf(entry));
        break;
      }
        if(entryAttributes[3].length > 0 && entryAttributes[5] != "") {
          growthTable.add({"name" : entryAttributes[1], "increasing" : (entryAttributes[3] == "Increase") ? true : false, "dose" : entryAttributes[5]});
        }
      }
    return growthTable;
    }

    List initialiseTableGene(){
      List geneTable = [];
      for(Map<String, dynamic> entry in tableEntries.sublist(450, 480)){
        String entryText = entry["title"];
        List<String> entryAttributes = entryText.split("\n");
        geneTable.add({"name" : entryAttributes[1], "dose" : entryAttributes[3]});
      }
      return geneTable;
    }


  List getGrowthTable(){
    return _growthTableEntries;
  }

  List getGeneTable(){
    return _geneticTableEntries;
  }


}



enum ItemStatus{
  INCREASING, DECREASING, UNSTABLE
}



