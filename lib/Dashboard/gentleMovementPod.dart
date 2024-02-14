import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Gentle%20Movement%20Pod/gentleMovementCategory.dart';
import 'package:forpartum/Dashboard/Gentle%20Movement%20Pod/gentleMovementClasses2.dart';
import 'package:forpartum/Dashboard/My%20Pofile%20Pages/Notifications/notifications_screen.dart';

import '../helper/mycustomcolor.dart';
import '../helper/textStyleHelper.dart';
import 'Gentle Movement Pod/scheduleClass.dart';

class GentleMovementPodScreen extends StatefulWidget {
  const GentleMovementPodScreen({Key? key}) : super(key: key);

  @override
  State<GentleMovementPodScreen> createState() => _GentleMovementPodScreenState();
}

class _GentleMovementPodScreenState extends State<GentleMovementPodScreen> {

  String userFullName = '';
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

  var topInstructor = {
    "assets/articles/pod01.png" : "Jany" ,
    "assets/articles/pod02.png" : "White" ,
    "assets/articles/pod03.png" : "Rose" ,
    "assets/articles/pod04.png" : "Emy" ,
    "assets/articles/pod05.png" : "Wisdom" ,
  };

  var categories = {
    "Pilates" : "assets/articles/port_01.png",
    "Yoga" : "assets/articles/port_02.png",
    "Breathing" : "assets/articles/port_03.png",
    "Core" : "assets/articles/port_01.png",
    "Tapping" : "assets/articles/port_01.png",
  };
  @override
  void initState(){
    super.initState();
    // Fetch the current user's data
    fetchUserData();
  }

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

            /// ====== Top Bar =======
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
                      TextStyleHelper().mytext('Welcome Back,', 12, FontWeight.w500, textColor),
                      const SizedBox(height: 10,),
                      TextStyleHelper().mytext(userFullName, 24, FontWeight.w700, MyCustomColor().mMainColor()),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> const ScheduleClasses()));
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                           margin: const EdgeInsets.only(right: 10),
                          alignment: AlignmentDirectional.center,
                          decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/icons/calendar.png'))),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationScreen()));
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          // margin: const EdgeInsets.only(top: 40, left: 20,right: 0.8),
                          alignment: AlignmentDirectional.center,
                          decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/icons/notification.png'))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// ====== Box-> Today's Activity ======
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
                        TextStyleHelper().mytext("Today's", 22, FontWeight.w400, Colors.white),
                        TextStyleHelper().mytext('Activity', 26, FontWeight.w700, Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// ====== Recommendation Class ====
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextStyleHelper().mytext('Recommendation Class', 22, FontWeight.w600, textColor),
                  TextStyleHelper().mytext('See All', 12, FontWeight.w600, MyCustomColor().mMainColor()),
                ],
              ),
            ),

            /// ====== Box-> Yoga Class ======
            Container(
              height: 100,width: appWidth,
              margin: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
              decoration: BoxDecoration(
                color: MyCustomColor().mMainColor(),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 40,
                    offset: const Offset(0, 10)
                )]
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const GentleMovementClassesDetail()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          /// >>> Image
                          Container(
                            height: 60,
                            width: 60,
                            margin: const EdgeInsets.only(right: 15),
                          //  alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(image: AssetImage('assets/images/profile_pic.jpg'),
                                    fit: BoxFit.cover
                                )),
                          ),
                          /// >>> Title
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextStyleHelper().mytext('Yoga Class', 20, FontWeight.w600, Colors.white),
                              const SizedBox(height: 5,),
                              TextStyleHelper().mytext('With Rachel Wisdom', 12, FontWeight.w500, Colors.grey.shade300),
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 84,width: 84,
                        margin: const EdgeInsets.only(top: 20),
                        alignment: Alignment.centerRight,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/icons/fill_heart.png'),
                              fit: BoxFit.cover)
                        ),
                      )
                    ],
                  ),
                ),
              )
            ),

            /// ====== Top Instructor ====
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20,top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextStyleHelper().mytext('Top Instructor', 22, FontWeight.w600, textColor),
                  TextStyleHelper().mytext('See All', 12, FontWeight.w600, MyCustomColor().mMainColor()),
                ],
              ),
            ),
            Container(
              height: 100, width: double.maxFinite,
              margin: const EdgeInsets.only(left: 30),
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index){
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 75, width: 75,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.grey.withOpacity(0.1),
                                border: Border.all(color: MyCustomColor().mMainColor(),width: 2),
                                image:   const DecorationImage(
                                    image: AssetImage("assets/articles/pod01.png"),
                                    fit: BoxFit.cover
                                ),
                              ),
                            ),
                            SizedBox(width: appWidth/20,)
                          ],
                        ),
                        const SizedBox(height: 08,),
                        Row(
                          children: [
                            TextStyleHelper().mytext(topInstructor.values.elementAt(index), 12,
                                FontWeight.w500, textColor),
                            SizedBox(width: appWidth/20,)
                          ],
                        ),
                      ],
                    );
                  }),
            ),

            /// ====== Categories ====
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20,top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextStyleHelper().mytext('Categories', 22, FontWeight.w600, textColor),
                  InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> const GentleMovementCategory()));
                      },
                      child: TextStyleHelper().mytext('See All', 12, FontWeight.w600, MyCustomColor().mMainColor())),
                ],
              ),
            ),

            Container(
              height: 140, width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> const GentleMovementCategory()));
                            },
                            child: Container(
                              height: 140, width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(categories.values.elementAt(index)))
                              ),
                            ),
                          ),
                          Container(
                              height: 140, width: 100,
                              alignment: Alignment.center,
                              child: TextStyleHelper().mytext(categories.keys.elementAt(index), 14, FontWeight.w600, Colors.white)),
                        ],
                      ),
                    );
                  }),
            ),

            /// ====== Live Sessions ====
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20,top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextStyleHelper().mytext('Live Sessions', 22, FontWeight.w600, textColor),
                  TextStyleHelper().mytext('See All', 12, FontWeight.w600, MyCustomColor().mMainColor()),
                ],
              ),
            ),
            Container(
              height: 240,width: appWidth,
              margin: const EdgeInsets.only(left: 30,right: 30),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                  color: MyCustomColor().mSecondaryColor().withOpacity(0.3),
                  blurRadius: 30, offset: const Offset(0, 6)
                )]
              ),
              child: Column(
                children: [
                  Container(
                    height: 100, width: appWidth,
                    margin: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
                    decoration:  BoxDecoration(
                      color: const Color(0XFFB1AFE9),
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(image: AssetImage('assets/articles/mod04.png'),
                      fit: BoxFit.contain
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextStyleHelper().mytext('9:30 am - 11:30 am', 12,
                            FontWeight.w600, MyCustomColor().mMainColor()),
                        Container(
                          height: 32, width: 32,
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/icons/plus_orange.png'))),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextStyleHelper().mytext('Gentle Movement', 22, FontWeight.w600, textColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: MiniProfilePic(picPath: 'assets/images/profile_pic.jpg'),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: MiniProfilePic(picPath: 'assets/images/profile_pic.jpg'),
                                ),
                                MiniProfilePic(picPath: 'assets/images/profile_pic.jpg')
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: TextStyleHelper().mytext('10+', 12, FontWeight.w500, Colors.grey),
                            )
                          ],
                        ),
                        TextStyleHelper().mytext('View Detail', 12, FontWeight.w600, MyCustomColor().mMainColor()),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}


/// >>>> Mini Profile Picture
class MiniProfilePic extends StatelessWidget {
  final String picPath;
  const MiniProfilePic({super.key,
  required this.picPath
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 28, width: 28,
      decoration:  BoxDecoration(
          image:  DecorationImage(
              image: AssetImage(picPath),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              color: boxColor,
              width: 2
          ),
          boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 6, offset: const Offset(0, 3)
          )]
      ),
    );
  }
}
