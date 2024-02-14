import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/navigator_bottom_bar.dart';

import '../../../helper/mycustomcolor.dart';
import '../../My Pofile Pages/Notifications/notifications_screen.dart';
import 'dietPlanDetail_plans.dart';

import 'dietPlan_stats.dart';

class DietPlanDetailScreen extends StatefulWidget {
  const DietPlanDetailScreen({super.key});

  @override
  State<DietPlanDetailScreen> createState() => _DietPlanDetailScreenState();
}

class _DietPlanDetailScreenState extends State<DietPlanDetailScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body:  SingleChildScrollView(
        child: Column(
          children: [

            /// ==== Day 1 Meal Plan
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

            /// ===== Picture Box Diet Plan ======
            Container(
              margin: const EdgeInsets.only(left: 30,top: 20,right: 30),
              height: 290, width: double.maxFinite,
              child: Stack(
                children: [
                  /// ==== box background Image =====
                  Positioned(
                    child: Container(
                      height: 290, width: appWidth,
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
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 40, width: 40,
                                  margin: const EdgeInsets.only(right: 05,top: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: boxColor,
                                  ),
                                  child: Center(
                                    child: AppIcon(iconPath: 'assets/icons/Heart.png',iconSize: 24,)
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
                                    child: Center(
                                        child: AppIcon(iconPath: 'assets/icons/share.png',iconSize: 22,)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                    ),
                  ),
                  Positioned(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 60,
                          width: appWidth,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)
                            ),
                            color: Color(0x99B1AFE9),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20,right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Vegan Meal Plan',style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w600, color: Colors.white,fontFamily: 'Poppins'
                                ),),
                                Text('Day 1',style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w600, color: Colors.white,fontFamily: 'Poppins'
                                ),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// ===== Tab Bar (Stats|Plans)=======
            Container(
              height: 64,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 20, bottom: 10),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(50),
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
                  length: 2,
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
                          Tab(text: 'Stats'),
                          Tab(text: 'Plans'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// ===== Tab Bar View
            Column(
              children: [
                SizedBox(
                  height: appHeight*2.4,
                  width: double.maxFinite,
                  child: TabBarView(
                      controller: tabController,
                      children:  const [
                        DietPlanStats(),
                        DietPlanDetailPlans()
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
