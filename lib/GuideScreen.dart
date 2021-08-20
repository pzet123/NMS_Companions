import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nmscompanions/stateWidget.dart';

class GuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guide"),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [Colors.cyan[900], Colors.teal[800], Colors.cyan[800]]
            )
        ),
        child: Column(
          children: [
            GuideEntryListTile(iconData: Icons.color_lens_rounded, title: "Companion Colouring", content: CompanionColouringEntry()),
            GuideEntryListTile(iconData: MaterialCommunityIcons.egg, title: "Attaining a Companion Egg", content: AttainingEggEntry(),),

          ],
        ),
      ),
    );
  }
}

class GuideEntryListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final content;
  GuideEntryListTile({this.iconData, this.title, this.content});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/GuideEntry", arguments: {"title" : title, "body" : content}),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
        color: Colors.cyan[800],
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(
          children: [
            Icon(iconData, size: 42, color: Colors.white70,),
            SizedBox(width: 25,),
            Text(title, style: textTheme.headline3,),
          ],
        ),
      ),
    );
  }
}

class GuideEntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map entryData = ModalRoute.of(context).settings.arguments;
    final textTheme = InheritedItemData.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: Text(entryData["title"], style: textTheme.headline3,),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [
                    Colors.cyan[900],
                    Colors.teal[800],
                    Colors.cyan[800]
                  ]
              )
          ),
          child: entryData["body"],
        ),
    );
  }
}

class CompanionColouringEntry extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final textTheme = InheritedItemData.of(context).textTheme;
    List<Widget> children = [
    Text("The colour of your hatched companion can be controlled using the dye injector.\nMost creatures will respond similarly when the same item is used however there are some exceptions"
    "\nCreatures are split up into four different colour groups which will be coloured differently",
    style: textTheme.headline3,),
    Text("Group one covers most of the creatures which were first introduced with the base game which includes the Mogara, Diplo, Felidae, Theroma, Tetraceris, Reococcyx, Felihex, Bos, and Tyranocae",
    style: textTheme.headline3,),
      Text("Group two covers bonecats which have a very recognisable look: ",
    style: textTheme.headline3,
    ),
    GuideReferenceImage(text: "Bonecat variant", imageLocation: "assets/guideReferenceImages/bonecat.png",),
    Text("Group three covers the Rhopalocera genus which includes butterflies, moths, dragonflies and other similar low flying creatures: ", style: textTheme.headline3),
    GuideReferenceImage(text: "A Rhopalocera variant", imageLocation: "assets/guideReferenceImages/butterfly.png",),
    Text("Group four covers the Mechanoceris genus which includes all of the robotic creatures found in uncharted systems: ", style: textTheme.headline3),
    GuideReferenceImage(text: "Robotic antelope", imageLocation: "assets/guideReferenceImages/robotAntelope.png",),
    Text("From what is currently known, the dosage of the item used in the dye injector will determine how much of the offspring will be covered in the new colour and how much will be inherited.",
    style: textTheme.headline3)
    ];
    return ListView.separated(
      itemCount: children.length,
      itemBuilder: (context, index){
        return children[index];
      },
      separatorBuilder: (context, index){
        return SizedBox(height: 20,);
      }
    );
  }
}

class AttainingEggEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Text("In order to attain an egg you must first tame a creature using creature pellets"),
      GuideReferenceImage(),
      Text("Once you have your companion, you can force them to lay an egg as long as the following conditions are met:"
          "\n-The companion's hunger and happiness meters aren't too low"
          "\n-The companion is currently on a planet with the same climate as their home planet"
          "\n-The companion has not laid an egg in the past 24 hours"
          "\n-The companion is old enough"
          "\n-Your character owns fewer than 6 eggs"),
      GuideReferenceImage(),
      Text("The egg will be transferred to your inventory upon the companion laying it"),
    ];
    return ListView.separated(
        itemBuilder: (context, index) {
          return children[index];
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 20);
        },
        itemCount: children.length);
  }
}


class GuideReferenceImage extends StatelessWidget {
  final String imageLocation;
  final String text;
  GuideReferenceImage({this.imageLocation, this.text});

  @override
  Widget build(BuildContext context) {
    final textTheme = InheritedItemData.of(context).textTheme;
    return Row(
      children: [
        Flexible(child: Image.asset(imageLocation), flex: 1,),
        SizedBox(width: 5,),
        Flexible(child: Text(text, style: textTheme.headline2,), flex: 1,)
      ],
    );
  }
}




