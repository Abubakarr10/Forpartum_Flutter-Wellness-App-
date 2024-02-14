import 'package:flutter/material.dart';

import '../../../helper/mycustombutton.dart';
import '../../../helper/mycustomcolor.dart';
import '../../../helper/textStyleHelper.dart';

class PumpingFeedingTracker extends StatefulWidget {
  const PumpingFeedingTracker({super.key});

  @override
  State<PumpingFeedingTracker> createState() => _PumpingFeedingTrackerState();
}

class _PumpingFeedingTrackerState extends State<PumpingFeedingTracker> {
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
                            TextStyleHelper().mytext('Pumping', 16, FontWeight.w500, textColor),
                            const SizedBox(height: 8,),
                            TextStyleHelper().mytext('Tap Left or Right to start pumping',
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(width: 30,),
                                  TextStyleHelper().mytext('LEFT', 16, FontWeight.w500, Colors.grey),
                                  const SizedBox(width: 50,),
                                  TextStyleHelper().mytext('RIGHT', 16, FontWeight.w500, Colors.grey),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextStyleHelper().mytext('OZ', 14, FontWeight.w500, textColor),
                                  const SizedBox(width: 10,),
                                  SmallButton(title: '4oz',
                                      textColor: textColor,
                                      backgroundColor: backgroundColor,
                                      borderColor: Colors.grey),
                                  const SizedBox(width: 10,),
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
                                  const SizedBox(width: 10,),
                                  SmallButton(title: '10:40 am',
                                      textColor: textColor,
                                      backgroundColor: backgroundColor,
                                      borderColor: Colors.grey),
                                  const SizedBox(width: 10,),
                                  SmallButton(title: '10:40 am',
                                      textColor: textColor,
                                      backgroundColor: backgroundColor,
                                      borderColor: Colors.grey),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextStyleHelper().mytext('Day', 14, FontWeight.w500, textColor),
                                  const SizedBox(width: 10,),

                                  SmallButton(title: 'Today',
                                      textColor: textColor,
                                      backgroundColor: backgroundColor,
                                      borderColor: Colors.grey),
                                  const SizedBox(width: 10,),
                                  SmallButton(title: 'Today',
                                      textColor: textColor,
                                      backgroundColor: backgroundColor,
                                      borderColor: Colors.grey)
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: 200, width: 100,
                            decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/articles/pump.png'),
                                    fit: BoxFit.fitHeight
                                )
                            ),
                          ),
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

class SmallButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;

  const SmallButton({super.key,
    required this.title, required this.textColor, required this.backgroundColor,
    required this.borderColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40, width: 80,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: borderColor
          )
      ),
      child: Align(
          alignment: Alignment.center,
          child: TextStyleHelper().mytext(title, 14, FontWeight.w500, textColor)),
    );
  }
}
