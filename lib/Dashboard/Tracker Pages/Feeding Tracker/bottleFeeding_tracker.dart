import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Tracker%20Pages/Feeding%20Tracker/pumpingFeeding_tracker.dart';

import '../../../helper/mycustombutton.dart';
import '../../../helper/mycustomcolor.dart';
import '../../../helper/textStyleHelper.dart';

class BottleFeedingTracker extends StatefulWidget {
  const BottleFeedingTracker({super.key});

  @override
  State<BottleFeedingTracker> createState() => _BottleFeedingTrackerState();
}

class _BottleFeedingTrackerState extends State<BottleFeedingTracker> {
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Breast Feeding Tracker',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(left: 15),
            alignment: AlignmentDirectional.center,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/back_image.png'),
                    fit: BoxFit.fitWidth)
            ),
          ),
        ),

      ),
      body: Stack(
        children: [
          /// ===== Header =====
          Container(
            height: 230,
            width: appWidth,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/articles/waves.png'),
                    fit: BoxFit.fitWidth
                )
            ),
          ),

          /// ===== Main Body ======
          SingleChildScrollView(
            child: Container(
              height: appHeight*1.2/1.1, width: appHeight,
              margin: const EdgeInsets.only(top: 180),
              decoration:  BoxDecoration(
                  color: boxColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)
                  )
              ),
              child: Column(
                children: [
                  TextStyleHelper().mytext('____', 30, FontWeight.bold, Colors.grey),

                  /// ===== Bottle Feeding Text ====
                  Padding(
                    padding: const EdgeInsets.only(left: 30,top: 40,bottom: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextStyleHelper().mytext('Bottle Feeding', 16, FontWeight.w500, textColor),
                            const SizedBox(height: 8,),
                            TextStyleHelper().mytext('Tap Left or Right button to start bottle feeding',
                                12, FontWeight.w400, Colors.grey),
                          ],
                        )),
                  ),

                  /// ===== Time Monitoring =====
                  Container(
                    height: 330, width: appWidth,
                    margin: const EdgeInsets.only(left: 30,right: 30,top: 40),
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 230, width: 100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/articles/bottle.png'),
                              fit: BoxFit.fitHeight
                              )
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextStyleHelper().mytext('OZ', 14, FontWeight.w500, textColor),
                                  const SizedBox(width: 35,),
                                  SmallButton(title: '4oz',
                                      textColor: textColor,
                                      backgroundColor: backgroundColor,
                                      borderColor: Colors.grey)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextStyleHelper().mytext('Time', 14, FontWeight.w500, textColor),
                                  const SizedBox(width: 30,),
                                  SmallButton(title: '10:40 am',
                                      textColor: textColor,
                                      backgroundColor: backgroundColor,
                                      borderColor: Colors.grey)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextStyleHelper().mytext('Day', 14, FontWeight.w500, textColor),
                                  const SizedBox(width: 30,),
                                  SmallButton(title: 'Today',
                                      textColor: textColor,
                                      backgroundColor: backgroundColor,
                                      borderColor: Colors.grey)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  /// ===== Stop Timer Button ====
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 20),
                    child: RoundButton(
                        text: 'FINISHED',
                        textColor: Colors.white,
                        backgroundColor: MyCustomColor().mMainColor(), borderColor: MyCustomColor().mMainColor(),
                        height: 50, width: appWidth, radius: 100,
                        onClick: (){}),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                    child: RoundButton(
                        text: 'RESET',
                        textColor: Colors.grey,
                        backgroundColor: boxColor, borderColor: Colors.grey,
                        height: 50, width: appWidth, radius: 100,
                        onClick: (){}),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
