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
        centerTitle: true,
        backgroundColor: Colors.cyan[900],
        elevation: 5,
        leading: IconButton(
          icon: Icon(Icons.help_rounded),
          onPressed: () => {
            Navigator.pushNamed(context, "/GuideScreen")
          }
        )
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
                attributeStatus[ItemSlot.DYE_INJECTOR][1], attributeStatus[ItemSlot.NEURAL_CALIBRATOR][1], () => setState(() {})),
            RowDivider(),
            EmbryoStatusRow(attributeStatus[ItemSlot.GROWTH_HORMONE][0], attributeStatus[ItemSlot.GENE_SPLITTER][0],
                attributeStatus[ItemSlot.DYE_INJECTOR][0], attributeStatus[ItemSlot.NEURAL_CALIBRATOR][0], attributeStatus[ItemSlot.NEURAL_CALIBRATOR][3]),
            RowDivider(),
            ColourRow(attributeStatus[ItemSlot.DYE_INJECTOR][3])
          ],
        ),
      ),
    );
  }
}


class ColourRow extends StatefulWidget {
  final String colour;
  ColourRow(this.colour);
  @override
  _ColourRowState createState() => _ColourRowState();
}

class _ColourRowState extends State<ColourRow> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text("Current Colouring: " + widget.colour, style: textTheme.headline1,);
  }
}


class GeneticInputRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text("Genetic Input", style: textTheme.headline2),
        Item("Companion Egg", "assets/sampleItem.png", ItemSlot.COMPANION_EGG, null),
      ],
    );
  }
}

class CatalystsRow extends StatefulWidget {

  final String growthHormoneDose;
  final String geneSplitterDose;
  final String dyeInjectorDose;
  final String neuralCalibratorDose;
  final callback;

  CatalystsRow(this.growthHormoneDose, this.geneSplitterDose, this.dyeInjectorDose, this.neuralCalibratorDose, this.callback);

  @override
  _CatalystsRowState createState() => _CatalystsRowState();
}

class _CatalystsRowState extends State<CatalystsRow> {

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final attrStatus = InheritedItemData.of(context).status.attributeStatus;
    return Column(
      children: [
        Text("Catalysts", style: textTheme.headline2,),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(child: CatalystsItem("Growth Hormone", widget.growthHormoneDose, attrStatus[ItemSlot.GROWTH_HORMONE][2], "assets/sampleItem.png", ItemSlot.GROWTH_HORMONE, widget.callback)),
            Flexible(child: CatalystsItem("Gene Splitter", widget.geneSplitterDose, attrStatus[ItemSlot.GENE_SPLITTER][2], "assets/sampleItem.png", ItemSlot.GENE_SPLITTER, widget.callback)),
            Flexible(child: CatalystsItem("Dye Injector", widget.dyeInjectorDose, attrStatus[ItemSlot.DYE_INJECTOR][2], "assets/sampleItem.png", ItemSlot.DYE_INJECTOR, widget.callback)),
            Flexible(child: CatalystsItem("Neural Calibrator", widget.neuralCalibratorDose, attrStatus[ItemSlot.NEURAL_CALIBRATOR][2], "assets/sampleItem.png", ItemSlot.NEURAL_CALIBRATOR, widget.callback))
          ],
        ),
      ],
    );
  }
}

class CatalystsItem extends StatelessWidget {
  final String type;
  final String dose;
  final String itemName;
  final ItemSlot itemSlot;
  final String itemGraphicName;
  final String doseText;
  final callBack;
  CatalystsItem(this.type, this.dose, this.itemName, this.itemGraphicName, this.itemSlot, this.callBack) :
        doseText = (double.parse(dose.replaceAll("%", "")) < 100.0) ? "Dose: $dose " : "Overdosed! $dose ";

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(type, style: textTheme.subtitle1),
        Item(itemName, itemGraphicName, itemSlot, callBack),
        Text(doseText, style: textTheme.subtitle1)
      ],
    );
  }
}

class EmbryoStatusRow extends StatefulWidget {
  final weightHeightStatus;
  final anatomyStatus;
  final colouringStatus;
  final neuralStatus;
  final String neuralAttribute;

  EmbryoStatusRow(this.weightHeightStatus, this.anatomyStatus, this.colouringStatus, this.neuralStatus, this.neuralAttribute);

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
            EmbryoItem(widget.weightHeightStatus, "Weight / Height"),
            EmbryoItem(widget.anatomyStatus, "Anatomy"),
            EmbryoItem(widget.colouringStatus, "Colouring"),
            EmbryoItem(widget.neuralStatus, widget.neuralAttribute),
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




