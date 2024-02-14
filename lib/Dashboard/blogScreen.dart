import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Dashboasd%20Pages/dashboard_weekly.dart';
import 'package:forpartum/Dashboard/Post%20and%20Blog%20Pages/blogs.dart';
import 'package:forpartum/Dashboard/Post%20and%20Blog%20Pages/myFeedPosts.dart';
import 'package:forpartum/Dashboard/blogScreen02.dart';
import 'package:forpartum/Dashboard/trackerScreen.dart';
import 'package:forpartum/helper/mycustomcolor.dart';

import '../helper/mycustombutton.dart';
import '../helper/textStyleHelper.dart';
import 'My Pofile Pages/Notifications/notifications_screen.dart';
import 'dashboardScreen.dart';
import 'gentleMovementPod.dart';
import 'mealPlannerScreen.dart';
import 'myProfileScreen.dart';

class MainBlogScreen extends StatefulWidget {
  const MainBlogScreen({Key? key}) : super(key: key);

  @override
  State<MainBlogScreen> createState() => _MainBlogScreenState();
}

class _MainBlogScreenState extends State<MainBlogScreen> {

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
    var appWidth = MediaQuery.of(context).size.width;
    var appHeight = MediaQuery.of(context).size.height;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: FloatingActionButton.extended(
            onPressed: (){

            },
            isExtended: true,
            backgroundColor: MyCustomColor().mSecondaryColor(),
            icon: const Icon(Icons.add_circle,size: 24,
            color: Colors.white,),
            label: TextStyleHelper().mytext('Create Your New Post',
                16, FontWeight.w600, Colors.white)),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            /// ===== Top App Bar  ====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                  //  Navigator.pop(context);
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      margin:
                      const EdgeInsets.only(top: 40, left: 20, right: 20),
                      alignment: AlignmentDirectional.topEnd,
                      child: Image.asset('assets/icons/menu.png')),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextStyleHelper().mytext(
                            'Blogs', 22, FontWeight.w700, MyCustomColor().mMainColor()),
                        TextStyleHelper().mytext(
                            ' And ', 22, FontWeight.w600, textColor),
                        TextStyleHelper().mytext(
                            'Feeds', 22, FontWeight.w700, MyCustomColor().mSecondaryColor())
                      ],
                    )),
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
                      child: CustomButton(title: "Popular", textColor: Colors.white,
                        backgroundColor: MyCustomColor().mSecondaryColor(),
                        borderColor: MyCustomColor().mSecondaryColor(),
                        height: 40, width: appWidth, textSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const BlogsScreen()));
                        },
                        child: CustomButton(title: "Blogs", textColor: Colors.grey, backgroundColor: boxColor,
                          borderColor: Colors.grey,
                          height: 40, width: appWidth, textSize: 16,
                        ),
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

            /// ===== Blog Post Box =====
            Container(
              height: 320, width: appWidth,
              margin: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow:  [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 2,
                  ),
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// >>> Post Image
                  Container(
                    height: 120, width: double.maxFinite,
                    margin: const EdgeInsets.all(20),
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/yoga_class.jpg"),
                      fit: BoxFit.cover
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 32,width: 32,
                          margin: const EdgeInsets.only(right: 20,top: 10),
                          decoration: BoxDecoration(
                            color: MyCustomColor().mMainColor(),
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: const Icon(Icons.save_alt_outlined,
                          color: Colors.white,size: 20,),
                        ),
                      ],
                    ),
                  ),

                  /// >>> Postpartum Text
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 20),
                    child: TextStyleHelper().mytext('Postpartum', 12, FontWeight.w600, MyCustomColor().mMainColor()),
                  ),

                  /// >>> Captions
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 20),
                    child: TextStyleHelper().mytext('Ut enim ad minim veniam, quis\n'
                      'nostrud exercitation Ullamco', 16, FontWeight.w600, textColor),
                  ),

                  /// >>> Profile Info with timing post
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                             // margin: const EdgeInsets.only( top: 20, bottom: 20),
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  image: const DecorationImage(image: AssetImage('assets/images/profile_pic.jpg'),
                                      fit: BoxFit.cover
                                  )),
                            ),
                              const SizedBox(width: 10,),
                              TextStyleHelper().mytext("Ayesha Ahmad", 14, FontWeight.w500, Colors.grey)
                          ],
                        ),
                        TextStyleHelper().mytext('8 mins read', 12, FontWeight.w400, Colors.grey.shade500)
                      ],
                    ),
                  ),

                ],
              ),
            ),


            /// ==== Articles For You ====
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20,top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyleHelper().mytext('Articles For You', 22, FontWeight.w600, textColor),
                      TextStyleHelper().mytext('View All', 12, FontWeight.w600, MyCustomColor().mMainColor())
                    ],
                  ),
                ),
                Wrap(
                  children: List.generate(3, (index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const BlogScreen02()));
                      },
                      child: const ArticleBox02(
                          heading: 'Dummy Topic',
                          title: "Ut enim ad minim veniam,\n"
                              "quis nostrud exercitation.",
                          subTitle: '8 mins read',
                          image: "assets/images/baby_mother.jpg"),
                    );
                  }),
                ),
              ],
            ),

            /// ==== Post Feeds For You ====
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20,top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyleHelper().mytext('New Post Feeds For You', 22, FontWeight.w600, textColor),
                      TextStyleHelper().mytext('View All', 12, FontWeight.w600, MyCustomColor().mMainColor())
                    ],
                  ),
                ),
                Wrap(
                  children: List.generate(3, (index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const BlogScreen02()));
                      },
                      child: const ArticleBox02(
                          heading: 'Dummy Topic',
                          title: "Ut enim ad minim veniam,\n"
                              "quis nostrud exercitation.",
                          subTitle: '8 mins read',
                          image: "assets/images/baby_mother.jpg"),
                    );
                  }),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
