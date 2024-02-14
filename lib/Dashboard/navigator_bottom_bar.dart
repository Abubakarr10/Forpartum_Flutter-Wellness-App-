import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/trackerScreen.dart';
import 'package:forpartum/Dashboard/blogScreen.dart';
import 'package:forpartum/Dashboard/mealPlannerScreen.dart';

import 'package:forpartum/Dashboard/myProfileScreen.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';
import 'package:forpartum/screens/Side%20Menu%20Bar/entryPoint.dart';
import 'package:forpartum/screens/login_screen.dart';

import 'gentleMovementPod.dart';

class NavigatorBarScreen extends StatefulWidget {
   late  int showPage;
   late bool showIconIndex;
   late bool selectedPageIcon;
     NavigatorBarScreen({Key? key,
  this.showPage=0,
       this.showIconIndex=false,
       this.selectedPageIcon=true,
  }) : super(key: key);

  @override
  State<NavigatorBarScreen> createState() => _NavigatorBarScreenState();
}

class _NavigatorBarScreenState extends State<NavigatorBarScreen> {

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    naviSignOut();
  }

  void naviSignOut(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>
    const LoginScreen()
    ));
  }

  Future<bool> _onWillPop() async {
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: TextStyleHelper().mytext('Are you sure you want to exit from App!?', 16, FontWeight.w600,Theme.of(context).colorScheme.secondary),
        actions: <Widget>[
          ElevatedButton(
           style:ElevatedButton.styleFrom(backgroundColor: MyCustomColor().mMainColor(),),
            onPressed: () => Navigator.of(context).pop(true),
            child: TextStyleHelper().mytext('Yes', 14, FontWeight.w700, Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              style:ElevatedButton.styleFrom(
            backgroundColor: MyCustomColor().mSecondaryColor().withOpacity(0.6),),
              onPressed: () => Navigator.of(context).pop(false),
              child: TextStyleHelper().mytext('No', 14, FontWeight.w700, Colors.white),
            ),
          ),
        ],
      ),
    );

    if (result == true) {
      exit(0); // Close the app
    }

    return false; // Do not allow the user to exit normally
  }


  List pages =  [
    const EntryPoint(),
    const GentleMovementPodScreen(),
    const TrackerScreen(),
    const MainBlogScreen(),
    const MealPlannerScreen(),
    const MyProfileScreen()
  ];

 // bool selectedPage = true;
  bool selectedPage1 = false;
  bool selectedPage2 = false;
  //bool showIconIndex = false;
  bool selectedPage4 = false;
  bool selectedPage5 = false;


  void onTap(int index){
    setState(() {
      widget.showPage = index;
    });
  }

  Color iconSelectedColor = const Color(0XFFB1AFE9);
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: pages[widget.showPage],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton:
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FloatingActionButton(
                  onPressed: (){},
                  backgroundColor: MyCustomColor().mMainColor(),
                  child: AppIcon(iconPath: 'assets/icons/diet.png',iconColor: Colors.white,)
              ),
            ),
          ),
        bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).colorScheme.background,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /// >>>> Home <<<<<<
                    IconButton(
                        onPressed: (){
                          onTap(0);
                          widget.selectedPageIcon =! widget.selectedPageIcon;
                          selectedPage5 = false; selectedPage1 = false;
                          selectedPage2 = false; widget.showIconIndex = false;
                          selectedPage4 = false;
                    },
                        icon: widget.selectedPageIcon == true? Container(
                          height: 36, width: 36,
                          decoration: BoxDecoration(
                              color: iconSelectedColor,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                    color: iconSelectedColor,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 3)
                                )
                              ]
                          ),
                          child: AppIcon(iconPath: 'assets/icons/Home.png',iconColor: backgroundColor,),
                        ) :
                         AppIcon(iconPath: 'assets/icons/Home.png')
                    ),
                    /// >>>> Gentle Movement Pod <<<<<<
                    IconButton(
                        onPressed: (){
                          onTap(1);
                          selectedPage1 =! selectedPage1;
                          widget.selectedPageIcon = false; selectedPage5 = false;
                          selectedPage2 = false; widget.showIconIndex = false;
                          selectedPage4 = false;
                        },
                        icon: selectedPage1 == true? Container(
                          height: 36, width: 36,
                          decoration: BoxDecoration(
                              color: iconSelectedColor,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                    color: iconSelectedColor,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 3)
                                )
                              ]
                          ),
                          child: AppIcon(iconPath: 'assets/icons/gentleMod.png',iconColor: backgroundColor,),
                        ) :
                        AppIcon(iconPath: 'assets/icons/gentleMod.png')
                    ),
                    /// >>>> Tracker <<<<<<
                    IconButton(
                        onPressed: (){
                          onTap(2);
                          selectedPage2 =! selectedPage2;
                          widget.selectedPageIcon = false; selectedPage1 = false;
                          selectedPage5 = false; widget.showIconIndex = false;
                          selectedPage4 = false;
                        },
                        icon: selectedPage2 == true? Container(
                          height: 36, width: 36,
                          decoration: BoxDecoration(
                              color: iconSelectedColor,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                    color: iconSelectedColor,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 3)
                                )
                              ]
                          ),
                          child: AppIcon(iconPath: 'assets/icons/Activity.png',iconColor: backgroundColor,),
                        ) :
                        AppIcon(iconPath: 'assets/icons/Activity.png')
                    )
                  ],
                ),
              ),
              const Expanded(
                  flex: 2,
                  child: SizedBox(width: 1,)),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /// >>>> Blog <<<<<<
                    IconButton(
                        onPressed: (){
                          onTap(3);
                          widget.showIconIndex = !widget.showIconIndex;
                          widget.selectedPageIcon = false; selectedPage1 = false;
                          selectedPage2 = false; selectedPage5 = false;
                          selectedPage4 = false;
                        },
                        icon: widget.showIconIndex == true? Container(
                          height: 36, width: 36,
                          decoration: BoxDecoration(
                              color: iconSelectedColor,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                    color: iconSelectedColor,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 3)
                                )
                              ]
                          ),
                          child: AppIcon(iconPath: 'assets/icons/Camera.png',iconColor: backgroundColor,),
                        ) :
                        AppIcon(iconPath: 'assets/icons/Camera.png')
                    ),
                    /// >>>> Meal Planner <<<<<<
                    IconButton(
                        onPressed: (){
                          selectedPage4 =! selectedPage4;
                          widget.selectedPageIcon = false; selectedPage1 = false;
                          selectedPage2 = false; widget.showIconIndex = false;
                          selectedPage5 = false;
                          onTap(4);
                        },
                        icon: selectedPage4 == true? Container(
                          height: 36, width: 36,
                          decoration: BoxDecoration(
                              color: iconSelectedColor,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                    color: iconSelectedColor,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 3)
                                )
                              ]
                          ),
                          child: AppIcon(iconPath: 'assets/icons/mealPlanner.png',iconColor: backgroundColor,
                          iconSize: 22,),
                        ) :
                        AppIcon(iconPath: 'assets/icons/mealPlanner.png',iconSize: 22,)
                    ),
                    /// >>>> My Profile <<<<<<
                    IconButton(
                        onPressed: (){
                          onTap(5);
                          selectedPage5 =! selectedPage5;
                          widget.selectedPageIcon = false; selectedPage1 = false;
                          selectedPage2 = false; widget.showIconIndex = false;
                          selectedPage4 = false;
                        },
                        icon: selectedPage5 == true? Container(
                          height: 36, width: 36,
                          decoration: BoxDecoration(
                              color: iconSelectedColor,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                    color: iconSelectedColor,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 3)
                                )
                              ]
                          ),
                          child: AppIcon(iconPath: 'assets/icons/myProfile.png',iconColor: backgroundColor,),
                        ) :
                        AppIcon(iconPath: 'assets/icons/myProfile.png',)
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

class AppIcon extends StatelessWidget {
  final String iconPath;
  Color? iconColor;
  double? iconSize;
   AppIcon({super.key,
  required this.iconPath,
    this.iconColor = Colors.grey,
     this.iconSize = 28
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            iconColor!,
            BlendMode.srcIn,
          ),
          child: ImageIcon(AssetImage(iconPath),size: iconSize,)),
    );
  }
}
