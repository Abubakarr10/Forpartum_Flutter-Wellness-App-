import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';


class BreastFeedingTracker extends StatefulWidget {
  const BreastFeedingTracker({super.key});

  @override
  State<BreastFeedingTracker> createState() => _BreastFeedingTrackerState();
}

class _BreastFeedingTrackerState extends State<BreastFeedingTracker> {
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

                  /// ===== Breast Feeding Text ====
                  Padding(
                    padding: const EdgeInsets.only(left: 30,top: 40,bottom: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextStyleHelper().mytext('Breast Feeding', 16, FontWeight.w500, textColor),
                            const SizedBox(height: 8,),
                            TextStyleHelper().mytext('Tap Left or Right button to start breastfeeding',
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
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Nipple(position: 'LEFT'),
                              Nipple(position: 'RIGHT')
                            ],
                          ),
                          const SizedBox(height: 30,),
                          TextStyleHelper().mytext('TOTAL', 14, FontWeight.w500, Colors.grey),
                          const SizedBox(height: 10,),
                          TextStyleHelper().mytext('01:45', 22, FontWeight.w600, textColor),
                        ],
                      ),
                    ),
                  ),

                  /// ===== Stop Timer Button ====
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 20),
                    child: RoundButton(
                        text: 'STOP TIMER',
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

class Nipple extends StatelessWidget {
  final String position;
  const Nipple({super.key,
    required this.position
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        TextStyleHelper().mytext(position, 14, FontWeight.w500, Colors.grey),
        const SizedBox(height: 20,),
        Container(
          height: 80, width: 80,
          decoration: BoxDecoration(
              color: MyCustomColor().mSecondaryColor().withOpacity(0.6),
              borderRadius: BorderRadius.circular(100)
          ),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 13, width: 13,
              decoration: BoxDecoration(
                  color: MyCustomColor().mMainColor(),
                  borderRadius: BorderRadius.circular(100)
              ),
            ),
          ),
        ),
        const SizedBox(height: 30,),
        TextStyleHelper().mytext('00:00', 16, FontWeight.w500, textColor),
      ],
    );
  }
}
