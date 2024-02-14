import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../../../helper/mycustomcolor.dart';
import '../../../helper/textStyleHelper.dart';

class SupportAndPrivacyScreen2 extends StatefulWidget {
  const SupportAndPrivacyScreen2({super.key});

  @override
  State<SupportAndPrivacyScreen2> createState() => _SupportAndPrivacyScreen2State();
}

class _SupportAndPrivacyScreen2State extends State<SupportAndPrivacyScreen2> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ===== Support Header ====
            Stack(
              children: [
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: TextStyleHelper().mytext('Support', 20, FontWeight.w600, textColor)
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

            /// ===== TabBar (Support|PrivacyPolicy) ========
            Container(
              height: 60,
              width: appWidth,
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 20, bottom: 20),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: boxColor,
                ),
                boxShadow: [
                  BoxShadow(
                    color: boxColor,
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: <Widget>[
                      ButtonsTabBar(
                        controller: tabController,
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
                        unselectedBorderColor: Colors.white,
                        contentPadding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                        buttonMargin: const EdgeInsets.symmetric(horizontal: 20),
                        radius: 100,
                        tabs: const [
                          Tab(text: 'Support'),
                          Tab(text: 'Privacy Policy'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// ===== TabBar View =====
            Column(
              children: [
                SizedBox(
                  height: appHeight * 1.12 ,
                  width: double.maxFinite,
                  child: TabBarView(
                      controller: tabController,
                      children: const [
                        Support(),
                        PrivacyPolicy()
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

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Column(
      children: [

        /// ====== Question ======
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext('How to delete account?', 18, FontWeight.w500, textColor)),
              const SizedBox(height: 10,),
              RichText(
                textScaleFactor: 1,
                text: const
              TextSpan(
                children: [
                  TextSpan(
                    text: 'When an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently.',
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey,letterSpacing: 1,wordSpacing: 1),
                  ),
                  WidgetSpan(child: SizedBox(height: 10,)),
                  TextSpan(
                    text: "\n\n\nweb page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web site.",
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey,letterSpacing: 1,wordSpacing: 1),
                  ),
                  ]
                ),
              ),
              const SizedBox(height: 20,),
              Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext('Last Updated: June 4,2023', 12, FontWeight.w500, textColor)),
              const SizedBox(height: 20,),
              RichText(
                textScaleFactor: 1,
                text: const
                TextSpan(
                    children: [
                      TextSpan(
                        text: 'When an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently.',
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey,letterSpacing: 1,wordSpacing: 1),
                      ),
                      WidgetSpan(child: SizedBox(height: 10,)),
                      TextSpan(
                        text: "\n\n\nweb page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web site.",
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey,letterSpacing: 1,wordSpacing: 1),
                      ),
                    ]
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}


class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Column(
      children: [

        TextStyleHelper().mytext('Hello Privacy', 22, FontWeight.bold,textColor ),
        /// ====== Question ======
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext('How to delete account?', 18, FontWeight.w500, textColor)),
              const SizedBox(height: 10,),
              RichText(
                textScaleFactor: 1,
                text: const
                TextSpan(
                    children: [
                      TextSpan(
                        text: 'When an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently.',
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey,letterSpacing: 1,wordSpacing: 1),
                      ),
                      WidgetSpan(child: SizedBox(height: 10,)),
                      TextSpan(
                        text: "\n\n\nweb page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web site.",
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey,letterSpacing: 1,wordSpacing: 1),
                      ),
                    ]
                ),
              ),
              const SizedBox(height: 20,),
              Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext('Last Updated: June 4,2023', 12, FontWeight.w500, textColor)),
              const SizedBox(height: 20,),
              RichText(
                textScaleFactor: 1,
                text: const
                TextSpan(
                    children: [
                      TextSpan(
                        text: 'When an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently.',
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey,letterSpacing: 1,wordSpacing: 1),
                      ),
                      WidgetSpan(child: SizedBox(height: 10,)),
                      TextSpan(
                        text: "\n\n\nweb page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web site.",
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey,letterSpacing: 1,wordSpacing: 1),
                      ),
                    ]
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
