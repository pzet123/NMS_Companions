import "package:flutter/material.dart";
import 'package:nmscompanions/Item.dart';
import "stateWidget.dart";

class EggSequencer extends StatefulWidget {
  @override
  _EggSequencerState createState() => _EggSequencerState();
}

class _EggSequencerState extends State<EggSequencer> {
  @override
  Widget build(BuildContext context) {
    final attributeStatus = InheritedItemData.of(context).status.attributeStatus;
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
            CatalystsRow(attributeStatus[ItemSlot.GROWTH_HORMONE][1], attributeStatus[ItemSlot.GENE_SPLITTER][1],
                attributeStatus[ItemSlot.DYE_INJECTOR][1], attributeStatus[ItemSlot.NEURAL_CALIBRATOR][1]),
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

class CatalystsRow extends StatefulWidget {

  final int growthHormoneDose;
  final int geneSplitterDose;
  final int dyeInjectorDose;
  final int neuralCalibratorDose;

  CatalystsRow(this.growthHormoneDose, this.geneSplitterDose, this.dyeInjectorDose, this.neuralCalibratorDose);

  @override
  _CatalystsRowState createState() => _CatalystsRowState();
}

class _CatalystsRowState extends State<CatalystsRow> {

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
            CatalystsItem("Growth Hormone", widget.growthHormoneDose, "Item", "assets/sampleItem.png", ItemSlot.GROWTH_HORMONE),
            CatalystsItem("Gene Splitter", widget.geneSplitterDose, "Item", "assets/sampleItem.png", ItemSlot.GENE_SPLITTER),
            CatalystsItem("Dye Injector", widget.dyeInjectorDose, "Item", "assets/sampleItem.png", ItemSlot.DYE_INJECTOR),
            CatalystsItem("Neural Calibrator", widget.neuralCalibratorDose, "Item", "assets/sampleItem.png", ItemSlot.NEURAL_CALIBRATOR)
          ],
        ),
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

class EmbryoStatusRow extends StatefulWidget {
  @override
  _EmbryoStatusRowState createState() => _EmbryoStatusRowState();
}

class _EmbryoStatusRowState extends State<EmbryoStatusRow> {
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
            EmbryoItem(ItemStatus.INCREASING, "Weight / Height"),
            EmbryoItem(ItemStatus.UNSTABLE, "Anatomy"),
            EmbryoItem(ItemStatus.UNSTABLE, "Colouring"),
            EmbryoItem(ItemStatus.DECREASING, "Aggression"),
          ],
        )
      ],
    );
  }
}

class EmbryoItem extends StatelessWidget {
  final ItemStatus itemStatus;
  String status;
  Widget statusIcon;
  final String attributeName;
  EmbryoItem(this.itemStatus, this.attributeName){
    if(itemStatus == ItemStatus.INCREASING){
      statusIcon = Icon(Icons.trending_up_rounded, color: Colors.greenAccent[400], size: 50,);
      status = "Increasing";
    } else if(itemStatus == ItemStatus.DECREASING){
      statusIcon = Icon(Icons.trending_down_rounded, color: Colors.red, size: 50,);
      status = "Decreasing";
    } else {
      statusIcon = Icon(Icons.multitrack_audio_rounded, color: Colors.blue[300], size: 50,);
      status = "Unstable";
    }

  }



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(attributeName, style: textTheme.subtitle1),
        statusIcon,
        Text(status, style: textTheme.subtitle1)
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




