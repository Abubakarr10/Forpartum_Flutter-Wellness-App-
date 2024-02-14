import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustombutton.dart';

import '../../../helper/mycustomcolor.dart';
import '../../../helper/textStyleHelper.dart';
import '../../navigator_bottom_bar.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> with
    TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ===== Header =====
            Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                            //  alignment: AlignmentDirectional.topEnd,
                            child: Image.asset('assets/images/back_image.png')),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextStyleHelper().mytext('Postpartum Resources', 20, FontWeight.w600, textColor),
                        ],
                      ),
                    ),
                  ),
                ]
            ),

            /// ===== Tab Bar (Resources|Panic Mode) ======
            Container(
              height: 64,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 30, bottom: 10,left: 30,right: 30),
              decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: boxColor,
                  ),
                  boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 30, offset: const Offset(0, 10)
                  )]
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: <Widget>[
                      ButtonsTabBar(
                        controller: tabController,
                        /// >> styles and colors
                        backgroundColor: MyCustomColor().mMainColor(),
                        unselectedBackgroundColor: boxColor,
                        labelStyle: const TextStyle(
                            color: Colors.white, //Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                        unselectedLabelStyle: TextStyle(
                            color: MyCustomColor().mMainColor(),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                        unselectedBorderColor: boxColor,

                        contentPadding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 30, right: 30),
                        buttonMargin:
                        const EdgeInsets.symmetric(horizontal: 30),
                        radius: 100,
                        tabs: const [
                          Tab(text: 'Resources'),
                          Tab(text: 'Panic Mode'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// ===== Tab Bar View ====
            Column(
              children: [
                SizedBox(
                  height: appHeight*1.1,
                  width: appWidth,
                  child: TabBarView(controller: tabController, children: const [
                    SingleChildScrollView(
                        child: ResourcesTabView()),
                    PanicModeView()
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Resources Tab View
class ResourcesTabView extends StatelessWidget {
  const ResourcesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appWidth = MediaQuery.of(context).size.width;
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30,top: 40,bottom: 30),
          child: Align(
              alignment: Alignment.centerLeft,
              child: TextStyleHelper().mytext('Postpartum Resource', 22, FontWeight.w600, textColor)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30,right: 30,bottom: 30),
          child: Align(
              alignment: Alignment.centerLeft,
              child: TextStyleHelper().mytext("when an unknown printer took a "
              "galley of type and scrambled it to make a type specimen book. It has "
              "survived not only five centuries, but also the leap into electronic"
              "typesetting, remaining essentially unchanged. It was popularised in"
              "the 1960s with the release of Letraset sheets containing Lorem Ipsum"
              "passages, and more recently.\n\n"
              "web page editors now use Lorem Ipsum as their default model text, and"
                  "a search for 'lorem ipsum' will uncover many web site.", 14, FontWeight.w500, Colors.grey)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30,right: 30,bottom: 30),
          child: Align(
              alignment: Alignment.centerLeft,
              child: TextStyleHelper().mytext("when an unknown printer took a "
                  "galley of type and scrambled it to make a type specimen book. It has "
                  "survived not only five centuries, but also the leap into electronic"
                  "typesetting, remaining essentially unchanged. It was popularised in"
                  "the 1960s with the release of Letraset sheets containing Lorem Ipsum"
                  "passages, and more recently.\n\n"
                  "web page editors now use Lorem Ipsum as their default model text, and"
                  "a search for 'lorem ipsum' will uncover many web site.", 14, FontWeight.w500, Colors.grey)),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
          child: RoundButton(
              text: 'Postpartum Professional Directory  ',
              textColor: Colors.white,
              backgroundColor: MyCustomColor().mMainColor(),
              borderColor: MyCustomColor().mMainColor(),
              height: 60, width: appWidth, radius: 100,
              onClick: (){

              }),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 30,top: 40,bottom: 30),
          child: Align(
              alignment: Alignment.centerLeft,
              child: TextStyleHelper().mytext('Emergency ', 22, FontWeight.w600, textColor)),
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
                   // Navigator.push(context,
                        //MaterialPageRoute(builder: (context)=> const JournalPromptsDashboard()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.phone_outlined,
                      color: textColor, size: 24,),
                      TextStyleHelper().mytext('Help Call', 14, FontWeight.w700, textColor)
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
                 //   Navigator.push(context,
                   //     MaterialPageRoute(builder: (context)=>const ResourcesPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppIcon(iconPath: 'assets/icons/bot.png',iconColor: textColor,
                        iconSize: 24,),
                      TextStyleHelper().mytext('Talk to AI', 14, FontWeight.w700, textColor)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        Container(
          height: 100, width: appWidth,
          margin: const EdgeInsets.only(top: 40,left: 30,right: 30,bottom: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                colors: [Colors.white,Colors.pink],
              begin: Alignment.topCenter, end: Alignment.bottomCenter
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextStyleHelper().mytext('Breathing routine', 22, FontWeight.w800, Colors.black),
                TextStyleHelper().mytext('Talk Lets get started ->', 16, FontWeight.w700, Colors.white),
              ],
            ),
          ),
        ),
        Container(
          height: 160, width: appWidth,
          margin: const EdgeInsets.only(left: 30,right: 30,bottom: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                colors: [Colors.white,Colors.pink],
                begin: Alignment.topCenter, end: Alignment.bottomCenter
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextStyleHelper().mytext('Look around', 22, FontWeight.w800, Colors.black),
                TextStyleHelper().mytext('Name 5 things you see, 4 you hear, 3 you smell, 2 you feel and 1 you taste.',
                    14, FontWeight.w400, Colors.black),
                TextStyleHelper().mytext('Talk to your the rapist', 16, FontWeight.w700, Colors.white),
              ],
            ),
          ),
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Set up panic mode',style: TextStyle(
              fontSize: 16,fontWeight: FontWeight.w600,fontFamily:'Poppins' ,color: MyCustomColor().mMainColor(),
              decoration: TextDecoration.underline
            ),),
            Text('My friend needs help',style: TextStyle(
                fontSize: 16,fontWeight: FontWeight.w600,fontFamily:'Poppins' ,color: MyCustomColor().mMainColor(),
                decoration: TextDecoration.underline
            ),),
          ],
        ),
        const SizedBox(height: 40,),
      ],
    );
  }
}

/// Panic Mode
class PanicModeView extends StatelessWidget {
  const PanicModeView({super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30,top: 40,bottom: 30),
          child: Align(
              alignment: Alignment.centerLeft,
              child: TextStyleHelper().mytext('Panic Mode', 22, FontWeight.w600, textColor)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30,right: 30,bottom: 30),
          child: Align(
              alignment: Alignment.centerLeft,
              child: TextStyleHelper().mytext("An easy way to set up for future safety,"
                  "when you need to talk to someone or any sort of help at any time."
                  "A step towards better mental health ", 14, FontWeight.w500, Colors.grey)),
        ),
        Container(
          height: 160, width: appWidth,
          margin: const EdgeInsets.only(left: 30,right: 30,bottom: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: [Colors.grey.shade50,MyCustomColor().mSecondaryColor()],
                begin: Alignment.topCenter, end: Alignment.bottomCenter
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextStyleHelper().mytext('Double tap off button', 22, FontWeight.w800, Colors.black),
                TextStyleHelper().mytext('Every time you press your off button twice, it will call your desired choice of person.',
                    14, FontWeight.w400, Colors.black),
                Row(
                  children: [
                    TextStyleHelper().mytext('Set now', 16, FontWeight.w700, Colors.black),
                    const SizedBox(width: 8,),
                    const Icon(Icons.play_circle_fill_outlined,
                    color: Colors.black,)
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 160, width: appWidth,
          margin: const EdgeInsets.only(left: 30,right: 30,bottom: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: [Colors.grey.shade50,MyCustomColor().mSecondaryColor()],
                begin: Alignment.topCenter, end: Alignment.bottomCenter
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextStyleHelper().mytext('Triple tap video call', 22, FontWeight.w800, Colors.black),
                TextStyleHelper().mytext('Automated video call with certified therapist on pressing the home button thrice.',
                    14, FontWeight.w400, Colors.black),
                Row(
                  children: [
                    TextStyleHelper().mytext('Set now', 16, FontWeight.w700, Colors.black),
                    const SizedBox(width: 8,),
                    const Icon(Icons.play_circle_fill_outlined,
                    color: Colors.black,)
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
