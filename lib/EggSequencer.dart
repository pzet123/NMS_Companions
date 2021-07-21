import "package:flutter/material.dart";
import 'package:nmscompanions/Item.dart';

class EggSequencer extends StatefulWidget {
  @override
  _EggSequencerState createState() => _EggSequencerState();
}

class _EggSequencerState extends State<EggSequencer> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Egg Sequencer", style: textTheme.headline1,),
        backgroundColor: Colors.cyan[900],
        elevation: 5,

      ),
      body: Container(
        padding: EdgeInsets.all(10),
       decoration: BoxDecoration(
         gradient: LinearGradient(
             begin: AlignmentDirectional.topCenter,
             end: AlignmentDirectional.bottomCenter,
             colors: [Colors.cyan[900], Colors.teal[800], Colors.cyan[800]]
         )
       ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GeneticInputRow(),
            RowDivider(),
            CatalystsRow(),
            RowDivider(),
            EmbryoStatusRow(),

          ],
        ),
      ),
    );
  }
}

class GeneticInputRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text("Genetic Input", style: textTheme.headline2),
        Item("Companion Egg", "assets/sampleItem.png", ItemSlot.COMPANION_EGG),
      ],
    );
  }
}

class CatalystsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text("Catalysts", style: textTheme.headline2,),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CatalystsItem("Growth Hormone", 22, "Item", "assets/sampleItem.png", ItemSlot.GROWTH_HORMONE),
            CatalystsItem("Gene Splitter", 22, "Item", "assets/sampleItem.png", ItemSlot.GENE_SPLITTER),
            CatalystsItem("Dye Injector", 22, "Item", "assets/sampleItem.png", ItemSlot.DYE_INJECTOR),
            CatalystsItem("Neural Calibrator", 22, "Item", "assets/sampleItem.png", ItemSlot.NEURAL_CALIBRATOR)
          ],
        ),
      ],
    );
  }
}

class EmbryoStatusRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text("Embryo Status", style: textTheme.headline2),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            EmbryoItem("Increasing", "Weight / Height"),
            EmbryoItem("Decreasing", "Anatomy"),
            EmbryoItem("Increasing", "Colouring"),
            EmbryoItem("Increasing", "Aggression"),
          ],
        )
      ],
    );
  }
}

class EmbryoItem extends StatelessWidget {
  final String status;
  final IconData statusIcon;
  final String attributeName;
  EmbryoItem(this.status, this.attributeName) : statusIcon = (status == "Increasing") ? Icons.arrow_upward : Icons.arrow_downward;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(attributeName, style: textTheme.subtitle1),
        Icon(statusIcon, size: 50,),
        Text(status, style: textTheme.subtitle1)
      ],
    );
  }
}



class CatalystsItem extends StatelessWidget {
  final String type;
  final int dose;
  final String itemName;
  final ItemSlot itemSlot;
  final String itemGraphicName;
  final String doseText;
  CatalystsItem(this.type, this.dose, this.itemName, this.itemGraphicName, this.itemSlot) :
        doseText = (dose < 100) ? "Dose: $dose %" : "Overdosed! $dose %";

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(type, style: textTheme.subtitle1),
        Item(itemName, itemGraphicName, itemSlot),
        Text(doseText, style: textTheme.subtitle1)
      ],
    );
  }
}

class RowDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Divider(
        height: 20,
        thickness: 3,
        color: Colors.blueGrey[600]
      ),
    );
  }
}




