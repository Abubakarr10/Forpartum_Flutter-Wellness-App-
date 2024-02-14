import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

class GentleMovementClassesDetail extends StatefulWidget {
  const GentleMovementClassesDetail({super.key});

  @override
  State<GentleMovementClassesDetail> createState() => _GentleMovementClassesDetailState();
}

class _GentleMovementClassesDetailState extends State<GentleMovementClassesDetail> {

  List<String> videoTitles = [
    'Exercises 01', 'Exercises 02', 'Exercises 03', 'Exercises 04', 'Exercises 05',
  ];

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

            /// ======= Video Media Player with Info =======
            Stack(
              children: [
                Container(
                  height: 250, width: double.maxFinite,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/articles/tumbnail.png'),
                    fit: BoxFit.cover)
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 26,width: 6,
                          margin: const EdgeInsets.only(top: 40,right: 30),
                          decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/icons/more.png'),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 60,width: 60,
                          decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/icons/play.png'),
                            fit: BoxFit.cover
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 160, width: appWidth,
                  margin: const EdgeInsets.only(top: 210),
                  decoration: BoxDecoration(
                    color: backgroundColor.withOpacity(0.6),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30,top: 10,right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 20),
                          child: TextStyleHelper().mytext('Warm up', 22, FontWeight.w600, textColor),
                        ),
                        TextStyleHelper().mytext('Warm up properly before exercising to prevent'
                          'injury and make your workouts more effective.', 12, FontWeight.w500, Colors.grey),
                        Row(
                          children: [
                            Container(
                              height: 35, width: 110,
                              margin: const EdgeInsets.only(top: 30),
                              decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    color: MyCustomColor().mMainColor(),
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 18, width: 18,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(image: AssetImage('assets/icons/clock.png'))
                                      ),
                                    ),
                                    TextStyleHelper().mytext('10.00 mins', 12, FontWeight.w500, MyCustomColor().mMainColor())
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 35, width: 110,
                              margin: const EdgeInsets.only(top: 30,left: 10),
                              decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    color: MyCustomColor().mMainColor(),
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextStyleHelper().mytext('Yoga', 12, FontWeight.w500, MyCustomColor().mMainColor())
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

            /// ====== Exercises =======
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext('Exercises', 22, FontWeight.w600, textColor)),
            ),

            /// ===== Video Boxes =====
            Wrap(
              children: List.generate(5, (index) {
                return VideoBox(title: videoTitles[index]);
              }),
            ),

            const SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}

class VideoBox extends StatelessWidget {
  final String title;
  const VideoBox({super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 90, width: appWidth,
      margin: const EdgeInsets.only(left: 30,right: 30,top: 20),
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 20, offset: const Offset(0, 4)
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 60, width: 75,
                  decoration: BoxDecoration(
                      color: MyCustomColor().mSecondaryColor(),
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(image: AssetImage('assets/articles/mod04.png'))
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextStyleHelper().mytext(title, 16, FontWeight.w600, textColor),
                      TextStyleHelper().mytext('02.30 Min', 12, FontWeight.w400, Colors.grey)
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 38, width: 38,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/icons/play.png'),
                      fit: BoxFit.cover
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
