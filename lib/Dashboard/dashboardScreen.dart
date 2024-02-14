import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Dashboasd%20Pages/Journal%20Prompts/journalDashboard.dart';
import 'package:forpartum/Dashboard/Dashboasd%20Pages/Resources/resourcesPage.dart';
import 'package:forpartum/Dashboard/Gentle%20Movement%20Pod/gentleMovementCategory.dart';
import 'package:forpartum/Dashboard/Meal%20Planner%20Pages/mealplan_detailScreen.dart';
import 'package:forpartum/helper/follow.dart';
import 'package:forpartum/helper/followers_screen.dart';
import 'package:forpartum/Dashboard/Post%20and%20Blog%20Pages/Detail%20Pages/postDetailScreen.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/screens/onboard/subscriptions_screen.dart';

import '../helper/textStyleHelper.dart';
import 'Dashboasd Pages/Postpartum Wellness/postpartumWellnessMain.dart';
import 'Dashboasd Pages/dashboard_weekly.dart';
import 'Dashboasd Pages/dashboard_weeklyUpdates.dart';
import 'Dashboasd Pages/milestone_tracker.dart';
import 'Dashboasd Pages/postpartum_bodyChanges.dart';
import 'Meal Planner Pages/mealplan_screen.dart';
import 'navigator_bottom_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);


  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with TickerProviderStateMixin{
  Map<String, bool> followingStatus = {};

  @override
  void initState(){
    super.initState();
    // Fetch the current user's data
    fetchUserData();
  }

  String getTimeBasedGreeting() {
    final currentTime = DateTime.now();
    final hour = currentTime.hour;

    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String userFullName = '';

  // Future<void> _addArticle() async {
  //   // Current date in the desired format
  //   DateTime currentDate = DateTime.now();
  //
  //   try {
  //     CollectionReference articlesCollection =
  //     _firestore.collection("Articles"); // Reference to "Articles" collection
  //
  //     DocumentReference docRef = articlesCollection.doc(); // Create a new document reference
  //
  //     String articleId = docRef.id; // Get the auto-generated document ID
  //
  //     // Extract day, month, and year from currentDate
  //     int day = currentDate.day;
  //     int month = currentDate.month;
  //     int year = currentDate.year;
  //     // Mapping from month number to month name
  //     final Map<int, String> monthNames = {
  //       1: 'January',
  //       2: 'February',
  //       3: 'March',
  //       4: 'April',
  //       5: 'May',
  //       6: 'June',
  //       7: 'July',
  //       8: 'August',
  //       9: 'September',
  //       10: 'October',
  //       11: 'November',
  //       12: 'December',
  //     };
  //
  //     String formattedMonth = monthNames[month] ?? ''; // Get the formatted month name
  //
  //     await docRef.set({
  //       "articleId": articleId, // Store the auto-generated ID in the document
  //       "title": "0-4 weeks postpartum",
  //       "description":
  //       "Your article description here...\n\nweb page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web site.",
  //       "image": "weeklyupdates.jpg",
  //       "day": day,
  //       "month": formattedMonth, // Store the formatted month name
  //       "year": year,
  //     });
  //
  //     print("Article added successfully with articleId: $articleId");
  //   } catch (error) {
  //     print("Error adding article: $error");
  //   }
  // }


  Future<void> fetchPostData() async {
    // Get the current user
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Reference to the user's document in Firestore
      final userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);

      // Fetch data from Firestore and update text controllers
      final userData = await userDoc.get();
      final data=userData.data();
      if (data!=null) {
        setState(() {
          // Update the profile picture URL if available

          userFullName = userData['fullName'] ?? '';

          // middleNameController.text = userData.get('middleName') ?? '';
          // lastNameController.text = userData.get('lastName') ?? '';

        });
      }
    }
  }


  Future<void> fetchUserData() async {
    // Get the current user
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Reference to the user's document in Firestore
      final userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);

      // Fetch data from Firestore and update text controllers
      final userData = await userDoc.get();
      final data=userData.data();
      if (data!=null) {
        setState(() {
          // Update the profile picture URL if available

          userFullName = userData['fullName'] ?? '';

          // middleNameController.text = userData.get('middleName') ?? '';
          // lastNameController.text = userData.get('lastName') ?? '';

        });
      }
    }
  }


  var paragraph01 = "When an unknown printer took a galley of type\n"
      "and scrambled it to make a type specimen book.\n"
      "It has survived not only five centuries, but\n"
      "also the leap into electronic typesetting,\n"
      "remaining essentially unchanged. It was\n"
      "popularised in the 1960s with the release of\n"
      "Letraset sheets containing Lorem Ipsum passages, and more recently.\n"
      "Web page editors now use Lorem Ipsum as\n"
      "their default model text, and a search for 'lorem ipsum'\n"
      "will uncover many web site\n";

  List<String> articleBoxTitle = [
    'Breastfeeding 101', 'C-Section 101', 'New Mother'
  ];

  List<String> articleBoxImages = [
    'assets/articles/04.png', 'assets/articles/05.png','assets/articles/06.png',
  ];

  List<String> warmSoupsImage = [
    "assets/images/soup.jpg","assets/images/soup2.png","assets/images/soup3.png"
  ];

  List<String> podImages = [
    'assets/images/poert_01.png','assets/images/poert_02.png',
    'assets/images/poert_03.png','assets/images/exercise.jpg'
  ];

  List<String> gentleMovementTitle = [
    'Warm up', 'Breathing', 'Core', 'Squared'
  ];

  List<String> landImages = [
    'assets/articles/land_01.png','assets/articles/land_02.png','assets/articles/land_03.png'
  ];
  List<String> landTitles = [
    'March 2023 Postpartum','Sex After Baby','Postpartum Body Care'
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
                      /// ===== Good Morning =====
                      Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30,top: 40,bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextStyleHelper().mytext(getTimeBasedGreeting(), 12, FontWeight.w500, textColor),
                                const SizedBox(height: 10,),
                                TextStyleHelper().mytext(userFullName, 24, FontWeight.w700, MyCustomColor().mMainColor()),
                                const SizedBox(height: 5,),
                                TextStyleHelper().mytext('You’re I day Postpartum', 14, FontWeight.w500, Colors.grey),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: MyCustomColor().mMainColor()),
                                  onPressed: () async{

                                    // Navigate to the FollowingsScreen when the button is pressed
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => FollowingsScreen(),)
                                    );
                                  },
                                  child: const Text('My Followers'),
                                )
                              ],
                            ),
                          ],
                        ),
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
                                    child: VerticalDivider(),
                                  ),
                                  Icon(Icons.mic_none_outlined)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// ==== Postpartum body changes Box =====
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
                        decoration: BoxDecoration(
                            color: const Color(0XFFB1AFE9),
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(image: AssetImage('assets/images/waves.png'),
                                fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// >>>> Waves image
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextStyleHelper().mytext('Postpartum', 21, FontWeight.w400, Colors.white),
                                        TextStyleHelper().mytext('Body Changes', 21, FontWeight.w700, Colors.white),
                                        const SizedBox(height: 20,),
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const DbPostpartumBodyChanges()));

                                          },
                                          child: CustomButton(title: 'View', borderColor: Colors.white,
                                              textColor: MyCustomColor().mMainColor(), backgroundColor: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 130, width: 115,
                                    margin: const EdgeInsets.only(right: 10,bottom: 1),
                                    alignment: Alignment.centerLeft,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/images/half_body.png'))
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                      /// ==== Tab Bar (Home|Insights|Milestone Tracker) ====
                      Container(
                        height: 60,
                        width: appWidth,
                        margin: const EdgeInsets.only(top: 20,bottom: 20,),
                        color: boxColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.only(left: 20,right: 8),
                                child: InkWell(
                                  onTap: (){
                                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=> const DashboardWeekly()));
                                  },
                                  child: CustomButton(title: "Home", textColor: Colors.white, backgroundColor: MyCustomColor().mMainColor(),
                                    borderColor: MyCustomColor().mMainColor(),
                                    height: 40, width: 150, textSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.only(left: 8,right: 8),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const DashboardWeekly()));
                                  },
                                  child: CustomButton(title: "Insights", textColor: Colors.grey, backgroundColor: boxColor,
                                    borderColor: Colors.grey,
                                    height: 40, width: 150, textSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.only(left: 8,right: 20),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const DbMilestoneTrackerScreen()));
                                  },
                                  child: CustomButton(title: "Milestone Tracker",textColor: Colors.grey, backgroundColor: boxColor,
                                    borderColor: Colors.grey,
                                    height: 40, width: 160, textSize: 16,
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                      ),


                      /// ==== Articles For you ====
                      Padding(
                        padding: const EdgeInsets.only(left: 30,bottom: 20),
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
                              // _addArticle();

                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const DbWeeklyUpdatesScreen()));
                            },
                            child:  ArticleBox(title: articleBoxTitle[index], subTitle: "While you're busy coming to\n"
                                "terms with being pregnant th", image: articleBoxImages[index]),
                          );
                        }),
                      ),
                      TextStyleHelper().mytext('VIEW MORE ARTICLES', 16, FontWeight.w700, MyCustomColor().mMainColor()),
                      Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
                        child: RoundButton(
                            text: "Try Forpartum Premium",
                            textColor: Colors.white,
                            backgroundColor: MyCustomColor().mMainColor(),
                            borderColor: MyCustomColor().mMainColor(),
                            height: 60, width: appWidth, radius: 100,
                            onClick: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SubscriptionScreen()));
                            }),
                      ),


                      /// ===== MealPlan For you =====
                      Padding(
                        padding: const EdgeInsets.only(left: 30,bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: TextStyleHelper().mytext('Jun 11', 12, FontWeight.w600, MyCustomColor().mMainColor())),
                            const SizedBox(height: 10,),
                            TextStyleHelper().mytext('Meal Plans For You', 22, FontWeight.w600, textColor)
                          ],
                        ),
                      ),
                      Wrap(
                        children: List.generate(3, (index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const MealPlanDetailScreen()));
                            },
                            child:  ArticleBox(title: 'Warm Soup', subTitle: "While you're busy coming to\n"
                                "terms with being pregnant th", image: warmSoupsImage[index]),
                          );
                        }),
                      ),

                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const MealPlanScreen()));
                          },
                          child: TextStyleHelper().mytext('VIEW MORE MEAL PLANS', 16, FontWeight.w700, MyCustomColor().mMainColor())),

                      /// ==== Postpartum Wellness Screening ====
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
                        decoration: BoxDecoration(
                            color: const Color(0XFFB1AFE9),
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(image: AssetImage('assets/images/sleep_waves.png'),
                                fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter)
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20,top: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextStyleHelper().mytext('Postpartum', 21, FontWeight.w400, Colors.white),
                                  TextStyleHelper().mytext('Wellness Screening', 21, FontWeight.w700, Colors.white),
                                  const SizedBox(height: 20,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=> const PostpartumWellnessScreening()));
                                    },
                                    child: CustomButton(title: 'Start',borderColor: Colors.white,
                                        textColor: MyCustomColor().mMainColor(), backgroundColor: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// ==== Gentle Movement ======
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 30,right: 30,top:20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextStyleHelper().mytext("Gentle Movement", 20, FontWeight.w600, textColor),
                                  InkWell(
                                      onTap: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context)=> const GentleMovementCategory()));
                                      },
                                      child: TextStyleHelper().mytext("See all", 12, FontWeight.w500, MyCustomColor().mMainColor())),
                                ],
                              )
                          )),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20,top: 20,bottom: 30),
                            height: 140, width: double.maxFinite,
                            child:  ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: gentleMovementTitle.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  height: 140, width: 100,
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage(podImages[index]),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=> const GentleMovementCategory()));
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: TextStyleHelper().mytext(gentleMovementTitle[index], 14, FontWeight.w600, Colors.white)),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      /// ==== Posts =====
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('Posts').limit(3).snapshots(), // Limit to 3 posts
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator(); // Loading indicator while fetching data
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                            return const Text('No posts available.');
                          } else {
                            // Use the fetched posts to create DynamicPost widgets
                            final posts = snapshot.data!.docs;
                            return Wrap(
                              children: posts.map((postDoc) {
                                final data = postDoc.data() as Map<String, dynamic>;
                                final postUserId = data['userId'];
                                final isFollowing = followingStatus[postUserId] ?? false;
                                int captionsMaxLines = 50;
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context)=> PostDetailsScreen(
                                            postChild: data['captions'] != ""? LimitedParagraph(
                                              text: data['captions'], maxLines: captionsMaxLines,) : const SizedBox(width: 1,),
                                            title: data['title'],
                                            username: data['userName'], postImageURL: data['postImage'],
                                            postId: data['postId'],

                                            profileImageURL: data['profileImage'], time: data['time'])));
                                  },
                                  child: DynamicPost(
                                      title: data['title'],
                                      timeAgo: data['time'],
                                      name: data['userName'],
                                      //captions: data['captions'],
                                      postChild: data['captions'] != ""? LimitedParagraph(
                                        text: data['captions'], maxLines: 5,)
                                          : const SizedBox(width: 1,),
                                      postImageUrl: data['postImage'],
                                      profileImageUrl: data['profileImage'],
                                      userId: postUserId,
                                      isFollowing: isFollowing,
                                      onFollowStatusChanged: (newStatus) {
                                        // Update the isFollowing status in your data source (e.g., Firestore or a local map)
                                        followingStatus[postUserId] = newStatus;
                                        // This will automatically rebuild the widget with the new status.
                                        setState(() {});
                                      }
                                  ),
                                );
                              }).toList(),
                            );
                          }
                        },
                      ),



                      /// ==== Two Buttons ====
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: 50, width: appWidth,
                              margin: const EdgeInsets.only(left: 30,right: 20),
                              decoration: BoxDecoration(
                                  color: boxColor,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 3, offset: const Offset(-3, 6)
                                  )]
                              ),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=> const JournalPromptsDashboard()));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    AppIcon(iconPath: 'assets/icons/book.png',iconColor: textColor,),
                                    TextStyleHelper().mytext('Journal', 14, FontWeight.w700, textColor)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: 50, width: appWidth,
                              margin: const EdgeInsets.only(left: 20,right: 30),
                              decoration: BoxDecoration(
                                  color: boxColor,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 3, offset: const Offset(3, 6)
                                  )]
                              ),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>const ResourcesPage()));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    AppIcon(iconPath: 'assets/icons/Resources.png',iconColor: textColor,
                                      iconSize: 24,),
                                    TextStyleHelper().mytext('Resources', 14, FontWeight.w700, textColor)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      /// ==== Book Your Slot Now =====
                      Container(
                        height: 150, width: appWidth,
                        margin: const EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 30),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [MyCustomColor().mMainColor(),MyCustomColor().mSecondaryColor()],
                              begin: Alignment.topRight, end: Alignment.bottomRight
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30,right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextStyleHelper().mytext('Today', 22, FontWeight.w800, backgroundColor),
                              TextStyleHelper().mytext('Free group therapy sessions for Trauma, Depression, ADHD & Relationship Wellness.',
                                  14, FontWeight.w400, backgroundColor),
                              TextStyleHelper().mytext('Book Your Slot Now', 16, FontWeight.w700,backgroundColor),
                            ],
                          ),
                        ),
                      ),

                      Container(
                          height: 80, width: appWidth,
                          margin: const EdgeInsets.only(left: 30,right: 30,bottom: 40),
                          decoration:  BoxDecoration(
                              color: boxColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 35, offset: const Offset(0, 10)
                                )
                              ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextStyleHelper().mytext("“It is better to conquer yourself than\nto win a thousand battles”",
                                  14, FontWeight.w300, Colors.grey),
                              AppIcon(iconPath: 'assets/icons/comma.png',iconColor: MyCustomColor().mSecondaryColor(),)
                            ],
                          )
                      )
                    ],
                  ),
                ),
              );

  }
}


/// Dynamic Article Box
class ArticleBox extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const ArticleBox({super.key,
    required this.title,
    required this.subTitle,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    return Container(
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
              TextStyleHelper().mytext(title, 14, FontWeight.w600, textColor),
              const SizedBox(height: 10,),
              TextStyleHelper().mytext(subTitle, 12, FontWeight.w400, Colors.grey),
            ],
          ),

        ],
      ),
    );
  }
}

/// Custom Post
class DynamicPost extends StatefulWidget {
  final String title;
  final Function(bool) onFollowStatusChanged; // Callback to update isFollowing
  final String name;
  final Widget postChild;
  final String userId; // User ID of the post creator
  final String postImageUrl; // URL for the post image
  final String profileImageUrl; // URL for the profile image
  final String timeAgo;
  bool isFollowing; // Indicates whether the current user is following this user



  double? height;

  DynamicPost({super.key, 
    required this.title,
    required this.name,
    required this.postChild,
    required this.postImageUrl,
    required this.profileImageUrl,
    required this.timeAgo,
    this.height=310,
    required this.isFollowing,
    required this.userId,
    required this.onFollowStatusChanged

  });

  @override
  State<DynamicPost> createState() => _DynamicPostState();
}

class _DynamicPostState extends State<DynamicPost> {


  @override
  void initState() {
    super.initState();
    // Initialize the local state based on the widget's initial value
    checkFollowingStatus();
    final currentUserUid = FirebaseAuth.instance.currentUser?.uid;
    isCurrentUserOwnPost = currentUserUid == widget.userId;

  }
  // Check if the current user is viewing their own post
  bool isCurrentUserOwnPost = false;

  // Function to check the following status in Firestore
  // Function to check the following status in Firestore
  void checkFollowingStatus() async {
    final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
    final followingSnapshot =
    await FirebaseFirestore.instance.collection('Users').doc(widget.userId).collection('followers').doc(currentUserUid).get();

    // Update the widget's isFollowing state based on the existence of the document
    setState(() {
      widget.isFollowing = followingSnapshot.exists;
    });
  }



  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextStyleHelper().mytext(widget.title, 16, FontWeight.w600, MyCustomColor().mMainColor()),
              if (!isCurrentUserOwnPost)

                GestureDetector(
                  onTap: () async {
                    final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
                    final followId = widget.userId;

                    if (widget.isFollowing) {
                      // Unfollow the user
                      await unfollowUser(followId); // Call the function to unfollow
                      widget.onFollowStatusChanged(false);
                    } else {
                      // Follow the user
                      await followUser(followId); // Call the function to follow
                      widget.onFollowStatusChanged(true);
                    }
                  },
                  child: CustomButton(
                    title: widget.isFollowing ? 'Unfollow' : 'Follow',
                    textColor: widget.isFollowing ? Colors.white : Colors.grey,
                    backgroundColor: widget.isFollowing
                        ? MyCustomColor().mSecondaryColor()
                        : boxColor,
                    borderColor: widget.isFollowing
                        ? MyCustomColor().mSecondaryColor()
                        : Colors.grey,
                    radius: 10,
                  ),
                ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20,bottom: 20),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(widget.profileImageUrl), // Use NetworkImage to load the profile image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  TextStyleHelper().mytext(widget.name, 14, FontWeight.w600, textColor),
                  const SizedBox(height: 8),
                  TextStyleHelper().mytext(widget.timeAgo, 10, FontWeight.w500, Colors.grey),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10,right: 20),
            child: widget.postChild,
          ),
          widget.postImageUrl != ""? Container(
            margin: const EdgeInsets.only(top: 10),
            height: 270,
            width: appWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(widget.postImageUrl), // Use NetworkImage to load the post image
                fit: BoxFit.cover,
              ),
            ),
          ) :
          const SizedBox(width: 1,),
          const SizedBox(height: 10),
          const Divider(thickness: 2),
          Row(
            children: [
              const SizedBox(width: 20),
              AppIcon(iconPath: 'assets/icons/Heart.png', iconColor: textColor, iconSize: 20),
              const SizedBox(width: 10),
              AppIcon(iconPath: 'assets/icons/chat.png', iconColor: textColor, iconSize: 20),
              const SizedBox(width: 10),
              AppIcon(iconPath: 'assets/icons/send.png', iconColor: textColor, iconSize: 20),
            ],
          ),
        ],
      ),
    );
  }
}



class LimitedParagraph extends StatefulWidget {
  final String text;
  final int maxLines;
  bool? extendHeight;

  LimitedParagraph({super.key,
    required this.text,
    required this.maxLines,
    this.extendHeight=false
  });

  @override
  _LimitedParagraphState createState() => _LimitedParagraphState();
}

class _LimitedParagraphState extends State<LimitedParagraph> {
  bool isExpanded = false;

  @override

  Widget build(BuildContext context) {
    final textWidget = Text(widget.text,
      style: const TextStyle(fontSize: 12,fontWeight:FontWeight.w400,fontFamily: 'Poppins',
          color: Colors.grey),
      maxLines: isExpanded ? widget.maxLines : null,
      overflow: TextOverflow.ellipsis,
    );

    /// count numbers of Line
    final textSpan = TextSpan(
      text: widget.text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
        color: Colors.grey,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: 100,
    );

    textPainter.layout(maxWidth: MediaQuery.of(context).size.width);
    final double lineHeight = textPainter.preferredLineHeight;
    final int numberOfLines = (textPainter.height / lineHeight).ceil();


    print(numberOfLines.toString());

    return  numberOfLines >= 3 ? Column(
      children: [
        textWidget,
        if (!isExpanded)
          TextButton(
            onPressed: () {
              setState(() {
                isExpanded = true;
              });
            },
            child:  Text('See More',style: TextStyle(
                fontSize: 12, fontFamily: 'Poppins',fontWeight: FontWeight.w400,
                color: MyCustomColor().mSecondaryColor()),),
          ),
        if (isExpanded )
          TextButton(
            onPressed: () {
              setState(() {
                isExpanded = false;
              });
            },
            child:  Text('See Less',style: TextStyle(
                fontSize: 12, fontFamily: 'Poppins',fontWeight: FontWeight.w400,
                color: MyCustomColor().mMainColor()),),
          ),
      ],
    ) :
    Column(
      children: [
        textWidget
      ],
    );
  }
}