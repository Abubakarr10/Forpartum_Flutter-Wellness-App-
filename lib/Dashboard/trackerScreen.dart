import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Tracker%20Pages/Feeding%20Tracker/feedingTracer.dart';
import 'package:forpartum/Dashboard/Tracker%20Pages/tracker_dashboard.dart';
import 'package:forpartum/Dashboard/navigator_bottom_bar.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

import 'Dashboasd Pages/Resources/resourcesPage.dart';
import 'My Pofile Pages/Notifications/notifications_screen.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({Key? key}) : super(key: key);

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    double sliderValue = 0.0;
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
                  child: Align(
                    alignment: Alignment.center,
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
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationScreen()));
                  },
                  child: Container(
                      height: 43,
                      width: 43,
                      margin: const EdgeInsets.only(top: 35, left: 20, right: 20),
                      child: Image.asset('assets/icons/check.png',
                      fit: BoxFit.contain,)),
                ),
              ],
            ),

            /// ==== Box =====
            Container(
              height: 150,width: appWidth,
              margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
              decoration: BoxDecoration(
                color: MyCustomColor().mSecondaryColor(),
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(image: AssetImage('assets/articles/bubbleDots.png'),
                fit: BoxFit.fitWidth,
                ),
                boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 40, offset: const Offset(0,10),
                )]
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const TrackerDashboard()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextStyleHelper().mytext('June, 10th', 12, FontWeight.w400, Colors.white),
                      const SizedBox(height: 20,),
                      TextStyleHelper().mytext('HOW ARE YOU ', 24, FontWeight.w400, Colors.white),
                      Padding(
                        padding: const EdgeInsets.only(right: 140),
                        child: TextStyleHelper().mytext('DOING RIGHT NOW?', 24, FontWeight.w600, Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// ===== Slider =====
            Container(
              height: 10, width: appWidth,
              margin: const EdgeInsets.only(left: 30,right: 30,bottom: 30),
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/articles/scroller03.png'),
                fit: BoxFit.fitWidth
                )
              ),
            ),

            /// ====== Two Buttons ======
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 50, width: appWidth,
                    margin: const EdgeInsets.only(left: 30,right: 20),
                    decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3, offset: const Offset(-3, 6)
                        )]
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> const FeedingTracker()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppIcon(iconPath: 'assets/icons/feeding-bottle.png',iconColor: textColor,),
                          TextStyleHelper().mytext('Feeding Tracker', 14, FontWeight.w700, textColor)
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 50, width: appWidth,
                    margin: const EdgeInsets.only(left: 20,right: 30),
                    decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3, offset: const Offset(3, 6)
                        )]
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>const ResourcesPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppIcon(iconPath: 'assets/icons/Resources.png',iconColor: textColor,
                            iconSize: 24,),
                          TextStyleHelper().mytext('Resources', 14, FontWeight.w700, textColor)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// ==== Mood =======
              Padding(
                padding: const EdgeInsets.only(left: 30,top: 30),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextStyleHelper().mytext('Mood', 20, FontWeight.w600, textColor)),
              ),

            /// ===== Mood Boxes ====
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30,top: 20),
                      child: MoodBox(title: 'Happy', imagePath: 'assets/icons/HAPPY.png'),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left:20, right: 20,top: 20),
                      child: MoodBox(title: 'Confused', imagePath: 'assets/icons/confused.png'),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20,right: 30),
                      child: MoodBox(title: 'Sad', imagePath: 'assets/icons/sad.png'),
                    ))
              ],
            ),

            /// ==== Sleep =======
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 30),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext('Sleep', 20, FontWeight.w600, textColor)),
            ),

            /// ===== Sleep Boxes ====
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30,top: 20),
                      child: MoodBox(title: '3-6 Hrs', imagePath: 'assets/icons/sleep.png'),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left:20, right: 20,top: 20),
                      child: MoodBox(title: '6-8 Hrs', imagePath: 'assets/icons/sleep.png'),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20,right: 30),
                      child: MoodBox(title: '8-10 Hrs', imagePath: 'assets/icons/sleep.png'),
                    ))
              ],
            ),

            /// ==== Symptoms =======
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 30),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext('Symptoms', 20, FontWeight.w600, textColor)),
            ),

            /// ===== Symptoms Boxes ====
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30,top: 20),
                      child: MoodBox(title: 'No Symptoms', imagePath: 'assets/icons/sysmptoms.png'),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left:20, right: 20,top: 20),
                      child: MoodBox(title: 'Breast Pain', imagePath: 'assets/icons/breast_pain.png'),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20,right: 30),
                      child: MoodBox(title: 'Constipation', imagePath: 'assets/icons/constipation.png'),
                    ))
              ],
            ),

            /// ==== Lochia =======
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 30),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext('Lochia', 20, FontWeight.w600, textColor)),
            ),

            /// ===== Lochia Boxes ====
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30,top: 20),
                      child: MoodBox(title: 'Bad Smelling', imagePath: 'assets/icons/lochia-01.png'),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left:20, right: 20,top: 20),
                      child: MoodBox(title: 'Clots', imagePath: 'assets/icons/lochia.png'),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20,right: 30),
                      child: MoodBox(title: 'Brown Pink', imagePath: 'assets/icons/lochia.png'),
                    ))
              ],
            ),

            /// ==== Medication  =======
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 30),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext('Medication ', 20, FontWeight.w600, textColor)),
            ),

            /// ===== Medication  Boxes ====
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30,top: 20),
                      child: MoodBox(title: 'Meds', imagePath: 'assets/icons/meditation.png'),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left:20, right: 20,top: 20),
                      child: SizedBox(width: appWidth,)
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20,right: 30),
                      child: SizedBox(width: appWidth,)
                    ))
              ],
            ),

            const SizedBox(height: 40,),

          ],
        ),
      ),
    );
  }
}

class MoodBox extends StatelessWidget {
 final String title;
 final String imagePath;
  const MoodBox({super.key,
    required this.title, required this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 115, width: appWidth,
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60, width: 60,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imagePath))
            ),
          ),
          const SizedBox(height: 10,),
          TextStyleHelper().mytext(title, 12, FontWeight.w500, textColor),
        ],
      ),

    );
  }
}
