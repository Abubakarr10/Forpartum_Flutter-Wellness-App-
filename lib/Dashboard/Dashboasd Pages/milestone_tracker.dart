import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Dashboasd%20Pages/reflectRecord.dart';
import 'package:forpartum/helper/mycustombutton.dart';

import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';

class DbMilestoneTrackerScreen extends StatefulWidget {
  const DbMilestoneTrackerScreen({super.key});

  @override
  State<DbMilestoneTrackerScreen> createState() =>
      _DbMilestoneTrackerScreenState();
}

class _DbMilestoneTrackerScreenState extends State<DbMilestoneTrackerScreen>
    with TickerProviderStateMixin {
  Map<int, String> milestones = {
    1: "Surviving the first night\nhome with baby",
    2: "Mastered the art of diaper\nchanging",
    3: "Got breastfeeding-down",
    4: "One week down for\npostportum recovery",
    5: "First Postpartum Poop",
    6: "First Shower After Birth",
    7: "Getting more than 2 hours of sleep",
    8: "First outing with the baby",
  };

  List<String> completed = [];
  List<String> uncompleted = [];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    var appHeight = MediaQuery.of(context).size.height;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ===== Milestone Header ====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 46,
                      width: 46,
                      margin:
                          const EdgeInsets.only(top: 60, left: 20, right: 20),
                      alignment: AlignmentDirectional.topEnd,
                      child: Image.asset('assets/images/back_image.png')),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: TextStyleHelper().mytext(
                        'Milestone Tracker', 20, FontWeight.w600, textColor)),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ReflectRecordScreen()));
                  },
                  child: Container(
                      height: 46,
                      width: 46,
                      margin: const EdgeInsets.only(top: 60,left: 20, right: 20),
                      alignment: AlignmentDirectional.center,
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/point.png'))
                      ),
                      child: Icon(Icons.done,size: 18,
                        color: Theme.of(context).colorScheme.background,)),
                ),
              ],
            ),

            /// ===== Tab Bar (All|Completed|Uncompleted) ======
            Container(
              height: 64,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
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
                          Tab(text: 'Completed'),
                          Tab(text: 'Uncompleted'),
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
                  height: appHeight*1.5,
                  width: appWidth,
                  child: TabBarView(controller: tabController, children: [
                    // >>> All
                    Column(
                      children: [
                        /// ===== To do list =====
                        const SizedBox(
                          height: 30,
                        ),
                        Wrap(
                          children: List.generate(milestones.length, (index) {
                            uncompleted = milestones.values.toList();
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    if (completed.contains(
                                        milestones.values.elementAt(index))) {
                                      completed.remove(
                                          milestones.values.elementAt(index));
                                    } else {
                                      if (uncompleted.contains(
                                          milestones.values.elementAt(index))) {
                                        completed.add(
                                            milestones.values.elementAt(index));
                                        uncompleted.remove(
                                            milestones.values.elementAt(index));
                                      } else {
                                        uncompleted.remove(
                                            milestones.values.elementAt(index));
                                      }
                                    }
                                  });
                                  print(completed.toString());
                                },
                                child: ItemBox(
                                  answer: milestones.values.elementAt(index),
                                  notSelected: completed.contains(
                                          milestones.values.elementAt(index))
                                      ? true
                                      : false,
                                ));
                          }),
                        ),

                        /// ==== + Add new Item
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 40),
                          child: RoundButton(
                              text: "+  Add new item",
                              textColor: Colors.white,
                              backgroundColor: MyCustomColor().mMainColor(),
                              borderColor: MyCustomColor().mMainColor(),
                              height: 60,
                              width: appWidth,
                              radius: 99,
                              onClick: () {
                                // milestones.addAll({milestones.keys.last++ : })
                              }),
                        )
                      ],
                    ),
                    // >>> Completed
                    Column(
                      children: [
                        completed.isNotEmpty == true
                            ? Wrap(
                                children:
                                    List.generate(completed.length, (index) {
                                  return InkWell(
                                      onTap: () {
                                        print(completed.toString());
                                      },
                                      child: ItemBox(
                                        answer: completed[index],
                                        notSelected: true,
                                      ));
                                }),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 500,
                                    width: appWidth,
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 430, width: appWidth,
                                            margin: const EdgeInsets.only(left: 30,right: 30),
                                            child: Image.asset('assets/images/empty_message.png')),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.only(bottom: 20),
                                            child: Text(
                                              "Please select an item",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  color: MyCustomColor().mMainColor(),
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Poppins'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                    // >>> uncompleted
                    Column(
                      children: [
                        Wrap(
                          children: List.generate(uncompleted.length, (index) {
                            return InkWell(
                                onTap: () {
                                  //  print(uncompleted.toString());
                                },
                                child: ItemBox(
                                  answer: uncompleted[index].toString(),
                                  notSelected: false,
                                ));
                          }),
                        )
                      ],
                    )
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

class ItemBox extends StatelessWidget {
  final String answer;
  bool? notSelected;
  //final VoidCallback onClick;
  ItemBox({
    Key? key,
    required this.answer,
    this.notSelected = false,
    // required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    return notSelected == false
        ? Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin:
                const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: boxColor,
              boxShadow: [
                BoxShadow(
                  color: boxColor,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(answer,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                          fontFamily: 'Poppins')),
                ),
                Container(
                  height: 24,
                  width: 24,
                  margin: const EdgeInsets.only(right: 20),
                  alignment: AlignmentDirectional.center,
                  child: Image.asset('assets/images/rec_orange.png'),
                ),
              ],
            ),
          )
        : Container(
            height: 65,
            width: MediaQuery.of(context).size.width,
            margin:
                const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: boxColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(answer,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                          fontFamily: 'Poppins')),
                ),
                Container(
                  height: 24,
                  width: 24,
                  margin: const EdgeInsets.only(right: 20),
                  alignment: AlignmentDirectional.center,
                  child: Image.asset('assets/images/rec.png'),
                ),
              ],
            ),
          );
  }
}
