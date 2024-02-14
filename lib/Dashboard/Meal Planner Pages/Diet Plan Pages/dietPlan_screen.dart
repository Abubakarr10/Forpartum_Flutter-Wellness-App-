import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../../../helper/mycustomcolor.dart';

import '../../My Pofile Pages/Notifications/notifications_screen.dart';
import '../../navigator_bottom_bar.dart';
import 'dietPlanDetail_screen.dart';
import 'dietPlan_info.dart';
import 'dietPlan_stats.dart';

class DietPlanScreen extends StatefulWidget {
  const DietPlanScreen({super.key});

  @override
  State<DietPlanScreen> createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      backgroundColor: backgroundColor,
      body:
      /// ===== Top Bar =====
      SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                    alignment: AlignmentDirectional.topEnd,
                    child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/images/back_image.png'))),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    'Day 1 Meal Plan',
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
                      child: Image.asset('assets/icons/active_notification.png')),
                ),
              ],
            ),

            /// ===== Slide Menu Diet Planes =====
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20,top: 20),
                  height: 290, width: double.maxFinite,
                  child:  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          /// ==== box background Image =====
                          Positioned(
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                const DietPlanDetailScreen()));
                                },
                              child: Container(
                                margin: const EdgeInsets.only(right: 15),
                                height: 290, width: 315,
                                decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image:  const DecorationImage(
                                      image: AssetImage("assets/images/Vegan.jpg"),
                                      fit: BoxFit.cover
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 200),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10,),
                                    Container(
                                      height: 40, width: 40,
                                      margin: const EdgeInsets.only(right: 05,top: 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: boxColor,
                                      ),
                                      child:  Center(
                                        child: Center(
                                            child: AppIcon(iconPath: 'assets/icons/Heart.png',iconSize: 24,)
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40, width: 40,
                                      margin: const EdgeInsets.only(top: 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: boxColor,
                                      ),
                                      child: Center(
                                          child: AppIcon(iconPath: 'assets/icons/share.png',iconSize: 22,)
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Positioned(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 60,
                                  width: 315,
                                  decoration: const BoxDecoration(
                                   borderRadius: BorderRadius.only(
                                     bottomLeft: Radius.circular(20),
                                     bottomRight: Radius.circular(20)
                                   ),
                                    color: Color(0x99B1AFE9),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                        child: Text('Vegan Meal Plan',style: TextStyle(
                                          fontSize: 18,fontWeight: FontWeight.w600, color: Colors.white,fontFamily: 'Poppins'
                                        ),)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// ===== Tab bar (Overview|Stats|Info) ======
            Container(
              height: 64,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(99),
                border: Border.all(
                  color: boxColor,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: <Widget>[
                      ButtonsTabBar(
                        controller: tabController,
                        backgroundColor: MyCustomColor().mMainColor(),
                        unselectedBackgroundColor: boxColor,
                        labelStyle: const TextStyle(
                            color: Colors.white, //Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        unselectedLabelStyle: TextStyle(
                            color: MyCustomColor().mMainColor(),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        unselectedBorderColor: boxColor,
                        contentPadding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                        buttonMargin:
                        const EdgeInsets.symmetric(horizontal: 20),
                        radius: 100,
                        tabs: const [
                          Tab(text: 'Overview'),
                          Tab(text: 'Stats'),
                          Tab(text: 'Info'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// ==== Tab bar View ====
            Column(
              children: [
                SizedBox(
                  height: appHeight/2,
                  width: double.maxFinite,
                  child: TabBarView(
                      controller: tabController,
                      children:  [
                        Padding(
                          padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom:10),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom:10),
                                child: Text('Nemo enim ipsam voluptatem quia voluptas sit'
                                    'aspernatur aut odit aut fugit, sed quia consequun'
                                    'ma Neque porro quisquam est, qui dolorem ipsu'
                                    'quia dolor sit amet, consectetur, adipisci velit,'
                                    'sed qu Nemo enim ipsam voluptatem quia'
                                    'voluptas sit aspernatur aut odit aut fugit, sed'
                                    'quia consequuntur ma Neque porro quisquam'
                                    'est, qui dolorem ipsum quia dolor sit amet,'
                                    'consectetur, adipisci velit, sed qu',style:
                                  TextStyle(
                                    fontFamily: 'Poppins',fontWeight: FontWeight.w500,
                                    fontSize: 12, color: Colors.grey, letterSpacing:1.2
                                  ),),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Read More",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: MyCustomColor().mMainColor(),
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          ),
                        ),
                        const DietPlanStats(),
                         DietPlanInfo()
                      ]
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
