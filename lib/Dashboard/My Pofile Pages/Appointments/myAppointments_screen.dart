import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/navigator_bottom_bar.dart';
import 'package:forpartum/helper/mycustombutton.dart';

import '../../../helper/mycustomcolor.dart';
import '../../../helper/textStyleHelper.dart';

class MyAppointmentsScreen extends StatefulWidget {
  const MyAppointmentsScreen({super.key});

  @override
  State<MyAppointmentsScreen> createState() => _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    TabController tabController = TabController(length: 2, vsync: this);
    return  Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ==== Top App Bar =====
            Stack(
              children: [
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: TextStyleHelper().mytext('My Appointments', 20, FontWeight.w600, textColor)
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
                  ),),
              ],
            ),

            /// ===== Tab bar (Upcoming|Past)====
            Container(
              height: 64,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 20, bottom: 20),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: boxColor,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: <Widget>[
                      ButtonsTabBar(
                        controller: tabController,
                        backgroundColor: MyCustomColor().mMainColor(),
                        unselectedBackgroundColor: boxColor,
                        labelStyle: TextStyle(
                            color: boxColor, //Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        unselectedLabelStyle: TextStyle(
                            color: MyCustomColor().mMainColor(),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        unselectedBorderColor: boxColor,
                        contentPadding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                        buttonMargin:
                        const EdgeInsets.symmetric(horizontal: 20),
                        radius: 100,
                        tabs: const [
                          Tab(text: 'Upcoming'),
                          Tab(text: 'Past'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// ===== Tab Bar View =====
            Column(
              children: [
                SizedBox(
                  height: appHeight /1.2,
                  width: double.maxFinite,
                  child: TabBarView(
                      controller: tabController,
                      children:   [
                        const AppointmentsUpcoming(),
                        AppointmentsPast()
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

///______________________________________________________________________________________________
/// My Appointments Upcoming View
class AppointmentsUpcoming extends StatelessWidget {
  const AppointmentsUpcoming({super.key});

  @override
  Widget build(BuildContext context) {
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return  Column(
      children: [

        const SizedBox(height: 30),
        Container(
          width: appWidth,
          decoration: const BoxDecoration(
            //image: DecorationImage(image: AssetImage(assetName))
          ),
        )
        

      ],
    );
  }
}

///_________________________________________________________________________________________________________________
/// My Appointments Upcoming View
class AppointmentsPast extends StatelessWidget {
   AppointmentsPast({super.key});

  final List<String> accountsName = [
    'Mary Lukacha', 'Tami Jones', 'Brooke Reed'
  ];

  final List<String> accountsInfo = [
    'Pelvic Floor Therapist  3 yrs of exp.', 'IBCLC. 5 yrs of exp.', 'Therapist. 10 yrs of exp.'
  ];

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),

          Wrap(
            children: List.generate(3, (index) {
              return AppointmentBox(accountName: accountsName[index], accountInfo: accountsInfo[index]);
            }),
          )
        ],
      ),
    );
  }
}

class AppointmentBox extends StatelessWidget {
  final String accountName;
  final String accountInfo;
  const AppointmentBox({super.key,
    required this.accountName,
    required this.accountInfo
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 255, width: appWidth,
      margin: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 40,
              offset: const Offset(0,10)
          )]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Column(
          children: [

            /// >>> Account Details
            Row(
              children: [
                /// >>> Account Image
                Container(
                  height: 60,width: 60,
                  decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage('assets/images/profile_pic.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(100)
                  ),
                ),
                const SizedBox(width: 15,),
                /// >>> Account Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextStyleHelper().mytext(accountName, 16, FontWeight.w600, MyCustomColor().mMainColor()),
                    const SizedBox(height: 4,),
                    TextStyleHelper().mytext(accountInfo, 12,
                        FontWeight.w500, Colors.grey),
                  ],
                )
              ],
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child:  Divider(thickness: 1.5,),
            ),

            /// >>> Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppIcon(iconPath: 'assets/icons/Video.png'),
                        const SizedBox(width: 10,),
                        TextStyleHelper().mytext('Video Call', 12, FontWeight.w500, Colors.grey)
                      ],
                    ),
                    Row(
                      children: [
                        AppIcon(iconPath: 'assets/icons/Vector.png'),
                        const SizedBox(width: 10,),
                        TextStyleHelper().mytext('Rated by 4.8', 12, FontWeight.w500, Colors.grey)
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppIcon(iconPath: 'assets/icons/Heart.png'),
                        const SizedBox(width: 10,),
                        TextStyleHelper().mytext('Liked by 532 People', 12, FontWeight.w500, Colors.grey)
                      ],
                    ),
                    Row(
                      children: [
                        AppIcon(iconPath: 'assets/icons/TimeCircle.png'),
                        const SizedBox(width: 10,),
                        TextStyleHelper().mytext('Yesterday', 12, FontWeight.w500, Colors.grey)
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 15,),
            ///>>> Appointment Round Button
            RoundButton(
                text: 'Reappointment',
                textColor: Colors.white, backgroundColor: MyCustomColor().mSecondaryColor(),
                borderColor: MyCustomColor().mSecondaryColor(),
                height: 40, width: appWidth, radius: 20,
                onClick: (){

                })
          ],
        ),
      ),
    );
  }
}
