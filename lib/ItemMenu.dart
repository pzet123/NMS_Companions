import 'package:flutter/material.dart';
import 'package:nmscompanions/GrowthHormoneInfoWidget.dart';
import 'package:nmscompanions/ItemListTile.dart';
import 'Item.dart';


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
      case ItemSlot.GROWTH_HORMONE :
        {
          for (int x = 0; x < 10; x++) {
            itemWigets.add(
                ItemListTile(
                    child: GrowthHormoneInfo(true),
                    itemName: "Test",
                    dose: 20)
            );
          }
          for (int x = 0; x < 10; x++) {
            itemWigets.add(
                ItemListTile(
                    child: GrowthHormoneInfo(false),
                    itemName: "Test",
                    dose: 20)
            );
          }
        }
        break;
      case ItemSlot.GENE_SPLITTER :
        {
          for (int x = 0; x < 10; x++) {
            itemWigets.add(
              ItemListTile(
                  child: Icon(Icons.multitrack_audio_rounded,
                  color: Colors.blue[300]),
                  itemName: "Test",
                  dose: 20)
            );
          }
        }
        break;
  }

    return itemWigets;
  }

  Widget getItemWidget(Item item){
    return null;
  }



}
