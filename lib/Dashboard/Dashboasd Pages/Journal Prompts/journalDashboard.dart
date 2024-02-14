import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/My%20Pofile%20Pages/Notifications/notifications_screen.dart';
import 'package:forpartum/Dashboard/navigator_bottom_bar.dart';
import 'package:forpartum/helper/mycustombutton.dart';

import '../../../helper/mycustomcolor.dart';
import '../../../helper/textStyleHelper.dart';
import 'addJournalPrompt.dart';

class JournalPromptsDashboard extends StatefulWidget {
  const JournalPromptsDashboard({super.key});

  @override
  State<JournalPromptsDashboard> createState() => _JournalPromptsDashboardState();
}

class _JournalPromptsDashboardState extends State<JournalPromptsDashboard> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ===== Top App Bar  ====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      margin:
                      const EdgeInsets.only(top: 40, left: 20, right: 20),
                      alignment: AlignmentDirectional.topEnd,
                      child: Image.asset('assets/icons/menu.png')),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: TextStyleHelper().mytext(
                        'Journal Prompts', 20, FontWeight.w600, textColor)),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const NotificationScreen()));
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(top: 40,left: 20, right: 20),
                      alignment: AlignmentDirectional.center,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/icons/notification.png'))
                      ),
                      ),
                ),
              ],
            ),

            /// ===== Tab Bar (All|Motherhood|Birth|Relations) ======
            Container(
              height: 64,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 30, bottom: 10),
              decoration: BoxDecoration(
                color: boxColor,
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
                          Tab(text: 'All'),
                          Tab(text: 'Motherhood'),
                          Tab(text: 'Birth'),
                          Tab(text: 'Relations'),
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
                  height: appHeight*1.4/2,
                  width: appWidth,
                  child: TabBarView(controller: tabController, children: const [
                    SingleChildScrollView(child: AllJournalView()),
                    SingleChildScrollView(child: AllJournalView()),// SingleChildScrollView(child: MotherhoodJournalView()),
                    SingleChildScrollView(child: AllJournalView()),// SingleChildScrollView(child: BirthJournalView()),
                    SingleChildScrollView(child: AllJournalView()),// SingleChildScrollView(child: RelationsJournalView())
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


/// >>>> All <<<< Tab Bar View
class AllJournalView extends StatelessWidget {
  const AllJournalView({super.key});

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
          height: 300, width: appWidth,
          margin: const EdgeInsets.only(top: 30,left: 30,right: 30),
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(25),
              boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 30, offset: const Offset(0, 10)
              )]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// image box <<<<
              Container(
                height: 179, width: appWidth,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(image: AssetImage('assets/articles/Journal01.png'),
                  fit: BoxFit.fitWidth
                  )
                ),
              ),
              /// content <<<<<
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextStyleHelper().mytext('Matrescence', 22, FontWeight.w600, textColor),
                    const SizedBox(height: 5,),
                    TextStyleHelper().mytext('Start with The Basics', 12, FontWeight.w400, textColor),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              AppIcon(iconPath: 'assets/icons/sweetHeart.png',
                              iconColor: MyCustomColor().mMainColor(), iconSize: 18,
                              ),
                              const SizedBox(width: 6,),
                              TextStyleHelper().mytext('9 Sessions', 10, FontWeight.w500, MyCustomColor().mMainColor()),
                            ],
                          ),
                        ),
                        RoundButton(
                            text: 'Start',
                            textColor: Colors.white,
                            backgroundColor: MyCustomColor().mSecondaryColor(),
                            borderColor: MyCustomColor().mSecondaryColor(),
                            height: 35, width: 70, radius: 50,
                            onClick: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> const AddJournalPrompt()));
                            })
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

        /// ===== Mini Boxes ====
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 4,
              child: MiniBoxJournal(
                  title: 'Healing From', subtitle: 'Ashna Mukherjee',
                  noOfSessions: '5 Sessions', boxImagePath: 'assets/articles/Journal02.png',
                  onClickStart: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const AddJournalPrompt()));
                  }),
            ),
            Expanded(
              flex: 4,
              child: MiniBoxJournal(
                  title: 'Mood Diaries', subtitle: 'Peter Mach',
                  noOfSessions: '6 Sessions', boxImagePath: 'assets/articles/Journal03.png',
                  onClickStart: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const AddJournalPrompt()));
                  }),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 4,
              child: MiniBoxJournal(
                  title: 'Postpartum Body', subtitle: 'Ashna Mukherjee',
                  noOfSessions: '9 Sessions', boxImagePath: 'assets/articles/Journal04.png',
                  onClickStart: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const AddJournalPrompt()));
                  }),
            ),
            Expanded(
              flex: 4,
              child: MiniBoxJournal(
                  title: 'Mood Diaries', subtitle: 'Peter Mach',
                  noOfSessions: '8 Sessions', boxImagePath: 'assets/articles/Journal05.png',
                  onClickStart: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const AddJournalPrompt()));
                  }),
            ),
          ],
        ),
        const SizedBox(height: 40,),
      ],
    );
  }
}

class MiniBoxJournal extends StatelessWidget {
  String title;
  String subtitle;
  String noOfSessions;
  String boxImagePath;
  final VoidCallback onClickStart;
   MiniBoxJournal({super.key,
    required this.title, required this.subtitle,
    required this.noOfSessions, required this.boxImagePath,
    required this.onClickStart
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 150, width: appWidth,
      margin: const EdgeInsets.only(top: 30,left: 30,right: 30),
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 30, offset: const Offset(0, 10)
          )]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// image box <<<<
          Container(
            height: 84.1, width: appWidth,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image:  DecorationImage(image: AssetImage(boxImagePath),
                    fit: BoxFit.fitWidth
                )
            ),
          ),
          /// content <<<<<
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextStyleHelper().mytext(title, 14, FontWeight.w600, textColor),
                const SizedBox(height: 2.5,),
                TextStyleHelper().mytext(subtitle, 8, FontWeight.w400, textColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          AppIcon(iconPath: 'assets/icons/sweetHeart.png', iconSize: 9,
                          ),
                          const SizedBox(width: 3,),
                          TextStyleHelper().mytext(noOfSessions, 8, FontWeight.w500, Colors.grey),
                        ],
                      ),
                    ),
                    RoundButton(
                        text: 'Start',
                        textSize: 8,
                        textColor: Colors.white,
                        backgroundColor: MyCustomColor().mMainColor(),
                        borderColor: MyCustomColor().mMainColor(),
                        height: 16, width: 33, radius: 50,
                        onClick: (){
                          onClickStart();
                        })
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///_____________________________________________________________________________
/// >>>> Motherhood <<<< Tab Bar View
class MotherhoodJournalView extends StatelessWidget {
  const MotherhoodJournalView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// >>>> Birth <<<< Tab Bar View
class BirthJournalView extends StatelessWidget {
  const BirthJournalView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// >>>> Relations <<<< Tab Bar View
class RelationsJournalView extends StatelessWidget {
  const RelationsJournalView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
