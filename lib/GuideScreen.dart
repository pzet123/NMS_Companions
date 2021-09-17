import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nmscompanions/stateWidget.dart';

class GuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Guide", style: textTheme.headline1,),
        centerTitle: true,
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
            GuideEntryListTile(iconData: MaterialCommunityIcons.egg, title: "Attaining a Companion Egg", content: AttainingEggEntry()),
            GuideEntryListTile(iconData: Icons.color_lens_rounded, title: "Companion Colouring", content: CompanionColouringEntry()),
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
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
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

class GuideText extends StatelessWidget {
  final String text;
  GuideText(this.text);
  @override
  Widget build(BuildContext context) {
    final textTheme = InheritedItemData.of(context).textTheme;
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(text, style: textTheme.headline3),
        ),
        color: Colors.cyan[800],);
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
    List<Widget> children = [
    GuideText("The colour of your hatched companion can be controlled using the dye injector.\nMost creatures will respond similarly when the same item is used however there are some exceptions"
    "\nCreatures are split up into four different colour groups which will be coloured differently"),
    GuideText("Group one covers most of the creatures which were first introduced with the base game which includes the Mogara, Diplo, Felidae, Theroma, Tetraceris, Reococcyx, Felihex, Bos, and Tyranocae"),
    GuideText("Group two covers bonecats which have a very recognisable look: "),
    GuideReferenceImage(text: "Bonecat variant", imageLocation: "assets/guideReferenceImages/bonecat.png",),
    GuideText("Group three covers the Rhopalocera genus which includes butterflies, moths, dragonflies and other similar low flying creatures: "),
    GuideReferenceImage(text: "A Rhopalocera variant", imageLocation: "assets/guideReferenceImages/butterfly.png",),
    GuideText("Group four covers the Mechanoceris genus which includes all of the robotic creatures found in uncharted systems: "),
    GuideReferenceImage(text: "Robotic antelope", imageLocation: "assets/guideReferenceImages/robotAntelope.png",),
    GuideText("From what is currently known, the dosage of the item used in the dye injector will determine how much of the offspring will be covered in the new colour and how much will be inherited."),
    GuideText("The guide currently only covers the first colour group as this is accounts for the vast majority of creatures however the option to select different colour groups will be added soon")
    ];
    return GuideEntryShell(children);
  }
}

class CompanionAccessoriesEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      GuideText("Most companions can be outfitted with one or more accessories. Accessories are currently purely cosmetic which the exception of the torch which is used to provide light"),
      GuideText("Some accessories like the laser give the impression of having a function as it will be used by the companion however it does not provide your companion with any abilities that it doesn't already have as creatures are already able to harvest resources and attack without a laser"),
      GuideText("The type of accessories that a creature can be adorned with will depend on its anatomy. For example, only a creature which has accessory slots on its side can equip the laser"),
      Image.asset("assets/guideReferenceImages/accessoryList.png"),
      GuideText("The last three accessories are locked by default, they can be unlocked at the quicksilver shop within the anomaly for 1600 quicksilver each")
    ];
    return GuideEntryShell(children);
  }
}

class GesturesEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      GuideText("Gestures can be used to give commands to your companion. Each gesture will generate a reaction however certain gestures can be used to give specific commands."),
      GuideText("Your companions ability to respond to commands will depend on their helpfulness/playfulness"),
      GuideText("Using the 'Need Resources' gesture will cause your companion to start digging up resources or scanning for them. Note that only companions with the laser accessory equipped can mine resources"),
      GuideReferenceImage(imageLocation: "assets/guideReferenceImages/needResourcesGesture.png", text: "Need Resources Gesture"),
      Image.asset("assets/guideReferenceImages/companionResource.png"),
      GuideText("If your companion harvests a resource, they will drop it in the form of a gift:"),
      GuideReferenceImage(imageLocation: "assets/guideReferenceImages/harvestedGift.png", text: "Harvested Gift"),
      GuideText("Pointing will lead to your companion heading in the direction which the player is facing. Pointing at creatures or sentinels can lead to your companion attacking them depending on their aggression."),
      GuideReferenceImage(imageLocation: "assets/guideReferenceImages/pointGesture.png", text: "Point Gesture"),
      GuideText("Sitting down will cause your companion to activate their resting animation"),
      Image.asset("assets/guideReferenceImages/sitGesture.png"),
      GuideText("Using the Come Here gesture will cause your companion to return to your current location. This can be useful if you want to interact with them."),
      GuideReferenceImage(imageLocation: "assets/guideReferenceImages/comeHereGesture.png", text: "Come Here Gesture"),
      GuideText("Each gesture can be accessed from the quick menu. The point and come here gestures can be accessed from within the companion sub-menu while all of them can be accessed from within the gestures sub-menu."),
    ];
    return GuideEntryShell(children);
  }
}

class AttainingEggEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      GuideText("In order to attain an egg you must first tame a creature using creature pellets which are crafted using 60 carbon."),
      GuideText("Once you have your companion, you can force them to lay an egg by interacting with them as long as the following conditions are met:"
          "\n-The companion's hunger and happiness meters aren't too low"
          "\n-The companion is currently on a planet with the same climate as their home planet"
          "\n-The companion has not laid an egg in the past 24 hours"
          "\n-The companion is old enough"
          "\n-Your character owns fewer than 6 eggs"),
      Image.asset("assets/guideReferenceImages/Inducing_egg.png"),
      GuideText("Once you select induce egg, your companion will lay an egg which you can pick up by interacting with it."),
      GuideReferenceImage(imageLocation: "assets/guideReferenceImages/viable_egg.png", text: "Companion Egg",)
    ];
    return GuideEntryShell(children);
  }
}

class NeuralAttributesEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      GuideText("Companions have three different neural aspects, each of which takes on one of two different attributes and is given a percentage as a rating"),
      GuideText("-Gentleness/Aggression\n-Independence/Devotion\n-Helpfulness/Playfulness"),
      GuideText("The first one of each of these sets of attributes is generally considered desirable however it is ultimately up to personal preference"),
      Image.asset("assets/guideReferenceImages/neuralAttributes1.png"),
      Image.asset("assets/guideReferenceImages/neuralAttributes2.png"),
      GuideText("Gentleness will make the creature more docile. Decreasing this will cause the creature to become more aggressive. An aggressive companion will attack other creatures more often which can reduce how often you have to feed them however it can also stop them from carrying out useful tasks like gathering resources"),
      GuideText("Independence controls how often your companion requires attention from you. devotion increases it while independence decreases it. Independence will also increase the radius of which the creature will listen to commands."),
      GuideText("Helpfulness determines how often companions will help you using their abilities. Increasing it will make them help more often while decreasing it will make them less likely to listen. Playfulness determines how often a creature carries out a playful action such as an animation. A creature with full playfulness will not help at all."),
      GuideText("These sets of attributes are mutually exclusive meaning you cannot have a gentle creature which is also aggressive or a creature which is helpful while being playful.")
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




