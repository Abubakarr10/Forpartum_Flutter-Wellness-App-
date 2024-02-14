import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/screens/login_screen.dart';

import '../../helper/textStyleHelper.dart';
import 'app_themes.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});



  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {

  
  Future<void> _signOut() async {
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure you want to sign out?'),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: MyCustomColor().mMainColor(),
            ),
            onPressed: ()  {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: TextStyleHelper().mytext('Yes', 16, FontWeight.w600, Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MyCustomColor().mSecondaryColor().withOpacity(0.6),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: TextStyleHelper().mytext('No', 16, FontWeight.w500, Colors.white),
            ),
          ),
        ],
      ),
    );

    if (result == true) {
      // User confirmed sign out
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }


  var settingsOptions = {
    "1" : "Change Password",
    "2" : "Notification",
    "3" : "Privacy Policy",
    "4" : "Payment",
    "5" : "Sign Out",
  };

  var moreOptions = {
    "1" : "Newsletter",
    "2" : "Text Message",
    "3" : "Phone Call",
  };

  var moreOptions2 = {
    "1" : "Themes",
    "2" : "Currency",
    "3" : "Language",
    "4" : "Linked Account",
  };


  var moreOptionsTrailing = {
    "1" : "Light Mode",
    "2" : "\$  USD",
    "3" : "English",
    "4" : "Social Media",

  };
  final List<dynamic> routesMoreOptionsTrailing =[
    const AppThemesSettings(), const AppThemesSettings() , const AppThemesSettings() , const AppThemesSettings()
  ];
  ///________________________________________
  final List<dynamic> _settingsIcons = [
    Icons.edit_outlined,
    Icons.notifications_outlined,
    Icons.privacy_tip_outlined,
    Icons.payment,
    Icons.logout_outlined
  ];

  final List<dynamic> moreIcons = [
    Icons.email_outlined,
    Icons.sms_outlined,
    Icons.call,
  ];

  final List<dynamic> moreIcons2 = [
    Icons.dark_mode_outlined,
    Icons.currency_exchange_outlined,
    Icons.language_outlined,
    Icons.link_outlined,
  ];

  bool selectedIndex = true;
  List<bool> onANDoff = [
    true,
    true,
    true,
  ];


  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ====Header Settings=====
            Stack(
              children: [
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: TextStyleHelper().mytext('Settings', 20, FontWeight.w600, Theme.of(context).colorScheme.secondary)
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

            /// ====== Account Settings =====
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext("Account", 18, FontWeight.w600, Theme.of(context).colorScheme.secondary)),
            ) ,
            /// ===== Top Divider ======
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              child:  Divider(thickness: 2,),
            ),

            /// ==== Account Settings options =====
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Wrap(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: ListTile(
                        onTap: (){
                          if(index==4){
                            _signOut();
                          }
                        //  Navigator.push(context, MaterialPageRoute(
                        //      builder: (context)=> const PersonalInfo()));
                        },
                        contentPadding: const EdgeInsets.all(10),
                        title: TextStyleHelper().mytext(settingsOptions.values.elementAt(index),
                            16, FontWeight.w600, Theme.of(context).colorScheme.secondary),
                        leading: Container(
                          height: 50, width: 50,
                          decoration:  BoxDecoration(
                              color: const Color(0XFFB1AFE9),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child:  Icon(_settingsIcons[index],
                            color: Colors.white,),
                        ),
                        trailing:  Icon(Icons.arrow_forward_ios,
                                      color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            /// ====== More Option =====
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper()
                      .mytext("More Option", 18, FontWeight.w600,
                      Theme.of(context).colorScheme.secondary)),
            ),
            /// ===== Second Divider ======
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Divider(
                thickness: 2,
              ),
            ),

            Wrap(
              children: List.generate(3, (index) {
                return OnOFFCard(
                  title: moreOptions.values.elementAt(index),
                  iconData: moreIcons[index],
                  onAndOff: onANDoff[index],
                  onClick: () {
                    setState(() {
                      onANDoff[index] = !onANDoff[index];
                    });
                  },
                );
              }),
            ),

            Wrap(
              children: List.generate(moreOptions2.length, (index) {
                // Dynamically set the text based on the current theme mode
                final trailingText =
                themeMode == Brightness.light ? "Light Mode" : "Dark Mode";
                return CardMultiShow(
                  title: moreOptions2.values.elementAt(index),
                  iconData: moreIcons2[index],
                  trailingText: trailingText,
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            routesMoreOptionsTrailing[index]));
                  },
                );
              }),
            ),

            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

/// >>> Custom Card with On and Off
class OnOFFCard extends StatelessWidget {
  final String title;
  IconData iconData;
  bool onAndOff;
  final VoidCallback onClick;
   OnOFFCard({super.key,
  required this.title,
    required this.iconData,
     required this.onClick,
     this.onAndOff=true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: ListTile(
            onTap: (){
              //  Navigator.push(context, MaterialPageRoute(
              //      builder: (context)=> const PersonalInfo()));
            },
            contentPadding: const EdgeInsets.all(10),
            title: TextStyleHelper().mytext(title, 16, FontWeight.w600, Theme.of(context).colorScheme.secondary),
            leading: Container(
              height: 50, width: 50,
              decoration:  BoxDecoration(
                  color: const Color(0XFFB1AFE9),
                  borderRadius: BorderRadius.circular(10)
              ),
              child:   Icon(iconData,
                color: Colors.white,),
            ),
            trailing: InkWell(
              onTap: (){
                onClick();
              },
              child: onAndOff == true? const OnButton() :
              const OffedButton(),
            )
        ),
      ),
    );
  }
}

class OnButton extends StatelessWidget {
  const OnButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25, width: 45,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: const Color(0XFFB1AFE9),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: Container(
          height: 12, width: 12,
          margin: const EdgeInsets.only(right: 3,top: 3,bottom: 3),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(200)
          ),
        ),
      ),
    );
  }
}

class OffedButton extends StatelessWidget {
  const OffedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25, width: 45,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: MyCustomColor().mMainColor(),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 22),
        child: Container(
          height: 15, width: 15,
          margin: const EdgeInsets.only(left: 3,top: 3,bottom: 3),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(200)
          ),
        ),
      ),
    );
  }
}


class CardMultiShow extends StatelessWidget {
final String title;
final String trailingText;
IconData iconData;
final VoidCallback onClick;
   CardMultiShow({super.key,
  required this.title,
    required this.iconData,
    required this.trailingText,
     required this.onClick,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: InkWell(
          onTap: (){
            onClick();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50, width: 50,
                      decoration:  BoxDecoration(
                          color: const Color(0XFFB1AFE9),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child:  Icon(iconData,
                        color: Colors.white,),
                    ),
                    const SizedBox(width: 15,),
                    TextStyleHelper().mytext(title, 16, FontWeight.w600, Theme.of(context).colorScheme.secondary),
                  ],
                ),
                 Container(
                  height: 50, width: 100,
                  margin: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: TextStyleHelper().mytext(trailingText, 14, FontWeight.w500, MyCustomColor().mMainColor())),
                      const SizedBox(width: 4,),
                      Icon(Icons.arrow_forward_ios,
                        color: MyCustomColor().mMainColor(),size: 14,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

