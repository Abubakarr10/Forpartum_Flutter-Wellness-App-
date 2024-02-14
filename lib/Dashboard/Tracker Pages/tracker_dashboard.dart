import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Tracker%20Pages/tacker_water.dart';
import 'package:forpartum/Dashboard/Tracker%20Pages/tracker_sleep.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

import '../Gentle Movement Pod/scheduleClass.dart';
import '../My Pofile Pages/Notifications/notifications_screen.dart';
import 'Feeding Tracker/feedingTracer.dart';

class TrackerDashboard extends StatefulWidget {
  const TrackerDashboard({super.key});

  @override
  State<TrackerDashboard> createState() => _TrackerDashboardState();
}

class _TrackerDashboardState extends State<TrackerDashboard> with TickerProviderStateMixin{
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
            /// ===== Header =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                      alignment: AlignmentDirectional.topEnd,
                      child: Image.asset('assets/images/back_image.png')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    'Tracker',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> const ScheduleClasses()));
                            },
                            child: Container(
                                height: 50,
                                width: 50,
                                margin: const EdgeInsets.only(top: 40, right: 10),
                                alignment: AlignmentDirectional.topEnd,
                                child: Image.asset('assets/icons/calendar.png')),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationScreen()));
                            },
                            child: Container(
                                height: 50,
                                width: 50,
                                margin: const EdgeInsets.only(top: 40, right: 20),
                                alignment: AlignmentDirectional.topEnd,
                                child: Image.asset('assets/icons/notification.png')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            /// ===== Profile Display =====
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 123, width: appWidth,
                      margin: const EdgeInsets.only(left: 30,right: 30,top: 40),
                      decoration: BoxDecoration(
                        color: MyCustomColor().mSecondaryColor(),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25), topRight: Radius.circular(25)
                        ),
                        image: const DecorationImage(image: AssetImage('assets/articles/bubbleDots.png'),
                          fit: BoxFit.fitWidth
                        )
                      ),
                    ),
                    Container(
                      height: 150, width: appWidth,
                      margin: const EdgeInsets.only(left: 30,right: 30,bottom: 40),
                      decoration: BoxDecoration(
                          color: boxColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)
                          ),
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 40, offset: const Offset(0, 6)
                        )]
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        height: 136, width: 136,
                        margin: const EdgeInsets.only(top: 70),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            image: const DecorationImage(image: AssetImage('assets/images/profile_pic.jpg'),
                            fit: BoxFit.cover),
                          border: Border.all(
                            color: Colors.white,
                            width: 3
                          ),
                          boxShadow: [BoxShadow(
                            color: MyCustomColor().mMainColor(),
                            spreadRadius: 2,offset: const Offset(0, 4)
                          )],
                          borderRadius: BorderRadius.circular(100)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            TextStyleHelper().mytext('Hi, Lucy', 18, FontWeight.w600, textColor),
                            const SizedBox(height: 10,),
                            TextStyleHelper().mytext('Keep with our plan, You are doing great!', 12, FontWeight.w500, Colors.grey),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// ==== Tab Bar (Daily|Weekly|Monthly|Yearly) ====
            Container(
              height: 64,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top:20,bottom: 10),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTabController(
                  length: 4,
                  child: Column(
                    children: <Widget>[
                      ButtonsTabBar(
                        controller: tabController,
                        backgroundColor:  MyCustomColor().mMainColor(),
                        unselectedBackgroundColor: boxColor,
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
                        unselectedBorderColor: boxColor,
                        contentPadding: const EdgeInsets.only(top: 3,bottom: 3,left: 30,right: 30),
                        buttonMargin: const EdgeInsets.symmetric(horizontal: 20),
                        radius: 50,
                        tabs:   const [
                          Tab(text: 'Daily'),
                          Tab(text: 'Weekly'),
                          Tab(text: 'Monthly'),
                          Tab(text: 'Yearly'),
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
              height: appHeight *2.8 /1.5 , width: double.maxFinite,
              child:  TabBarView(
                controller: tabController,
                children: const [
                  DailyTabView(),
                  WeeklyTabView(),
                  MonthlyTabView(),
                  YearlyTabView()
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

/// >>>>>>> Daily Tab View <<<<<<
class DailyTabView extends StatelessWidget {
  const DailyTabView({super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const TrackerWater()));
                  },
                  child: Container(
                    height: appHeight/1.5, width: appWidth,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/articles/water-intake.png'),
                      fit: BoxFit.fitHeight
                      )
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> const TrackerSleep()));
                      },
                      child: Container(
                        height: appHeight/3.3, width: appWidth,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/articles/sleep.png'),
                                fit: BoxFit.fitHeight
                            )
                        ),
                      ),
                    ),
                    Container(
                      height: appHeight/3, width: appWidth,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/articles/mood.png'),
                              fit: BoxFit.fitHeight
                          )
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> const FeedingTracker()));

          },
          child: Container(
            height: appHeight/2.7, width: appWidth,
            margin: const EdgeInsets.only(top: 40,right: 30),
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/articles/graph-01.png'),
              fit: BoxFit.fitHeight
              )
            ),
          ),
        )
      ],
    );
  }
}

/// >>>>>>> Weekly Tab View <<<<<<
class WeeklyTabView extends StatelessWidget {
  const WeeklyTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// >>>>>>> Monthly Tab View <<<<<<
class MonthlyTabView extends StatelessWidget {
  const MonthlyTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// >>>>>>> Yearly Tab View <<<<<<
class YearlyTabView extends StatelessWidget {
  const YearlyTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
