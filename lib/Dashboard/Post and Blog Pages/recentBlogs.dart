import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Post%20and%20Blog%20Pages/blogs.dart';
import 'package:forpartum/Dashboard/Post%20and%20Blog%20Pages/myFeedPosts.dart';
import 'package:forpartum/Dashboard/Post%20and%20Blog%20Pages/submitPost.dart';
import 'package:forpartum/Dashboard/blogScreen.dart';

import '../../helper/mycustombutton.dart';
import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';
import '../Dashboasd Pages/dashboard_weekly.dart';
import '../My Pofile Pages/Notifications/notifications_screen.dart';
import '../dashboardScreen.dart';
import '../gentleMovementPod.dart';
import '../mealPlannerScreen.dart';
import '../myProfileScreen.dart';
import '../navigator_bottom_bar.dart';
import '../trackerScreen.dart';

class RecentBlogsScreen extends StatefulWidget {
  const RecentBlogsScreen({super.key});

  @override
  State<RecentBlogsScreen> createState() => _RecentBlogsScreenState();
}

class _RecentBlogsScreenState extends State<RecentBlogsScreen> {

  TextEditingController searchController = TextEditingController();

  List pages =  [
    const DashboardScreen(),
    const GentleMovementPodScreen(),
    const TrackerScreen(),
    const MainBlogScreen(),
    const MealPlannerScreen(),
    const MyProfileScreen()
  ];

  bool selectedPage = false;
  bool selectedPage1 = false;
  bool selectedPage2 = false;
  bool selectedPage3 = true;
  bool selectedPage4 = false;
  bool selectedPage5 = false;

  int _currentIndex = 3;
  void onTap(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  Color iconSelectedColor = const Color(0XFFB1AFE9);

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:selectedPage3 == true? FloatingActionButton(
          backgroundColor: MyCustomColor().mSecondaryColor(),
          child: const Icon(Icons.add_circle,size: 34,
            color: Colors.white,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
            const SubmitPost()));
          }) :
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: FloatingActionButton(
              onPressed: (){},
              backgroundColor: MyCustomColor().mMainColor(),
              child: AppIcon(iconPath: 'assets/icons/diet.png',iconColor: Colors.white,)
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// >>>> Home <<<<<<
                  IconButton(
                      onPressed: (){
                        onTap(0);
                        selectedPage =! selectedPage;
                        selectedPage5 = false; selectedPage1 = false;
                        selectedPage2 = false; selectedPage3 = false;
                        selectedPage4 = false;
                      },
                      icon: selectedPage == true? Container(
                        height: 36, width: 36,
                        decoration: BoxDecoration(
                            color: iconSelectedColor,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: iconSelectedColor,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 3)
                              )
                            ]
                        ),
                        child: AppIcon(iconPath: 'assets/icons/Home.png',iconColor: backgroundColor,),
                      ) :
                      AppIcon(iconPath: 'assets/icons/Home.png')
                  ),
                  /// >>>> Gentle Movement Pod <<<<<<
                  IconButton(
                      onPressed: (){
                        onTap(1);
                        selectedPage1 =! selectedPage1;
                        selectedPage = false; selectedPage5 = false;
                        selectedPage2 = false; selectedPage3 = false;
                        selectedPage4 = false;
                      },
                      icon: selectedPage1 == true? Container(
                        height: 36, width: 36,
                        decoration: BoxDecoration(
                            color: iconSelectedColor,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: iconSelectedColor,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 3)
                              )
                            ]
                        ),
                        child: AppIcon(iconPath: 'assets/icons/gentleMod.png',iconColor: backgroundColor,),
                      ) :
                      AppIcon(iconPath: 'assets/icons/gentleMod.png')
                  ),
                  /// >>>> Tracker <<<<<<
                  IconButton(
                      onPressed: (){
                        onTap(2);
                        selectedPage2 =! selectedPage2;
                        selectedPage = false; selectedPage1 = false;
                        selectedPage5 = false; selectedPage3 = false;
                        selectedPage4 = false;
                      },
                      icon: selectedPage2 == true? Container(
                        height: 36, width: 36,
                        decoration: BoxDecoration(
                            color: iconSelectedColor,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: iconSelectedColor,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 3)
                              )
                            ]
                        ),
                        child: AppIcon(iconPath: 'assets/icons/Activity.png',iconColor: backgroundColor,),
                      ) :
                      AppIcon(iconPath: 'assets/icons/Activity.png')
                  )
                ],
              ),
            ),
            const Expanded(
                flex: 2,
                child: SizedBox(width: 1,)),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// >>>> Blog <<<<<<
                  IconButton(
                      onPressed: (){
                        onTap(3);
                        selectedPage3 =! selectedPage3;
                        selectedPage = false; selectedPage1 = false;
                        selectedPage2 = false; selectedPage5 = false;
                        selectedPage4 = false;
                      },
                      icon: selectedPage3 == true? Container(
                        height: 36, width: 36,
                        decoration: BoxDecoration(
                            color: iconSelectedColor,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: iconSelectedColor,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 3)
                              )
                            ]
                        ),
                        child: AppIcon(iconPath: 'assets/icons/Camera.png',iconColor: backgroundColor,),
                      ) :
                      AppIcon(iconPath: 'assets/icons/Camera.png')
                  ),
                  /// >>>> Meal Planner <<<<<<
                  IconButton(
                      onPressed: (){
                        selectedPage4 =! selectedPage4;
                        selectedPage = false; selectedPage1 = false;
                        selectedPage2 = false; selectedPage3 = false;
                        selectedPage5 = false;
                        onTap(4);
                      },
                      icon: selectedPage4 == true? Container(
                        height: 36, width: 36,
                        decoration: BoxDecoration(
                            color: iconSelectedColor,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: iconSelectedColor,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 3)
                              )
                            ]
                        ),
                        child: AppIcon(iconPath: 'assets/icons/mealPlanner.png',iconColor: backgroundColor,
                          iconSize: 22,),
                      ) :
                      AppIcon(iconPath: 'assets/icons/mealPlanner.png',iconSize: 22,)
                  ),
                  /// >>>> My Profile <<<<<<
                  IconButton(
                      onPressed: (){
                        onTap(5);
                        selectedPage5 =! selectedPage5;
                        selectedPage = false; selectedPage1 = false;
                        selectedPage2 = false; selectedPage3 = false;
                        selectedPage4 = false;
                      },
                      icon: selectedPage5 == true? Container(
                        height: 36, width: 36,
                        decoration: BoxDecoration(
                            color: iconSelectedColor,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: iconSelectedColor,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 3)
                              )
                            ]
                        ),
                        child: AppIcon(iconPath: 'assets/icons/myProfile.png',iconColor: backgroundColor,),
                      ) :
                      AppIcon(iconPath: 'assets/icons/myProfile.png',)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _currentIndex==3? SingleChildScrollView(
        child: Column(
          children: [
            /// ===== Top App Bar  ====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      margin:
                      const EdgeInsets.only(top: 40, left: 20, right: 20),
                      alignment: AlignmentDirectional.topEnd,
                      child: Image.asset('assets/icons/back.png')),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: TextStyleHelper().mytext(
                        'Blogs Posts', 20, FontWeight.w600, textColor)),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const NotificationScreen()));
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(top: 40,left: 20, right: 20),
                    alignment: AlignmentDirectional.center,
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/icons/notification.png'))
                    ),
                  ),
                ),
              ],
            ),

            /// ===== Search Bar =====
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)
                ),
                child:  ListTile(
                  leading: const Icon(Icons.search_outlined),
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
                          child: VerticalDivider(thickness: 2,),
                        ),
                        Icon(Icons.mic_none_outlined)
                      ],
                    ),
                  ),
                ),
              ),
            ),

            /// ===== Tab Bar (Popular|Blogs|My Feed) ====
            Container(
              height: 60,
              width: appWidth,
              margin: const EdgeInsets.only(top: 20,bottom: 20),
              color: boxColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30,right: 5),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context)=> NavigatorBarScreen(
                                showPage: 3, showIconIndex: true,selectedPageIcon: false,
                              )));},
                        child: CustomButton(title: "Popular",
                          textColor: Colors.grey, backgroundColor: boxColor,
                          borderColor: Colors.grey,
                          height: 40, width: appWidth, textSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: CustomButton(title: "Blogs",
                        textColor: Colors.white,
                        backgroundColor: MyCustomColor().mSecondaryColor(),
                        borderColor: MyCustomColor().mSecondaryColor(),
                        height: 40, width: appWidth, textSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5,right: 30),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MyFeedPostScreen()));
                        },
                        child: CustomButton(title: "My Feed", textColor: Colors.grey, backgroundColor: boxColor,
                          borderColor: Colors.grey,
                          height: 40, width: appWidth, textSize: 16,
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),

            /// ===== Tab Bar (Trending|Recent) ====
            Container(
              height: 60,
              width: appWidth,
              margin: const EdgeInsets.only(bottom: 30),
              color: boxColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: SizedBox(width: appWidth,)),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30,right: 5),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const BlogsScreen()));
                        },
                        child: CustomButton(title: "Trending",
                          textColor: Colors.grey,
                          backgroundColor: boxColor,
                          borderColor: Colors.grey,
                          height: 40, width: appWidth, textSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: SizedBox(width: appWidth,)),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5,right: 30),
                      child: CustomButton(title: "Recent",
                        textColor: Colors.white,
                        backgroundColor: MyCustomColor().mMainColor(),
                        borderColor: MyCustomColor().mMainColor(),
                        height: 40, width: appWidth, textSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: SizedBox(width: appWidth,)),
                ],
              ),
            ),

            Wrap(
              children: List.generate(10, (index) {
                return InkWell(
                  onTap: (){
                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Bl()));
                  },
                  child: const ArticleBox02(
                      heading: 'Dummy Recent Topic',
                      title: "Ut enim ad minim veniam,\n"
                          "quis nostrud exercitation.",
                      subTitle: '8 mins read',
                      image: "assets/images/baby_mother.jpg"),
                );
              }),
            ),
          ],
        ),
      ) :
      pages[_currentIndex],
    );
  }
}
