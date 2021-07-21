import 'package:flutter/material.dart';
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

  List<Widget> getItemWidgets(ItemSlot){
    List<Widget> itemWigets = [];

    for(int x = 0; x < 40; x++){
      itemWigets.add(
        ListTile(
          title: Text("Item Widget", style: TextStyle(fontSize: 22),),
          leading: Icon(Icons.animation),
          trailing: Icon(Icons.add),
        )
      );
    }

    return itemWigets;
  }
}
