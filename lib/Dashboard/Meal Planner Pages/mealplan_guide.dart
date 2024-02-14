import 'package:flutter/material.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

class MealPlanGuidelines extends StatefulWidget {
  const MealPlanGuidelines({super.key});

  @override
  State<MealPlanGuidelines> createState() => _MealPlanGuidelinesState();
}

class _MealPlanGuidelinesState extends State<MealPlanGuidelines> {

  int selectedIndex = -1;

  var heading = {
    "1" : "Do I need extra calories while\nbreastfeeding?",
    "2" : "What foods should I eat while\nbreastfeeding?",
    "3" : "What foods should I eat while\nbreastfeeding?",
    "4" : "What foods should I eat while\nbreastfeeding?",
    "5" : "What foods should I eat while\nbreastfeeding?"
  };

  var subHeading = {
    "1" : "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\n"
        "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently.",
    "2" : "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\n"
        "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently.",
    "3" : "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\n"
        "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently.",
    "4" : "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\n"
        "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently.",
    "5" : "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\n"
        "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently."
  };

  List<bool> openList = [
    false, false, false, false, false
  ];

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  //double.maxFinite,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 20),
                              child: TextStyleHelper().mytext("Guidelines & Tips For Mom", 18,
                                  FontWeight.w500, textColor))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                        child: Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  selectedIndex = index;
                                  openList[index] = !openList[index];
                                });
                              },
                              child: openList[index] == true? CustomCard(
                                  title: heading.values.elementAt(index),
                                  paragraph:  subHeading.values.elementAt(index) ,
                                  height:  240,
                                  iconPath:  Icons.arrow_back_ios ,
                                  onClick: (){
                                    setState(() {
                                      selectedIndex = index;
                                      openList[index] = !openList[index];
                                    });
                                  }
                              ) :
                              CustomCard(
                                  title: heading.values.elementAt(index),
                                  paragraph: "",
                                  height: 90,
                                  iconPath: Icons.arrow_forward_ios,
                                  onClick: (){
                                    setState(() {
                                      selectedIndex = index;
                                      openList[index] = !openList[index];
                                    });
                                  }
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String paragraph;
  final IconData iconPath;
  double? height;
  bool? notSelected;
  final VoidCallback onClick;
   CustomCard({super.key,
   required this.title,
     required this.paragraph,
     required this.iconPath,
     required this.onClick,
     this.height=90,
     this.notSelected=false,
   });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Column(
      children: [
        Card(
            child: GestureDetector(
              onTap: (){
                return onClick();
              },
              child: SizedBox(
                height: height,
                width: MediaQuery.of(context).size.width,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title,
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: textColor),
                          ),
                          Transform.rotate(
                              angle: 90 * 3.14159265359 / 180,
                              child: Icon(iconPath)),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text(paragraph,
                        style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
              ),
            )
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}


