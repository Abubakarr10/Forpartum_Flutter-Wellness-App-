import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/My%20Pofile%20Pages/Notifications/notifications_screen.dart';
import 'package:forpartum/Dashboard/My%20Pofile%20Pages/app_settings.dart';
import 'package:forpartum/Dashboard/Tracker%20Pages/tracker_dashboard.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';
import 'package:forpartum/screens/Side%20Menu%20Bar/side_menu_title.dart';

import '../../Dashboard/Dashboasd Pages/Journal Prompts/journalDashboard.dart';
import '../../Dashboard/My Pofile Pages/edit_profile.dart';
import '../../Dashboard/My Pofile Pages/myappointmentsscreen1.dart';
import '../../Dashboard/My Pofile Pages/mypayments.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  bool selectedOption = false;
  int selectedIndex = -1;

  List sideBarRoute = [
    const EditProfileScreen(), const MyAppointmentsScreen1() , const JournalPromptsDashboard() , const MyAppointmentsScreen1(),
    const MyAppointmentsScreen1(), const MyPaymentsScreen1() , const TrackerDashboard() , const EditProfileScreen(),
    const NotificationScreen(), const AppSettings()
  ];

  Map<int,bool> optionsSideMenu = {
    1 : false,
    2 : false,
    3 : false,
    4 : false,
    5 : false,
    6 : false,
    7 : false,
    8 : false,
    9 : false,
    10 : false,
  };

  Map titleIcons = {
    "My Profile" : "assets/icons/sideProfile.png",
    "Insights" : "assets/icons/sideStar.png",
    "My Journal" : "assets/icons/sideWomen.png",
    "Appointments" : "assets/icons/sideAppointments.png",
    "Invite Friends" : "assets/icons/sideInvite.png",
    "My Payment" : "assets/icons/sidePayment.png",
    "My Tracker" : "assets/icons/sideLocation.png",
    "Chat" : "assets/icons/sideChat.png",
    "Notifications" : "assets/icons/sideBell.png",
    "Settings" : "assets/icons/sideSettings.png",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288, height: double.infinity,
        color: MyCustomColor().mSecondaryColor(),
        child: SafeArea(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 60,bottom: 40),
                child: ListTile(
                  leading: Container(
                    height: 58, width: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(image: AssetImage('assets/images/profile_pic.jpg'),
                      fit: BoxFit.cover)
                    ),
                  ),
                  title: TextStyleHelper().mytext('Ayesha Ahmad', 20, FontWeight.w600, Colors.white),
                  subtitle: TextStyleHelper().mytext('lucymartin@gmail.com', 14, FontWeight.w400, Colors.white),
                ),
              ),

              /// Icons here side bar menu
              Wrap(
                children: List.generate(10, (index) {
                  return InkWell(
                      onTap: (){
                        setState(() {
                        //  selectedOption = !selectedOption;
                          selectedIndex = index;
                          if (kDebugMode) {
                            print(selectedOption.toString());
                          }
                        });
                      },
                      child: selectedIndex == index
                          ? SideMenuTitleSelected(
                        title: titleIcons.keys.elementAt(index),
                        iconPath: titleIcons.values.elementAt(index),
                        buttonOnTap: (){
                        setState(() {
                          //selectedOption = !selectedOption;
                          //selectedIndex = index;
                          Future.delayed(const Duration(milliseconds: 80), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => sideBarRoute[index],
                              ),
                            );
                          });
                        });
                      },)
                          : SideMenuTitle(
                        title: titleIcons.keys.elementAt(index),
                        iconPath: titleIcons.values.elementAt(index),
                        buttonOnTap: (){
                        setState(() {
                        //  selectedOption = !selectedOption;
                           selectedIndex = index;
                           Future.delayed(const Duration(milliseconds: 30), () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) => sideBarRoute[index],
                               ),
                             );
                           });
                          if (kDebugMode) {
                            print(selectedOption.toString());
                          }
                        });
                      },));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
