import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Meal%20Planner%20Pages/Diet%20Plan%20Pages/dietPlan_screen.dart';
import 'package:forpartum/Dashboard/Meal%20Planner%20Pages/mealplan_screen.dart';
import 'package:forpartum/Dashboard/My%20Pofile%20Pages/Notifications/notifications_screen.dart';
import 'package:forpartum/helper/mycustomcolor.dart';

import '../helper/textStyleHelper.dart';
import 'Gentle Movement Pod/scheduleClass.dart';

class MealPlannerScreen extends StatefulWidget {
  const MealPlannerScreen({Key? key}) : super(key: key);

  @override
  State<MealPlannerScreen> createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> with TickerProviderStateMixin{

  var images = {
    "Vegan" : "assets/images/d01.png",
    "Vegetarian" : "assets/images/r2.png"  ,
    "Traditional" : "assets/images/r3.png"  ,
    "Paleo Diet" : "assets/images/PaleoDiet.jpg"  ,
    "Veganism" :"assets/images/Veganism.jpg",
  };

  List<String> dietImages = [
    "assets/images/d01.png","assets/images/r2.png",
    "assets/images/r3.png", "assets/images/PaleoDiet.jpg",
    "assets/images/Veganism.jpg"
  ];

  List<String> trendingImages = [
    'assets/images/blueberry.jpg','assets/images/HotChocolate.png',
    'assets/images/dinner.png', 'assets/images/breakfast.png'
  ];

  List<String> trendingTitles = [
    'Lemon curd & blueberry loaf',' Hot Chocolate with\nCinnamon',
    'Cajun Beef with Cilantro\nLime Mayo','Egg Fried with Beard'
  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    TextEditingController searchController = TextEditingController();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [

              /// ===== Header =====
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50,left: 20),
                      child: Text(
                        'Nourishing Meals',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                           // Navigator.push(context,
                            //    MaterialPageRoute(builder: (context)=> const NotificationScreen()));
                          },
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> const ScheduleClasses()));
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              margin: const EdgeInsets.only(top: 40, right: 8),
                              alignment: AlignmentDirectional.center,
                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/icons/calendar.png'))),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> const NotificationScreen()));
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                             margin: const EdgeInsets.only(top: 40,right: 20),
                            alignment: AlignmentDirectional.center,
                            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/icons/notification.png'))),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),

              /// ===== Search Bar =====
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60)
                  ),
                  child:  ListTile(
                    leading: const Icon(Icons.search_outlined,
                    color: Colors.grey,),
                    title: TextField(
                      controller: searchController,
                      cursorColor: MyCustomColor().mMainColor(),
                      decoration: const InputDecoration(
                        hintText: "Search Here...",
                        hintStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,fontFamily: "Poppins"),
                        border: InputBorder.none,
                      ),
                    ),
                    trailing: const SizedBox(
                      height: 40, width: 70,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 10),
                            child: VerticalDivider(),
                          ),
                          Icon(Icons.mic_none_outlined,
                              color: Colors.grey)
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              /// ===== Today's Meal =====
              Padding(
                padding: const EdgeInsets.only(left: 30,top: 20,bottom: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Today's Meal Plan",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              /// ===== Meal Options (Breakfast,lunch,dinner)====
              Container(
                height: 64,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: boxColor,
                  ),
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: <Widget>[
                        ButtonsTabBar(
                          controller: tabController,
                          backgroundColor:  MyCustomColor().mMainColor(),
                          unselectedBackgroundColor: boxColor,
                          labelStyle: const TextStyle(
                            color: Colors.white, //Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                          ),
                          unselectedLabelStyle: TextStyle(
                            color: MyCustomColor().mMainColor(),
                            fontWeight: FontWeight.w500,
                              fontSize: 14
                          ),
                          unselectedBorderColor: boxColor,
                          contentPadding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                          buttonMargin:  EdgeInsets.symmetric(horizontal: appWidth/20),
                          radius: 100,
                          tabs:   const [
                            Tab(text: 'Breakfast'),
                            Tab(text: 'Lunch'),
                            Tab(text: 'Dinner'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30,top: 20),
                    height: 300 , width: double.maxFinite,
                    child:  TabBarView(
                      controller: tabController,
                      children: [
                        /// ===== Breakfast Meals Box =====
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap:(){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const DietPlanScreen()));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    height: 300, width: 315,
                                    decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: boxColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 170, width: 315,
                                          decoration:  BoxDecoration(
                                            image:  const DecorationImage(image: AssetImage("assets/images/breakfast.png"), fit: BoxFit.cover),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            color: boxColor,
                                          ),
                                        ),
                                        SizedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    TextStyleHelper().mytext('Breakfast', 18, FontWeight.w500, textColor),
                                                     Row(
                                                      children: [
                                                        const Icon(Icons.alarm,size: 20,
                                                          color: Colors.grey,),
                                                        const SizedBox(width: 8,),
                                                        TextStyleHelper().mytext('08:00 AM', 12, FontWeight.w500, Colors.grey),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(height: 20,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    TextStyleHelper().myTextButton('Skip'),
                                                    TextStyleHelper().myTextButton('Change'),
                                                    TextStyleHelper().myTextButton('Done'),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        /// ===== Lunch Meals Box =====
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap:(){

                              },
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    height: 300, width: 315,
                                    decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: boxColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 170, width: 315,
                                          decoration:  BoxDecoration(
                                            image:  const DecorationImage(image: AssetImage("assets/images/Vegan.jpg"), fit: BoxFit.cover),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            color: boxColor,
                                          ),
                                        ),
                                        SizedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    TextStyleHelper().mytext('Lunch', 18, FontWeight.w500, textColor),
                                                    Row(
                                                      children: [
                                                        const Icon(Icons.alarm,size: 20,color: Colors.grey,),
                                                        const SizedBox(width: 8,),
                                                        TextStyleHelper().mytext('08:00 AM', 12, FontWeight.w500, Colors.grey),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(height: 20,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    TextStyleHelper().myTextButton('Skip'),
                                                    TextStyleHelper().myTextButton('Change'),
                                                    TextStyleHelper().myTextButton('Done'),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        /// =====  Dinner Meals Box =====
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap:(){

                              },
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    height: 300, width: 315,
                                    decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: boxColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 170, width: 315,
                                          decoration: BoxDecoration(
                                            image:  const DecorationImage(image: AssetImage("assets/images/dinner.png"),
                                                fit: BoxFit.cover),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            color: boxColor,
                                          ),
                                        ),
                                        SizedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    TextStyleHelper().mytext('Dinner', 18, FontWeight.w500, textColor),
                                                    Row(
                                                      children: [
                                                        const Icon(Icons.alarm,size: 20,color: Colors.grey,),
                                                        const SizedBox(width: 8,),
                                                        TextStyleHelper().mytext('08:00 AM', 12, FontWeight.w500, Colors.grey),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(height: 20,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    TextStyleHelper().myTextButton('Skip'),
                                                    TextStyleHelper().myTextButton('Change'),
                                                    TextStyleHelper().myTextButton('Done'),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),

                  /// ===== Diet Category =====
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextStyleHelper().mytext("Diet Category", 18, FontWeight.w500, textColor),
                              InkWell(
                                  onTap: (){

                                  },
                                  child: TextStyleHelper().mytext("View All", 12, FontWeight.w500, MyCustomColor().mMainColor())),
                            ],
                          )
                      )),
                  Container(
                    height: 89, width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 30),
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index){
                          return Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Column(
                              children: [
                                Container(
                                  //margin: const EdgeInsets.only(right: 65),
                                  height: 65, width: 65,
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image:  DecorationImage(
                                        image: AssetImage(dietImages[index]),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 08,),
                                TextStyleHelper().mytext(images.keys.elementAt(index), 12,
                                    FontWeight.w500, textColor),
                              ],
                            ),
                          );
                        }),
                  ),

                  /// ===== Trending Recipes ======
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30,top:20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextStyleHelper().mytext("Trending Recipes", 18, FontWeight.w500, textColor),
                            InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const MealPlanScreen(),
                                      ));
                                },
                                child: TextStyleHelper().mytext("View All", 12, FontWeight.w500, MyCustomColor().mMainColor())),
                          ],
                        )
                      )),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20,top: 20),
                        height: 250, width: double.maxFinite,
                        child:  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: trendingImages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(
                              children: [
                                /// ==== box background Image =====
                                Positioned(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const MealPlanScreen(),
                                          ));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      height: 250, width: 265,
                                      decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        image:  DecorationImage(
                                            image: AssetImage(trendingImages[index]),
                                            fit: BoxFit.cover
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 160,left: 20,right: 20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              TextStyleHelper().mytext("10 min", 14, FontWeight.w400, Colors.white),
                                              const SizedBox(width: 8,),
                                              TextStyleHelper().mytext("•", 20, FontWeight.bold, Colors.white),
                                              const SizedBox(width: 8,),
                                              TextStyleHelper().mytext("120 calories", 14, FontWeight.w400, Colors.white),
                                            ],
                                          ),
                                          TextStyleHelper().mytext(trendingTitles[index], 18, FontWeight.w600, Colors.white),
                                        ],
                                      ),
                                    ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),



                  /// ===== Recipes for this week =====
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextStyleHelper().mytext("Recipes for this week", 18, FontWeight.w500, textColor),
                            InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const MealPlanScreen(),
                                      ));
                                },
                                child: TextStyleHelper().mytext("View All", 12, FontWeight.w500, MyCustomColor().mMainColor())),
                          ],
                        )
                      )),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20,bottom: 30),
                        height: 250, width: double.maxFinite,
                        child:  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: trendingTitles.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(
                              children: [
                                /// ==== box background Image =====
                                Positioned(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const MealPlanScreen(),
                                          ));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      height: 250, width: 265,
                                      decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        image:   DecorationImage(
                                            image: AssetImage(trendingImages[index]),
                                            fit: BoxFit.cover
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 160,left: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            TextStyleHelper().mytext("10 min", 14, FontWeight.w400, Colors.white),
                                            const SizedBox(width: 8,),
                                            TextStyleHelper().mytext("•", 20, FontWeight.bold, Colors.white),
                                            const SizedBox(width: 8,),
                                            TextStyleHelper().mytext("120 calories", 14, FontWeight.w400, Colors.white),
                                          ],
                                        ),
                                        TextStyleHelper().mytext(trendingTitles[index], 18, FontWeight.w600, Colors.white),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
