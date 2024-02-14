import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/My%20Pofile%20Pages/my_habits_screen.dart';
import 'package:forpartum/Dashboard/My%20Pofile%20Pages/myappointmentsscreen1.dart';
import 'package:forpartum/Dashboard/My%20Pofile%20Pages/myinsights.dart';
import 'package:forpartum/Dashboard/My%20Pofile%20Pages/mypayments.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

import 'My Pofile Pages/app_settings.dart';
import 'My Pofile Pages/edit_profile.dart';
import 'dart:io';


class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {

  @override
  void initState() {
    super.initState();

    // Fetch the current user's data
    fetchUserData();
  }

  var cardTitles = {
    "Habits" : "Insights",
    "Appointments" : "Invite\nFriends",
    "Payments" : "Tracker",
    "Edit\nAccount" : "Account\nSettings",
  };

  dynamic cardIcons = {
    Icons.star_outlined :
      Icons.female_outlined,
    Icons.calendar_month_outlined :
      Icons.person_add_alt_1_outlined,
    Icons.payment_sharp :
        Icons.track_changes_outlined,
    Icons.person :
        Icons.settings_outlined
  };

  final List<dynamic> settingsRoutesLeft =[
    const MyHabitsScreen(), const MyAppointmentsScreen1() , const MyPaymentsScreen1() , const EditProfileScreen()
  ];

  final List<dynamic> settingsRoutesRight =[
    const MyInsightsScreen1(), const AppSettings() , const AppSettings() , const AppSettings()
  ];

  String userFullName = '';
  String userCountry = '';
  String _profilePicUrl = ''; // Add this line
  File? _file;
  Future<void> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);
      final userData = await userDoc.get();
      final data = userData.data(); // Retrieve all fields and values as a Map

      if (data!=null) {
        setState(() {
          userFullName = data['fullName'] ?? '';
          userCountry = data['country'] ?? '';

          // Update the profile picture URL
          _profilePicUrl = data['profilePicUrl'] ?? '';
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    var appHeight = MediaQuery.of(context).size.height;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ===== Header Profile ====
            Padding(
              padding: const EdgeInsets.only(top: 50,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextStyleHelper().mytext('Profile', 18, FontWeight.w600, textColor)
                ],
              ),
            ),

            /// ===== Profile Picture ====
      Container(
        height: 180,
        width: 180,
        margin: const EdgeInsets.only(left: 20, right: 20),
        alignment: AlignmentDirectional.topEnd,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          image: DecorationImage(
            image: _file != null
                ? FileImage(_file!) // Show the selected image
                : _profilePicUrl.isNotEmpty
                ? NetworkImage(_profilePicUrl) // Show the profile picture from Firebase Storage
                : const AssetImage('assets/images/dummyprofile.jpg') as ImageProvider, // Use a default image or placeholder
            fit: BoxFit.cover,
          ),
        ),


            ),

            const SizedBox(height: 10,),

            /// ====== Full User Name ====
            TextStyleHelper().mytext(userFullName, 22, FontWeight.w500, textColor),

            /// ====== Country Name & Flag ====
            Container(
              height: 50,
              width: 170,
              margin: const EdgeInsets.only(top: 10,bottom: 80),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(100),
                boxShadow:  [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0,2),
                    blurRadius: 2
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextStyleHelper().mytext(userCountry, 22, FontWeight.w500, Colors.grey),
                  const Icon(Icons.flag,
                    color: Colors.grey,)
                ],
              ),
            ),

            // ===== Options custom widgets ====
            Wrap(
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      CustomCardLeft(title: cardTitles.keys.elementAt(index), iconPath: cardIcons.keys.elementAt(index),
                        onClick: () {
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => settingsRoutesLeft[index]),
                            );
                          } else if(index==1) {

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> settingsRoutesLeft[index]));
                            // Handle other cards' actions here
                          }
                          else if(index==2){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> settingsRoutesLeft[index]));
                          }
                          else{
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> settingsRoutesLeft[index]));
                          }
                        },
                      ),
                      CustomCardRight(title: cardTitles.values.elementAt(index), iconPath: cardIcons.values.elementAt(index),
                        onClick: (){
                        if(index==0) {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> settingsRoutesRight[index]));
                        } else{
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> settingsRoutesRight[index]));
                        }
                        },
                      ),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

class CustomCardLeft extends StatelessWidget {
  final String title;
  dynamic iconPath;
  final VoidCallback onClick;
   CustomCardLeft({super.key,
  required this.title,
    required this.iconPath,
     required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 30,right: 10),
        child: InkWell(
          onTap: (){
            onClick();
          },
          child: Container(
            height: 170,
            width: appWidth,
            decoration: BoxDecoration(
                color: boxColor, //const Color(0XFFB1AFE9),
                borderRadius: BorderRadius.circular(30),
                boxShadow:  [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0,2),
                      blurRadius: 2
                  )
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Icon Circle
                Container(
                  height: 65, width: 65,
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow:  [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0,2),
                            blurRadius: 2
                        )
                      ]
                  ),
                  child: Icon(iconPath,size: 40,
                    color: MyCustomColor().mMainColor(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextStyleHelper().mytext(title, 16, FontWeight.w600, textColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCardRight extends StatelessWidget {
  final String title;
  dynamic iconPath;
  final VoidCallback onClick;
   CustomCardRight({super.key,
  required this.title,
    required this.iconPath,
     required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return  Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 30),
        child: InkWell(
          onTap: (){
            onClick();
          },
          child: Container(
            height: 170,
            width: appWidth,
            decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow:  [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0,2),
                      blurRadius: 2
                  )
                ]

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icons Circle
                Container(
                  height: 65, width: 65,
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow:  [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0,2),
                            blurRadius: 2
                        )
                      ]
                  ),
                  child:  Icon(iconPath,size: 40,
                    color: MyCustomColor().mMainColor(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextStyleHelper().mytext(title, 16, FontWeight.w600, textColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
