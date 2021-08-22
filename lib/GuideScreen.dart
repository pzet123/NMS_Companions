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
            GuideEntryListTile(iconData: Icons.color_lens_rounded, title: "Companion Colouring", content: AttainingEggEntry()),
            GuideEntryListTile(iconData: MaterialCommunityIcons.egg, title: "Attaining a Companion Egg", content: CompanionColouringEntry()),
            GuideEntryListTile(iconData: MaterialCommunityIcons.brain, title: "Companion Neural Attributes", content: NeuralAttributesEntry()),
            GuideEntryListTile(iconData: MaterialCommunityIcons.toolbox, title: "Companion Accessories", content: CompanionAccessoriesEntry()),
            GuideEntryListTile(iconData: MaterialCommunityIcons.hand_pointing_right, title: "Gestures", content: GesturesEntry()),
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

class GuideEntryShell extends StatelessWidget {
  final List<Widget> children;
  GuideEntryShell(this.children);
  @override
  Widget build(BuildContext context) {
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
    style: textTheme.headline3),
    Text("The guide currently only covers the first colour group as this is accounts for the vast majority of creatures however the option to select different colour groups will be added soon", style: textTheme.headline3)
    ];
    return GuideEntryShell(children);
  }
}

class CompanionAccessoriesEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = InheritedItemData.of(context).textTheme;
    List<Widget> children = [
      Text("Most companions can be outfitted with one or more accessories. Some accessories are functional while others are purely decorational", style: textTheme.headline3),
      Text("Functional Accessories:\n-Torch: A source of light during night time.\n-Square/Rounded laser: Allows your companion to mine resources, can also be used in combat."
          "\n-Vitals Monitor: Displays current health of companion\n-", style: textTheme.headline3),
      Text("Decorational Accessories: ", style: textTheme.headline3),
      Text("The type of accessories that a creature can be adorned with will depend on its anatomy. For example, only a creature which has accessory slots on its side can equip the laser", style: textTheme.headline3),
      Image.asset("assets/guideReferenceImages/accessoryList.png"),
      Text("The last three accessories are locked by default. To unlock them you must buy them at the quicksilver shop within the anomaly for 1600 quicksilver each", style: textTheme.headline3)
    ];
    return GuideEntryShell(children);
  }
}

class GesturesEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    List<Widget> children = [
      Text("Gestures can be used to give commands to your companion. Each gesture will generate a reaction however certain gestures can be used to give specific commands.", style: textTheme.headline3),
      Text("Your companions ability to respond to commands will depend on their helpfulness/playfulness", style: textTheme.headline3),
      Text("Using the 'Need Resources' gesture will cause your companion to start digging up resources or scanning for them. Note that only companions with the laser accessory equipped can mine resources", style: textTheme.headline3),
      GuideReferenceImage(imageLocation: "assets/guideReferenceImages/needResourcesGesture.png", text: "Need Resources Gesture"),
      Image.asset("assets/guideReferenceImages/companionResource.png"),
      Text("If your companion harvests a resource, they will drop it in the form of a gift:", style: textTheme.headline3),
      GuideReferenceImage(imageLocation: "assets/guideReferenceImages/harvestedGift.png", text: "Harvested Gift"),
      Text("Pointing will lead to your companion heading in the direction which the player is facing. Pointing at creatures or sentinels can lead to your companion attacking them depending on their aggression.", style: textTheme.headline3),
      GuideReferenceImage(imageLocation: "assets/guideReferenceImages/pointGesture.png", text: "Point Gesture"),

    ];
    return GuideEntryShell(children);
  }
}

class AttainingEggEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = InheritedItemData.of(context).textTheme;
    List<Widget> children = [
      Text("In order to attain an egg you must first tame a creature using creature pellets which are crafted using 60 carbon.", style: textTheme.headline3,),
      Text("Once you have your companion, you can force them to lay an egg by interacting with them as long as the following conditions are met:"
          "\n-The companion's hunger and happiness meters aren't too low"
          "\n-The companion is currently on a planet with the same climate as their home planet"
          "\n-The companion has not laid an egg in the past 24 hours"
          "\n-The companion is old enough"
          "\n-Your character owns fewer than 6 eggs", style: textTheme.headline3,),
      Image.asset("assets/guideReferenceImages/Inducing_egg.png"),
      Text("Once you select induce egg, your companion will lay an egg which you can pick up by interacting with it.", style: textTheme.headline3,),
      GuideReferenceImage(imageLocation: "assets/guideReferenceImages/viable_egg.png", text: "Companion Egg",)
    ];
    return GuideEntryShell(children);
  }
}

class NeuralAttributesEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = InheritedItemData.of(context).textTheme;
    List<Widget> children = [
      Text("Companions have three different neural aspects, each of which takes on one of two different attributes and is given a percentage as a rating", style: textTheme.headline3,),
      Text("-Gentleness/Aggression\n-Independence/Devotion\n-Helpfulness/Playfulness", style: textTheme.headline3),
      Text("The first one of each of these sets of attributes is generally considered desirable however it is ultimately up to personal preference", style: textTheme.headline3),
      Image.asset("assets/guideReferenceImages/neuralAttributes1.png"),
      Image.asset("assets/guideReferenceImages/neuralAttributes2.png"),
      Text("Gentleness will make the creature more docile. Decreasing this will cause the creature to become more aggressive. An aggressive companion will attack other creatures more often which can reduce how often you have to feed them however it can also stop them from carrying out useful tasks like gathering resources", style: textTheme.headline3),
      Text("Independence controls how often your companion requires attention from you. devotion increases it while independence decreases it. Independence will also increase the radius of which the creature will listen to commands.", style: textTheme.headline3),
      Text("Helpfulness determines how often companions will help you using their abilities. Increasing it will make them help more often while decreasing it will make them less likely to listen. Playfulness determines how often a creature carries out a playful action such as an animation. A creature with full playfulness will not help at all.", style: textTheme.headline3),
      Text("These sets of attributes are mutually exclusive meaning you cannot have a gentle creature which is also aggressive or a creature which is helpful while being playful.", style: textTheme.headline3)
    ];
    return GuideEntryShell(children);
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




