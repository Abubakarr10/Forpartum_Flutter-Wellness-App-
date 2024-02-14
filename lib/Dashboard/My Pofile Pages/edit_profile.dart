import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/My%20Pofile%20Pages/Support%20&%20Privacy/support_privacy_2.dart';
import 'package:forpartum/Dashboard/My%20Pofile%20Pages/personal_info.dart';

import '../../helper/textStyleHelper.dart';
import 'Notifications/notifications_screen.dart';
import 'Support & Privacy/support_privacy_1.dart';
import 'dart:io';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  @override
  void initState() {
    super.initState();

    // Fetch the current user's data
    fetchUserData();
  }

  String userFullName = '';
  String usercountry = '';
  String _profilePicUrl = ''; // Add this line
  File? _file;

  var settingsOptions = {
    "1" : "Account Settings",
    "2" : "Notification",
    "3" : "Support",
    "4" : "Privacy Policy",
  };

  final List<dynamic> _settingsIcons = [
    Icons.edit_outlined,
    Icons.notifications_outlined,
    Icons.support_agent_outlined,
    Icons.privacy_tip_outlined,
  ];

  int selectedIndex = -1;





  Future<void> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);
      final userData = await userDoc.get();
      final data=userData.data();

      if (data!=null) {
        setState(() {
          userFullName = data['fullName'] ?? '';
          usercountry =data['country'] ?? '';

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

    final List<dynamic> settingsRoutes =[
      const PersonalInfo(), const NotificationScreen() , const SupportAndPrivacyScreen() , const SupportAndPrivacyScreen2()
    ];
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [


            /// ===== Edit Profile Header ====
            Stack(
              children: [
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: TextStyleHelper().mytext('Edit Profile', 20, FontWeight.w600, textColor)
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                        alignment: AlignmentDirectional.center,
                        child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/images/back_image.png'))),
                  ),)
              ],
            ),

            /// ===== Top Divider ======
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child:  Divider(thickness: 2,),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      margin: const EdgeInsets.only(left: 30, right: 20),
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

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextStyleHelper().mytext(userFullName, 16, FontWeight.w600, textColor),
                        const SizedBox(height: 3,),
                        TextStyleHelper().mytext(usercountry, 12, FontWeight.w500, Colors.grey)
                      ],
                    )
                  ],
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Icon(Icons.logout,
                    color: textColor,size: 28,),
                )
              ],
            ),

            /// ===== Bottom Divider ======
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child:  Divider(thickness: 2,),
            ),

            /// ==== Settings options =====
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,bottom: 40),
              child: Wrap(
                children: List.generate(settingsOptions.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> settingsRoutes[index]));
                          },
                        contentPadding: const EdgeInsets.all(10),
                        title: TextStyleHelper().mytext(settingsOptions.values.elementAt(index), 16, FontWeight.w600, textColor),
                        leading: Container(
                          height: 50, width: 50,
                          decoration:  BoxDecoration(
                              color: const Color(0XFFFFEDE5),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child:  Icon(_settingsIcons[index],
                            color: const Color(0XFFEF6844),),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                        color: textColor,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
