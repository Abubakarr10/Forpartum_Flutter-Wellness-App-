import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Tracker%20Pages/Feeding%20Tracker/pumpingFeeding_tracker.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

import '../../My Pofile Pages/Notifications/notifications_screen.dart';
import 'bottleFeeding_tracker.dart';
import 'breastFeeding_tracker.dart';

class FeedingTracker extends StatefulWidget {
  const FeedingTracker({super.key});

  @override
  State<FeedingTracker> createState() => _FeedingTrackerState();
}

class _FeedingTrackerState extends State<FeedingTracker> {
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
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
                  'Feeding Tracker',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationScreen()));
                },
                child: Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                    alignment: AlignmentDirectional.topEnd,
                    child: Image.asset('assets/icons/notification.png')),
              ),
            ],
          ),

          /// ==== Options =====
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30,top: 60),
            child: InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> const BreastFeedingTracker()));
              },
              child: Container(
                height: 100,
                width: appWidth,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: MyCustomColor().mMainColor(),
                    width: 3
                  ),
                  boxShadow: [BoxShadow(
                    color: MyCustomColor().mSecondaryColor().withOpacity(0.5),
                    blurRadius: 40, offset: const Offset(0, 10)
                  )]
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: TextStyleHelper().mytext('Breast Feeding Tracker', 25, FontWeight.w500, textColor),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30,top: 60),
            child: InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> const BottleFeedingTracker()));
              },
              child: Container(
                height: 100,
                width: appWidth,
                decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: MyCustomColor().mMainColor(),
                        width: 3
                    ),
                    boxShadow: [BoxShadow(
                        color: MyCustomColor().mSecondaryColor().withOpacity(0.5),
                        blurRadius: 40, offset: const Offset(0, 10)
                    )]
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: TextStyleHelper().mytext('Bottle Feeding Tracker', 25, FontWeight.w500, textColor),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30,top: 60),
            child: InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> const PumpingFeedingTracker()));
              },
              child: Container(
                height: 100,
                width: appWidth,
                decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: MyCustomColor().mMainColor(),
                        width: 3
                    ),
                    boxShadow: [BoxShadow(
                        color: MyCustomColor().mSecondaryColor().withOpacity(0.5),
                        blurRadius: 40, offset: const Offset(0, 10)
                    )]
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: TextStyleHelper().mytext('Pumping Tracker', 25, FontWeight.w500, textColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
