import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

import '../Gentle Movement Pod/scheduleClass.dart';
import '../My Pofile Pages/Notifications/notifications_screen.dart';

class TrackerWater extends StatefulWidget {
  const TrackerWater({super.key});

  @override
  State<TrackerWater> createState() => _TrackerWaterState();
}

class _TrackerWaterState extends State<TrackerWater> {
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
                    'Water',
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

            Padding(
              padding: const EdgeInsets.only(top: 30,left: 50,right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextStyleHelper().mytext('Today you took ', 20, FontWeight.w500, textColor),
                  TextStyleHelper().mytext('2.5 ', 20, FontWeight.w500, MyCustomColor().mMainColor()),
                  TextStyleHelper().mytext('ltr of water', 20, FontWeight.w500, textColor),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    height: appHeight/1.5, width: appWidth,
                    margin: const EdgeInsets.only(left: 30,top: 30,),
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/articles/water-intake.png'),
                            fit: BoxFit.fitHeight
                        )
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Stack(
                      children: [
                        Container(
                          height: appHeight/1.8, width: appWidth,
                          decoration:const BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/articles/vertical_meter.png'),
                            fit: BoxFit.fitHeight
                            )
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: appHeight/10, width: appWidth,
                            margin:  EdgeInsets.only(top: appHeight/5),
                            decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/articles/point_meter.png'),
                                fit: BoxFit.fitHeight
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: SizedBox(width: appWidth,))
              ],
            ),

            /// ===== Last Update =====
            Container(
              height: 150, width: appWidth,
              margin: const EdgeInsets.only(left: 30,right: 30,top: 30),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(
                  color: MyCustomColor().mSecondaryColor().withOpacity(0.3),
                  blurRadius: 40, offset: const Offset(0, 10),
                )]
              ),
              child: Padding(
                padding:  const EdgeInsets.only(top: 20,left: 20,right: 20),
                child: Column(
                  children: [
                    TextStyleHelper().mytext('Last Update', 16, FontWeight.w500, textColor),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextStyleHelper().mytext('Water', 16, FontWeight.w500, textColor),
                        TextStyleHelper().mytext('50 ml', 16, FontWeight.w500, textColor),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(thickness: 1.5,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextStyleHelper().mytext('Juice', 16, FontWeight.w500, textColor),
                        TextStyleHelper().mytext('100 ml', 16, FontWeight.w500, textColor),
                      ],
                    )
                  ],
                ),
              ),
            ),

            /// ===== - Water Glass + ======
            Padding(
              padding: const EdgeInsets.only(top: 40,left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50, width: 50,
                    margin: const EdgeInsets.only(right: 30),
                    decoration: BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: TextStyleHelper().mytext('-', 35, FontWeight.bold, textColor)),
                  ),
                  Container(
                    height: 75, width: 77,
                    decoration:  BoxDecoration(
                      color: boxColor,
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(image: AssetImage('assets/icons/water.png'))
                    ),
                  ),
                  Container(
                    height: 50, width: 50,
                    margin: const EdgeInsets.only(left: 30),
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/icons/add.png'))
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 40),
              child: RoundButton(
                  text: 'Confirm',
                  textColor: Colors.white,
                  backgroundColor: MyCustomColor().mMainColor(), borderColor: MyCustomColor().mMainColor(),
                  height: 60, width: appWidth,
                  radius: 100,
                  onClick: (){

                  }),
            )
          ],
        ),
      ),
    );
  }
}
