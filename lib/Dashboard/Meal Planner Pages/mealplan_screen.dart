import "package:buttons_tabbar/buttons_tabbar.dart";
import "package:flutter/material.dart";
import "package:forpartum/Dashboard/Meal%20Planner%20Pages/mealplan_guide.dart";
import "package:forpartum/Dashboard/Meal%20Planner%20Pages/mealplan_suggestions.dart";
import "package:forpartum/Dashboard/Meal%20Planner%20Pages/mealplan_detailScreen.dart";

import "../../helper/mycustomcolor.dart";
import "../../helper/textStyleHelper.dart";
import "../My Pofile Pages/Notifications/notifications_screen.dart";

/// >>>>>> Meal Plan Screen 01 <<<<<
class MealPlanScreen extends StatefulWidget {
  const MealPlanScreen({Key? key}) : super(key: key);

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen>
    with TickerProviderStateMixin {
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
                      child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Image.asset('assets/images/back_image.png'))),
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

            /// ===== Tab Bar (Recipes | Guidelines | Suggestions) =====
            Container(
              height: 60,
              width: appWidth,
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 20, bottom: 20),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: boxColor,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
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
                            fontSize: 16),
                        unselectedLabelStyle: TextStyle(
                            color: MyCustomColor().mMainColor(),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                        unselectedBorderColor: boxColor,
                        contentPadding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                        buttonMargin: const EdgeInsets.symmetric(horizontal: 20),
                        radius: 100,
                        tabs: const [
                          Tab(text: 'Recipes'),
                          Tab(text: 'Guidelines'),
                          Tab(text: 'Suggestions')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// ===== Tab Bar View ====
            Column(
              children: [
                SizedBox(
                  height: appHeight * 1.25,
                  width: double.maxFinite,
                  child: TabBarView(
                      controller: tabController,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              /// ===== Food Recipes for you =====
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 30, top: 20),
                                      child: TextStyleHelper().mytext("Food Recipes For You", 18,
                                          FontWeight.w500, textColor))),
                              Wrap(
                                children: List.generate(4, (index) {
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const MealPlanDetailScreen(),
                                          ));
                                    },
                                    child: BoxesRow(
                                        title: 'Ut enim ad minim veniam, quis nostrud',
                                        image: "assets/images/Veganism.jpg",
                                        likes: '10.5k',
                                        title2: 'Ut enim ad minim veniam, quis nostrud',
                                        image2: "assets/images/Vegan.jpg",
                                        likes2: '18k'),
                                  );
                                }),
                              ),
                              const SizedBox(height: 40,)
                            ],
                          ),
                        ),
                        const MealPlanGuidelines(),
                        const MealPlanSuggestions()
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

/// >>> Custom Row for Two Boxes
class BoxesRow extends StatelessWidget {
  String? title;
  String? likes;
  String? image;
  // for box two
  String? title2;
  String? likes2;
  String? image2;
  BoxesRow(
      {super.key,
      required this.title,
      required this.image,
      required this.likes,
      required this.title2,
      required this.image2,
      required this.likes2});

  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// ===== Image Box 01=====
        Expanded(
          flex: 5,
          child: Container(
            height: 250,
            width: appWidth,
            margin: const EdgeInsets.only(top: 20, left: 30,right: 10),
            decoration: BoxDecoration(
                boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 30,
                offset: const Offset(0, 8),
              )
            ]),
            child: Column(
              children: [
                /// ==== Image Box =====
                Container(
                  height: 150,
                  width: appWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image!), fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                ),

                /// ===== Text Box 01 =====
                Container(
                  height: 100,
                  width: appWidth,
                  color: boxColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,top: 10,right: 20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                            child: TextStyleHelper().mytext(title!, 12, FontWeight.w600, textColor)),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Center(
                              child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    Color(0XFF7B6F72), // Change this color to the desired color
                                    BlendMode.srcIn,
                                  ),
                                  child: ImageIcon(AssetImage('assets/icons/Heart.png'),size: 24,)),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            TextStyleHelper().mytext(
                                likes!, 14, FontWeight.w500, const Color(0XFF7B6F72))
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        // ===== Text Box 02 =====
        Expanded(
          flex: 5,
          child: Container(
            height: 250,
            width: appWidth,
            margin: const EdgeInsets.only(top: 20, right: 30,left: 10),
            decoration: BoxDecoration(
                boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 30,
                offset: const Offset(0, 8),
              )
            ]),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: appWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image2!), fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                ),

                /// ===== Text Box 02=====
                Container(
                  height: 100,
                  width: appWidth,
                  color: boxColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: TextStyleHelper().mytext(title2!, 12, FontWeight.w600, textColor)),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Center(
                              child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    Color(0XFF7B6F72),
                                    BlendMode.srcIn,
                                  ),
                                  child: ImageIcon(AssetImage('assets/icons/Heart.png'),size: 24,)),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            TextStyleHelper().mytext(
                                likes2!, 14, FontWeight.w500, const Color(0XFF7B6F72))
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
