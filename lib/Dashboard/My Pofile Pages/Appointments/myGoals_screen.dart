import "package:buttons_tabbar/buttons_tabbar.dart";
import "package:flutter/material.dart";
import "package:forpartum/Dashboard/navigator_bottom_bar.dart";

import "../../../helper/mycustomcolor.dart";
import "../../../helper/textStyleHelper.dart";

class MyGoalsScreen01 extends StatefulWidget {
  const MyGoalsScreen01({super.key});

  @override
  State<MyGoalsScreen01> createState() => _MyGoalsScreen01State();
}

class _MyGoalsScreen01State extends State<MyGoalsScreen01> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    TabController tabController = TabController(length: 2, vsync: this);
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;

    return  Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ===== Header Top Bar ====
            Stack(
              children: [
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: TextStyleHelper().mytext('My Goals', 20, FontWeight.w600, textColor)
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                        alignment: AlignmentDirectional.center,
                        child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/images/back_image.png'))),
                  ),),
              ],
            ),

            /// ===== Tab bar (Activity|Diet)====
            Container(
              height: 64,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 20, bottom: 10),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: boxColor,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: <Widget>[
                      ButtonsTabBar(
                        controller: tabController,
                        backgroundColor: MyCustomColor().mMainColor(),
                        unselectedBackgroundColor: boxColor,
                        labelStyle: TextStyle(
                            color: boxColor, //Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        unselectedLabelStyle: TextStyle(
                            color: MyCustomColor().mMainColor(),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        unselectedBorderColor: boxColor,
                        contentPadding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                        buttonMargin:
                        const EdgeInsets.symmetric(horizontal: 20),
                        radius: 100,
                        tabs: const [
                          Tab(text: 'Activity'),
                          Tab(text: 'Diet'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// ===== Tab Bar View =====
            Column(
              children: [
                SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: TabBarView(
                      controller: tabController,
                      children:  const [
                        MyGoalsActivityView(),
                        MyGoalsDietView()
                      ]
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// >>> Data in List of Goals Activity
var goalsTitles = {
  "Steps" : "Sleep",
  "Heart" : "Calories",
  "Water" : "Movement",
};

var goalsIcons = {
  "assets/icons/steps.png" : "assets/icons/sleep.png",
  "assets/icons/heart_goal.png" : "assets/icons/calories.png",
  "assets/icons/water.png" : "assets/icons/movement.png",
};

var goalsDigits = {
  "2285" : "08:15",
  "110  " : "453",
  "2000" : "02:45",
};

var goalsSubtitles = {
  "steps" : "Hours",
  "bmp" : "kcal",
  "ml" : "Hours",
};
/// >>> Tab Bar View Activity <<<<
class MyGoalsActivityView extends StatelessWidget {
  const MyGoalsActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return  Column(
      children: [

        const SizedBox(height: 80,),
        Wrap(
          children: List.generate(3, (index) {
            return  Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CustomDigitBox(
                          title: goalsTitles.keys.elementAt(index), iconPath: goalsIcons.keys.elementAt(index),
                          digits: goalsDigits.keys.elementAt(index), subtitle: goalsSubtitles.keys.elementAt(index)),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CustomDigitBox(
                          title: goalsTitles.values.elementAt(index), iconPath: goalsIcons.values.elementAt(index),
                          digits: goalsDigits.values.elementAt(index), subtitle: goalsSubtitles.values.elementAt(index)),
                    ),
                  )
                ],
              ),
            );
          }),
        )
      ],
    );
  }
}

/// >>> Tab Bar View Diet <<<<
class MyGoalsDietView extends StatelessWidget {
  const MyGoalsDietView({super.key});

  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [

          const SizedBox(height: 260,),
          Container(
            height: 80, width: appWidth,
            margin: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500.withOpacity(0.3),
                  blurRadius: 20,
                ),
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextStyleHelper().mytext('Breakfast', 18, FontWeight.w600, textColor),
                      const SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextStyleHelper().mytext('189', 18, FontWeight.w500, MyCustomColor().mMainColor()),
                          const SizedBox(width: 5,),
                          TextStyleHelper().mytext('kcal', 12, FontWeight.w500, Colors.grey),
                        ],
                      )
                      ],
                  ),
                  Container(
                    height: 32, width: 32,
                    decoration: BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500.withOpacity(0.2),
                          blurRadius: 10
                        )
                      ]
                    ),
                    child: Icon(Icons.arrow_forward_ios,
                    color: textColor,size: 16,),
                  )
                ],
              ),
            ),
          ),

          Stack(
            children: [
              // >>> Bottom Box
              Container(
                height: 200, width: appWidth,
                margin: const EdgeInsets.only(top: 80,left: 30,right: 30),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                  ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500.withOpacity(0.3),
                        blurRadius: 20,
                      ),
                    ]
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15,left: 20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextStyleHelper().mytext("White Rice", 14, FontWeight.w500, textColor),
                              const SizedBox(height: 5,),
                              TextStyleHelper().mytext("22 Teaspoons", 12, FontWeight.w500, MyCustomColor().mMainColor()),
                            ],
                          ),
                          Column(
                            children: [
                              TextStyleHelper().mytext('150\nkcal', 14, FontWeight.w500, MyCustomColor().mSecondColor())
                            ],
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(thickness: 1),
                    ),
                  ],
                ),
              ),
              // >>> Top Box
              Container(
                height: 80, width: appWidth,
                margin: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: MyCustomColor().mSecondColor().withOpacity(0.3),
                        blurRadius: 25,
                        offset: const Offset(0, 20)
                      ),
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextStyleHelper().mytext('Lunch', 18, FontWeight.w600, textColor),
                          const SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextStyleHelper().mytext('189', 18, FontWeight.w500, MyCustomColor().mMainColor()),
                              const SizedBox(width: 5,),
                              TextStyleHelper().mytext('kcal', 12, FontWeight.w500, Colors.grey),
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 32, width: 32,
                        decoration: BoxDecoration(
                            color: boxColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade500.withOpacity(0.2),
                                  blurRadius: 10
                              )
                            ]
                        ),
                        child: Transform.rotate(
                          angle: 90 * 3.14159265359 / 180,
                          child: Icon(Icons.arrow_forward_ios,
                            color: textColor,size: 16,),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomDigitBox extends StatelessWidget {
  final String title;
  final String iconPath;
  final String digits;
  final String subtitle;
  const CustomDigitBox({super.key,
    required this.title,
    required this.iconPath,
    required this.digits,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Container(
      height: 125, width: 150,
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
                color: Color(0X407168D3),
                // spreadRadius: 3,
                blurRadius: 30,
                offset: Offset(0,20)
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextStyleHelper().mytext(title,14, FontWeight.w600, textColor),
                AppIcon(iconPath: iconPath,iconColor: MyCustomColor().mMainColor(),)
              ],
            ),
            const SizedBox(height: 20,),
            Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextStyleHelper().mytext(digits, 26, FontWeight.w600, const Color(0XFFB1AFE9)),
                    TextStyleHelper().mytext(subtitle, 12, FontWeight.w600, Colors.grey)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class MealDetailsRow extends StatelessWidget {
  const MealDetailsRow({super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Padding(
      padding: const EdgeInsets.only(top: 15,left: 20,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyleHelper().mytext("White Rice", 14, FontWeight.w500, textColor),
              const SizedBox(height: 5,),
              TextStyleHelper().mytext("22 Teaspoons", 12, FontWeight.w500, MyCustomColor().mMainColor()),
            ],
          ),
          Column(
            children: [
              TextStyleHelper().mytext('150\nkcal', 14, FontWeight.w500, MyCustomColor().mSecondColor())
            ],
          )
        ],
      ),
    );
  }
}

