
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Dashboasd%20Pages/milestone_tracker.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

import 'dashboard_weeklyUpdates.dart';

class DashboardWeekly extends StatefulWidget {
  const DashboardWeekly({super.key});

  @override
  State<DashboardWeekly> createState() => _DashboardWeeklyState();
}

class _DashboardWeeklyState extends State<DashboardWeekly> with TickerProviderStateMixin{

 var details = {
   "Vaginal Birth Recovery" : "Expect bleeding",
   "Nutrition" : "The first month is the most crucial\nin your breast feeding journey.",
   "Hormones" : "The first month is the most crucial\nin your breast feeding journey",
   "Sleep & Rest" : "The first month is the most crucial\nin your breast feeding journey.",
   "Postpartum Body Changes" : "The first month is the most crucial\nin your breast feeding journey",
   "Nursing Basic" : "The first month is the most crucial\nin your breast feeding journey.",
 };

 List<String> groupIcons = [
   'assets/icons/Group81.png','assets/icons/Group82.png','assets/icons/Group83.png',
   'assets/icons/Group84.png','assets/icons/Group85.png','assets/icons/Group86.png'
 ];

 List<String> articleBoxImages = [
   'assets/articles/05.png', 'assets/articles/06.png','assets/articles/04.png',
 ];

  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    TabController tabController = TabController(length: 2, vsync: this);
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ===== Week View =====
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
                 Column(
                   children: [
                     Padding(
                         padding: const EdgeInsets.only(top: 40),
                         child: TextStyleHelper().mytext('Week 01', 20, FontWeight.w600, textColor)
                     ),
                     Padding(
                         padding: const EdgeInsets.only(top: 5),
                         child: TextStyleHelper().mytext('Jun 09-15', 12, FontWeight.w500, Colors.grey)
                     ),
                   ],
                 ),
                Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                    alignment: AlignmentDirectional.topEnd,
                    child: Image.asset('assets/images/next_image.png')),
              ],
            ),
            const SizedBox(height: 20,),

            /// ===== Body Meter ====
            Stack(
              children: [
                Positioned(
                    child: Container(
                      height: 400,
                      width: appWidth,
                      decoration:  BoxDecoration(
                        color: Colors.grey.shade50,
                        image:  const DecorationImage(
                            image: AssetImage('assets/images/body.png'),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                ),
                Positioned(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ///>>> Blue meter
                            Expanded(
                              flex: 6,
                              child: Container(
                                height: 15,
                                width: appWidth/2,
                                margin: const EdgeInsets.only(left: 30,top: 10),
                                decoration:  BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 2
                                      )
                                    ],
                                    color: Colors.blue.shade200,
                                  borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(30),
                                  )
                                ),
                              ),
                            ),
                            /// >>> EmptyMeter
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: 15,
                                width: appWidth/2.4,
                                margin: const EdgeInsets.only(right: 30,top: 10),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 2
                                    )
                                  ],
                                  borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(30)
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        TextStyleHelper().mytext('You’re in 4 tht trimester', 12, FontWeight.w600, Colors.black),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 15,width: 15,
                              margin: const EdgeInsets.only(top: 175),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                        color: MyCustomColor().mMainColor(),
                                        blurRadius: 4
                                    )
                                  ],
                                image: const DecorationImage(image: AssetImage('assets/images/point.png'))
                              ),
                            ),
                            Container(
                              height: 15,width: 15,
                              margin: const EdgeInsets.only(top: 72),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                        color: MyCustomColor().mMainColor(),
                                        blurRadius: 4
                                    )
                                  ],
                                  image: const DecorationImage(image: AssetImage('assets/images/point.png'))
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                )
              ],
            ),

            /// ==== Days of Postpartum =====
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Container(
                      height: 22,
                      width: 22,
                      margin: const EdgeInsets.only(top: 20, left: 40, right: 20),
                      alignment: AlignmentDirectional.center,
                      decoration:  BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.6),
                            blurRadius: 40,
                            spreadRadius: 4,
                          )
                        ]
                      ),
                      child: Image.asset('assets/images/point.png')),
                  const SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextStyleHelper().mytext('1 day postpartum', 18, FontWeight.w600, MyCustomColor().mMainColor()),
                        const SizedBox(height: 5,),
                        TextStyleHelper().mytext('Your uterus is the size of', 12, FontWeight.w400, Colors.grey),
                        const SizedBox(height: 5,),
                        TextStyleHelper().mytext('Dinner plate', 14, FontWeight.w600, textColor)
                      ],
                    ),
                  )
                ],
              ),
            ),

            /// ===== Tab Bar (Insight|Tracker) =====
            Container(
              height: 60,
              width: appWidth,
              margin: const EdgeInsets.only(top: 20,bottom: 20),
              color: boxColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(title: "Insights", textColor: Colors.white, backgroundColor: MyCustomColor().mMainColor(),
                      borderColor: MyCustomColor().mMainColor(),
                  height: 40, width: 150, textSize: 16,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const DbMilestoneTrackerScreen()));
                    },
                    child: CustomButton(title: "Tracker", textColor: Colors.grey, backgroundColor: boxColor,
                        borderColor: Colors.grey,
                      height: 40, width: 150, textSize: 16,
                    ),
                  )

                ],
              ),
            ),

            /// ===== Meter checking ====
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 15,
                          width: appWidth/2 * 0.4,
                          margin: const EdgeInsets.only(top: 10),
                          decoration:  BoxDecoration(
                              color: Colors.blue.shade200,
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(30),
                              )
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          height: 15,
                          width: appWidth/1.5,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(30)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextStyleHelper().mytext('What to expect', 12, FontWeight.w600, textColor),
                    TextStyleHelper().mytext('Symptoms', 12, FontWeight.w600, Colors.grey),
                    TextStyleHelper().mytext('Sleep', 12, FontWeight.w600, Colors.grey),
                    TextStyleHelper().mytext('Movement', 12, FontWeight.w600, Colors.grey)
                  ],
                )
              ],
            ),

            /// ===== What to expect ====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext('What to Expect', 22, FontWeight.w600, textColor)),
            ),
            Wrap(
              children: List.generate(6, (index) {
                return Container(
                  height: 100,
                  width: appWidth,
                  margin: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: boxColor
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: 60,
                          width: 60,
                          margin: const EdgeInsets.only(top: 20, left: 20, right: 20,bottom: 20),
                          alignment: AlignmentDirectional.center,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(image: AssetImage(groupIcons[index]))
                          ),
                      ),
                      const SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextStyleHelper().mytext(details.keys.elementAt(index), 14, FontWeight.w600, textColor),
                            const SizedBox(height: 8,),
                            TextStyleHelper().mytext(details.values.elementAt(index), 12, FontWeight.w600, Colors.grey)
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),

            /// ==== Articles for you
            Padding(
              padding: const EdgeInsets.only(left: 30,bottom: 20,top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextStyleHelper().mytext('Jun 11', 12, FontWeight.w600, MyCustomColor().mMainColor())),
                  const SizedBox(height: 10,),
                  TextStyleHelper().mytext('Articles For you', 22, FontWeight.w600, textColor)
                ],
              ),
            ),

           Wrap(
             children: List.generate(3, (index) {
               return InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> const DbWeeklyUpdatesScreen()));
                   },
                 child:  ArticleBox02(heading: 'Glow Healthy Library', title: '4 Weeks and 2 Days', subTitle: "While you're busy coming to\n"
                     "terms with being pregnant th", image: articleBoxImages[index],),
               );
             }),
           ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

class ArticleBox02 extends StatelessWidget {
  final String heading;
  final String title;
  final String subTitle;
  final String image;
  const ArticleBox02({super.key,
    required this.heading,
    required this.title,
    required this.subTitle,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;return Container(
      height: 110,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.only(left: 20),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:  DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextStyleHelper().mytext(heading, 12, FontWeight.w400, Colors.grey),
              const SizedBox(height: 10,),
              TextStyleHelper().mytext(title, 14, FontWeight.w600, textColor),
              const SizedBox(height: 10,),
              TextStyleHelper().mytext(subTitle, 12, FontWeight.w400, Colors.grey)
            ],
          )
        ],
      ),
    );
  }
}