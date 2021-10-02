import 'dart:io';
import "package:flutter/services.dart";
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nmscompanions/Item.dart';
import "stateWidget.dart";
import 'package:nmscompanions/BackgroundDecoration.dart';

class EggSequencer extends StatefulWidget {
  @override
  _EggSequencerState createState() => _EggSequencerState();
}

class _EggSequencerState extends State<EggSequencer> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final attributeStatus = InheritedItemData.of(context).status.attributeStatus;
    final itemData = InheritedItemData.of(context).itemData;
    final textTheme = InheritedItemData.of(context).textTheme;
    return FutureBuilder(
      future: itemData.initialiseTables(),
      builder: (context, state) {
        if(state.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
                title: Text("Egg Sequencer", style: textTheme.headline1,),
                centerTitle: true,
                elevation: 5,
                leading: IconButton(
                    icon: Icon(Icons.help_rounded),
                    onPressed: () =>
                    {
                      Navigator.pushNamed(context, "/GuideScreen")
                    }
                ),
              actions: [
                IconButton(icon: Icon(Icons.settings), onPressed: () => Navigator.pushNamed(context, "/SettingsScreen"))
              ],
            ),

            body: Container(
              padding: EdgeInsets.all(10),
              decoration: BackgroundDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    flex: 10,
                      child: GeneticInputRow()),
                  RowDivider(),
                  Flexible(
                    flex: 16,
                    child: CatalystsRow(attributeStatus[ItemSlot.GROWTH_HORMONE][1],
                        attributeStatus[ItemSlot.GENE_SPLITTER][1],
                        attributeStatus[ItemSlot.DYE_INJECTOR][1],
                        attributeStatus[ItemSlot.NEURAL_CALIBRATOR][1], () =>
                            setState(() {})),
                  ),
                  RowDivider(),
                  Flexible(
                    flex: 13,
                    child: EmbryoStatusRow(attributeStatus[ItemSlot.GROWTH_HORMONE][0],
                        attributeStatus[ItemSlot.GENE_SPLITTER][0],
                        attributeStatus[ItemSlot.DYE_INJECTOR][0],
                        attributeStatus[ItemSlot.NEURAL_CALIBRATOR][0],
                        attributeStatus[ItemSlot.NEURAL_CALIBRATOR][4]),
                  ),
                  RowDivider(),
                  Flexible(
                    flex: 10,
                      child: ColourRow(attributeStatus[ItemSlot.DYE_INJECTOR][4]))
                ],
              ),
            ),
          );
        } else return CircularProgressIndicator( //TODO: Make loading screen look acceptable.
          backgroundColor: Colors.teal[800],
        );
      }
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
    final textTheme = InheritedItemData.of(context).textTheme;
    return Column(
      children: [
        Text(
          "Current Colouring", style: textTheme.headline1,),
        SizedBox(height: 5,)
      ] + getColourWidgets(getColoursFromText(widget.colour)),
    );
  }

  List<Color> getColoursFromText(String colourText) {
    List<Color> colourList = [];
    Map<String, Color> companionColours = {
      "Brown": Colors.brown,
      "Black": Colors.black,
      "White": Colors.white,
      "Red": Colors.red,
      "Mint" : Colors.green[200],
      "Dark Gray" : Colors.grey[700],
      "Sickly Green" : Colors.lime[800],
      "Medium Cream" : Colors.orange[100],
      "Dull Orange" : Colors.orange[300],
      "Golden Orange" : Colors.orange[400],
      "Light Lavender" : Colors.purple[100],
      "Light Green" : Colors.lightGreen[400],
      "Leaf Green" : Colors.green[700],
      "Burnt Orange" : Colors.deepOrange,
      "Dark Green" : Colors.green[900],
      "Light Brown" : Colors.brown[300],
      "Pale Blue" : Colors.lightBlue,
      "Yellow" : Colors.yellow,
      "Pale Yellow" : Colors.yellow[300],
      "Gray" : Colors.grey,
      "Blue" : Colors.blue,
      "Dark Blue" : Colors.blue[800],
      "Bright Dull Yellow" : Colors.yellowAccent,
      "Cream" : Colors.amber[100],
      "Purple" : Colors.purple,
      "Bright Yellow" : Colors.yellow[300],
      "Lavender" : Colors.purple[200],
      "Light Orange" : Colors.orange[200],
      "Blue Green" : Colors.teal[400],
      "Light Blue" : Colors.lightBlue[200],
      "Near White" : Colors.grey[100],
      "Burgundy" : Colors.red[900],
      "Mint Green" : Colors.green[300],
      "Dark Yellow" : Colors.yellow[700],
      "Lime Green" : Colors.limeAccent,
      "Dark Tan" : Colors.brown[500],
      "Auburn" : Colors.redAccent[700],
      "Brick Red" : Colors.red[800],
      "Powder Blue" : Colors.indigo,
      "Light Cream" : Colors.yellow[100],
      "Dull Yellow" : Colors.yellow[600],
      "Tan" : Colors.brown[200],
      "Pink" : Colors.pink[400],
      "Cyan" : Colors.cyan,
      "Light Gray" : Colors.grey[400],
      "Dull Green" : Colors.green[900],
      "Pale Red" : Colors.redAccent,
      "Green" : Colors.green,
      "Light Yellow" : Colors.yellow[300],
      "Dull Cream" : Colors.brown[200],
      "Deep Red" : Colors.redAccent[700],
      "Sicky Green" : Colors.lime,
      "Bright Orange" : Colors.orange[300],
      "Orange" : Colors.orange,
      "Dull Red" : Colors.red[600],
    };
    for(String colourPairs in colourText.split("/")) {
      for(String colour in colourPairs.split(",")){
        if(companionColours.containsKey(colour.trim())) {
          Color colourObj = companionColours[colour.trim()];
          if(!colourList.contains(colourObj)) {
            colourList.add(companionColours[colour.trim()]);
          }
        }
      }
    }
    return colourList;
  }

  List<Widget> getColourWidgets(List<Color> colours){
    List<Widget> colourTiles = [];
    for(Color colour in colours){
      colourTiles.add(
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Container(
                color: colour
              ),
            ),
          ));
      }
    return colourTiles;
  }
}


class GeneticInputRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = InheritedItemData.of(context).textTheme;
    return Column(
      children: [
        Text("Genetic Input", style: textTheme.headline2),
        Item("Companion Egg", "assets/CompanionEgg.png", ItemSlot.COMPANION_EGG, null),
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
    final textTheme = InheritedItemData.of(context).textTheme;
    final itemStatus = InheritedItemData.of(context).status;
    return Column(
      children: [
        Text("Catalysts", style: textTheme.headline2,),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: CatalystsItem("Growth Hormone", widget.growthHormoneDose, itemStatus.getItemQuantity(ItemSlot.GROWTH_HORMONE), itemStatus.attributeStatus[ItemSlot.GROWTH_HORMONE][2], itemStatus.getItemImagePath(ItemSlot.GROWTH_HORMONE), ItemSlot.GROWTH_HORMONE, widget.callback)),
            Flexible(child: CatalystsItem("Gene Splitter", widget.geneSplitterDose, itemStatus.getItemQuantity(ItemSlot.GENE_SPLITTER), itemStatus.attributeStatus[ItemSlot.GENE_SPLITTER][2], itemStatus.getItemImagePath(ItemSlot.GENE_SPLITTER), ItemSlot.GENE_SPLITTER, widget.callback)),
            Flexible(child: CatalystsItem("Dye Injector", widget.dyeInjectorDose, itemStatus.getItemQuantity(ItemSlot.DYE_INJECTOR), itemStatus.attributeStatus[ItemSlot.DYE_INJECTOR][2], itemStatus.getItemImagePath(ItemSlot.DYE_INJECTOR), ItemSlot.DYE_INJECTOR, widget.callback)),
            Flexible(child: CatalystsItem("Neural Calibrator", widget.neuralCalibratorDose, itemStatus.getItemQuantity(ItemSlot.NEURAL_CALIBRATOR), itemStatus.attributeStatus[ItemSlot.NEURAL_CALIBRATOR][2], itemStatus.getItemImagePath(ItemSlot.NEURAL_CALIBRATOR), ItemSlot.NEURAL_CALIBRATOR, widget.callback))
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
  final String itemGraphicPath;
  int quantity;
  String doseText;
  final callBack;
  CatalystsItem(this.type, this.dose, this.quantity, this.itemName, this.itemGraphicPath, this.itemSlot, this.callBack);

  @override
  Widget build(BuildContext context) {
    final textTheme = InheritedItemData.of(context).textTheme;
    final itemStatus = InheritedItemData.of(context).status;
    final double numericalDose = double.parse(dose);
    if(numericalDose > 100.0){
      doseText = "Overdosed! $dose% ";
      quantity = 1;
    }
    else if(itemStatus.getItemDose(itemSlot) > 100){
      if(itemSlot == ItemSlot.GENE_SPLITTER) {
        if(itemStatus.getItemDose(itemSlot) < 150){
          doseText = "Overdosed! " + itemStatus.getItemDose(itemSlot).toString() + "%";
          quantity = (itemStatus.getItemDose(itemSlot) ~/ numericalDose) + 1;
        }
        else{
          doseText = "Overdosed! 150%";
          quantity = 150 ~/ numericalDose;
        }
      }
      else {
        doseText = "Dose: 100%";
        quantity = 100 ~/ numericalDose;
      }
    }
    else{
      doseText = "Dose: " + itemStatus.getItemDose(itemSlot).toString() + "%";
    }
    return Column(
      children: [
        Text(type, style: textTheme.subtitle1),
        Item(itemName, itemGraphicPath, itemSlot, callBack),
        Text(doseText, style: textTheme.subtitle1),
        Text("Quantity: $quantity", style: textTheme.subtitle1)
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
    final textTheme = InheritedItemData.of(context).textTheme;
    return Column(
      children: [
        Text("Embryo Status", style: textTheme.headline2),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

  EmbryoItem(this.itemStatus, this.attributeName);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double iconSize = 65 * (screenHeight / 760);
    if (itemStatus == ItemStatus.INCREASING) {
      statusIcon = Icon(
        Icons.trending_up_rounded, color: Colors.greenAccent[400],
        size: iconSize,);
      status = "Increasing";
    } else if (itemStatus == ItemStatus.DECREASING) {
      statusIcon =
          Icon(Icons.trending_down_rounded, color: Colors.red, size: iconSize,);
      status = "Decreasing";
    } else if(itemStatus == ItemStatus.INHERITED){
      statusIcon = Icon(
        MaterialCommunityIcons.dna, color: Colors.blueGrey[600], size: iconSize,);
      status = "Inherited";
    } else {
      statusIcon = Icon(Icons.multitrack_audio_rounded, color: Colors.blue[300], size: iconSize,);
      status = "Unstable";
    }
    final textTheme = InheritedItemData.of(context).textTheme;
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
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25 * (screenHeight / 760)),
      child: Divider(
        height: 20 * (screenHeight / 760),
        thickness: 3 * (screenHeight / 760),
        color: Colors.blueGrey[600]
      ),
    );
  }
}




