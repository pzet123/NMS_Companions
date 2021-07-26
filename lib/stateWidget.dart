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

  Status() : attributeStatus = {ItemSlot.GROWTH_HORMONE: [ItemStatus.INCREASING, 0],
    ItemSlot.GENE_SPLITTER: [ItemStatus.UNSTABLE, 0],
    ItemSlot.DYE_INJECTOR: [ItemStatus.UNSTABLE, 0],
    ItemSlot.NEURAL_CALIBRATOR: [ItemStatus.DECREASING, 0]};


  void setAttrStatus(ItemSlot itemSlot, ItemStatus itemStatus){
    attributeStatus[itemSlot][0] = itemStatus;
  }

  void setAttrDose(ItemSlot itemSlot, int dose){
    attributeStatus[itemSlot][1] = dose;
  }

}

class ItemData{

}

enum ItemStatus{
  INCREASING, DECREASING, UNSTABLE
}



