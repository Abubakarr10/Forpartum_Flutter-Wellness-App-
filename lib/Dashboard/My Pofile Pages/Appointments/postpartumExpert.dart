import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

import '../../../helper/mycustomcolor.dart';
import '../Notifications/notifications_screen.dart';

class PostpartumExpert extends StatefulWidget {
  const PostpartumExpert({super.key});

  @override
  State<PostpartumExpert> createState() => _PostpartumExpertState();
}

class _PostpartumExpertState extends State<PostpartumExpert> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [

          /// ===== Header =====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                    alignment: AlignmentDirectional.topEnd,
                    child: Image.asset('assets/images/back_image.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  'Postpartum Experts',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
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
                    margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                    alignment: AlignmentDirectional.topEnd,
                    child: Image.asset('assets/icons/active_notification.png')),
              ),
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
                        Tab(text: 'Online'),
                        Tab(text: 'In-Person'),
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
                    children:   const [
                      OnlineExperts(),
                      InPersonExperts()
                    ]
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


///_____________________________________________________________________________
class OnlineExperts extends StatelessWidget {
  const OnlineExperts({super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [

        Container(
          height: 80, width: appWidth,
          margin: const EdgeInsets.only(left: 30,right: 30,top: 20),
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 40, offset: const Offset(0,10)
            )]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Row(
                  children: [
                    ///>>> Profile Image
                    Container(
                      height: 50,width: 50,
                      decoration: BoxDecoration(
                          image: const DecorationImage(image: AssetImage('assets/images/profile_pic.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(100)
                      ),
                    ),
                    const SizedBox(width: 10,),
                    ///>>> Account Info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextStyleHelper().mytext('Jimmy Lukacha', 12, FontWeight.w500, textColor),
                        TextStyleHelper().mytext('Body Specialist | 8 Years of Exp',
                            10, FontWeight.w500, MyCustomColor().mMainColor())
                      ],
                    )

                  ],
                ),
                const Row(
                  children: [
                   // AppIcon(iconPath: 'iconPath')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}


///_____________________________________________________________________________
class InPersonExperts extends StatelessWidget {
  const InPersonExperts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
