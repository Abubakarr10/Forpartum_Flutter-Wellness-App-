import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Gentle%20Movement%20Pod/gentleMovementClasses2.dart';
import 'package:forpartum/Dashboard/navigator_bottom_bar.dart';

import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';

class GentleMovementClasses extends StatefulWidget {
  const GentleMovementClasses({super.key});

  @override
  State<GentleMovementClasses> createState() => _GentleMovementClassesState();
}

class _GentleMovementClassesState extends State<GentleMovementClasses> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ===== Top Bar ====
            Stack(
              children: [
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Row(
                            children: [
                              TextStyleHelper().mytext(
                                  'Postpartum ', 24, FontWeight.w600, textColor),
                              TextStyleHelper().mytext(
                                  'Yoga',
                                  24,
                                  FontWeight.w700,
                                  MyCustomColor().mSecondaryColor())
                            ],
                          )),
                    ],
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        height: 50,
                        width: 50,
                        margin:
                        const EdgeInsets.only(top: 40, left: 20, right: 20),
                        alignment: AlignmentDirectional.center,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/images/back_image.png'))),
                  ),
                )
              ],
            ),

            /// ==== Tab Bar (5-15 min|15-30 min|Live|Newbie) ====
            Container(
              height: 64,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 60,bottom: 10),
              decoration: BoxDecoration(
                color: boxColor,
                border: Border.all(color: boxColor),
                boxShadow:  [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 30, offset: const Offset(0, 10)
                  ),
                ],
              ),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTabController(
                  length: 4,
                  child: Column(
                    children: <Widget>[
                      ButtonsTabBar(
                        controller: tabController,
                        backgroundColor:  MyCustomColor().mMainColor(),
                        unselectedBackgroundColor: Colors.grey.withOpacity(0.2),
                        labelStyle: const TextStyle(
                            color: Colors.white, //Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                        ),
                        unselectedLabelStyle: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                        ),
                        unselectedBorderColor: Colors.grey,
                        contentPadding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                        buttonMargin: const EdgeInsets.symmetric(horizontal: 20),
                        radius: 15,
                        tabs:   const [
                          Tab(text: '5-15 mins'),
                          Tab(text: '15-30 mins'),
                          Tab(text: 'Live'),
                          Tab(text: 'Newbie'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// ==== Tab Bar View =====
            Container(
              margin: const EdgeInsets.only(left: 30,top: 20),
              height: appHeight *1.1  , width: double.maxFinite,
              child:  TabBarView(
                controller: tabController,
                children: const [
                  SingleChildScrollView(child: Videos5To15Mins()),
                  SingleChildScrollView(child: Videos5To15Mins()),// Videos15To30Mins(),
                  SingleChildScrollView(child: Videos5To15Mins()),// LiveVideos(),
                  SingleChildScrollView(child: Videos5To15Mins()),// NewbieVideos()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// >>>> Tab Bar View (5-15 mins) <<<<<
class Videos5To15Mins extends StatelessWidget {
  const Videos5To15Mins({super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [

        const SizedBox(height: 20,),
        PodRow(
            title: 'Postpartum Yoga For Beginners', kcal: '110', time: '10',
            onClick: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> const GentleMovementClassesDetail()));
            },
            imagePath: 'assets/articles/mod01.png', imageBackgroundColor: MyCustomColor().mSecondaryColor()),
        const Padding(
          padding: EdgeInsets.only(right: 30,top: 20,bottom: 20),
          child: Divider(thickness: 1.5,),
        ),
        PodRow(
            title: 'Spine And Back Care Yoga', kcal: '135', time: '8',
            imagePath: 'assets/articles/mod02.png', imageBackgroundColor: MyCustomColor().mSecondaryColor(),
          onClick: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> const GentleMovementClassesDetail()));
          },
        ),
        const Padding(
          padding: EdgeInsets.only(right: 30,top: 20,bottom: 20),
          child: Divider(thickness: 1.5,),
        ),
         PodRow(
            title: 'Pelvic Floor Yoga', kcal: '135', time: '5',
            onClick: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> const GentleMovementClassesDetail()));
            },
            imagePath: 'assets/articles/mod03.png', imageBackgroundColor: const Color(0XFFFF805E)),
        const Padding(
          padding: EdgeInsets.only(right: 30,top: 20,bottom: 20),
          child: Divider(thickness: 1.5,),
        ),
         PodRow(
            title: 'Core Rebuilding Yoga', kcal: '135', time: '5',
            onClick: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> const GentleMovementClassesDetail()));
            },
            imagePath: 'assets/articles/mod04.png', imageBackgroundColor: const Color(0XFFFBBC05)),
        const Padding(
          padding: EdgeInsets.only(right: 30,top: 20,bottom: 20),
          child: Divider(thickness: 1.5,),
        ),
         PodRow(
            title: 'Hip Opening Yoga', kcal: '135', time: '5',
            onClick: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> const GentleMovementClassesDetail()));
            },
            imagePath: 'assets/articles/mod02.png', imageBackgroundColor: const Color(0XFF00ADB5)),
      ],
    );
  }
}

class PodRow extends StatelessWidget {
  final String title;
  final String kcal;
  final String time;
  final String imagePath;
  final Color imageBackgroundColor;
  VoidCallback onClick;
   PodRow({super.key,
  required this.title,
    required this.kcal,
    required this.time,
    required this.imagePath,
    required this.imageBackgroundColor,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Row(
        children: [
          Container(
            height: 90, width: 90,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                color: imageBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(imagePath))
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyleHelper().mytext(title, 12, FontWeight.w600, textColor),
              const SizedBox(height: 30,),
              Row(
                children: [
                  AppIcon(iconPath: 'assets/icons/kcal.png',
                    iconColor: textColor.withOpacity(0.6),iconSize: 13,),
                  const SizedBox(width: 4,),
                  TextStyleHelper().mytext(kcal, 13, FontWeight.w500, textColor.withOpacity(0.6)),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextStyleHelper().mytext('|', 13, FontWeight.w700, textColor.withOpacity(0.6)),
                  ),

                  AppIcon(iconPath: 'assets/icons/TimeCircle.png',
                    iconColor: textColor.withOpacity(0.6),iconSize: 13,),
                  const SizedBox(width: 4,),
                  TextStyleHelper().mytext(time, 13, FontWeight.w500, textColor.withOpacity(0.6))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextStyleHelper().mytext('Beginner', 13, FontWeight.w500, textColor.withOpacity(0.6)),
              )
            ],
          )
        ],
      ),
    );
  }
}

/// >>>> Tab Bar View (15-30 mins) <<<<<
class Videos15To30Mins extends StatelessWidget {
  const Videos15To30Mins({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// >>>> Tab Bar View (Live) <<<<<
class LiveVideos extends StatelessWidget {
  const LiveVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// >>>> Tab Bar View (Newbie) <<<<<
class NewbieVideos extends StatelessWidget {
  const NewbieVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
