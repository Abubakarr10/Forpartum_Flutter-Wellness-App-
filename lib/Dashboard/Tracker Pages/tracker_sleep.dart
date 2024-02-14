import "package:flutter/material.dart";

import "../Gentle Movement Pod/scheduleClass.dart";
import "../My Pofile Pages/Notifications/notifications_screen.dart";

class TrackerSleep extends StatefulWidget {
  const TrackerSleep({super.key});

  @override
  State<TrackerSleep> createState() => _TrackerSleepState();
}

class _TrackerSleepState extends State<TrackerSleep> {
  @override
  Widget build(BuildContext context) {
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
                    'Sleep',
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

            /// ===== Sleep Tracker =====
            Container(
              height: appHeight/1.2, width: appWidth,
              margin: const EdgeInsets.only(left: 30,right: 30,top: 40),
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/articles/sleep-graph.png'),
                      fit: BoxFit.fitHeight
                  )
              ),
            ),

            /// ===== Alarm =====
            Container(
              height: appHeight/2, width: appWidth,
              margin: const EdgeInsets.only(left: 30,right: 30,),
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/articles/timeslot.png'),
                      fit: BoxFit.fitHeight
                  )
              ),
            ),

            /// ===== Sleep Graph =====
            Container(
              height: appHeight/2.5, width: appWidth,
              margin: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 40),
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/articles/graph-02.png'),
                      fit: BoxFit.fitHeight
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
