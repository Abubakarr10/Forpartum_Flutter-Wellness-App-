import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Dashboasd%20Pages/Postpartum%20Wellness/postpartumWellnessStart.dart';
import 'package:forpartum/Dashboard/navigator_bottom_bar.dart';
import 'package:forpartum/helper/mycustombutton.dart';

import '../../../helper/mycustomcolor.dart';
import '../../../helper/textStyleHelper.dart';

class PostpartumWellnessScreening extends StatefulWidget {
  const PostpartumWellnessScreening({super.key});

  @override
  State<PostpartumWellnessScreening> createState() => _PostpartumWellnessScreeningState();
}

class _PostpartumWellnessScreeningState extends State<PostpartumWellnessScreening> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                          TextStyleHelper().mytext('Postpartum Wellness', 20, FontWeight.w600, textColor),
                        ],
                      ),
                    ),
                  ),
                ]
            ),

            /// ===== Search Bar =====
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)
                ),
                child:  ListTile(
                  leading: SizedBox(
                      width: 50,
                      child: AppIcon(iconPath: 'assets/icons/Search.png')),
                  title: TextField(
                    controller: searchController,
                    cursorColor: MyCustomColor().mMainColor(),
                    decoration: const InputDecoration(
                      hintText: "Search Here...",
                      hintStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,
                         color: Colors.grey, fontFamily: "Poppins"),
                      border: InputBorder.none,
                    ),
                  ),
                  trailing:  SizedBox(
                    height: 40, width: 70,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6,horizontal: 10),
                          child: VerticalDivider(),
                        ),
                        AppIcon(iconPath: 'assets/icons/fliter.png')
                      ],
                    ),
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>const PostpartumWellnessStart()));
              },
              child: const WellnessCard(
                  title: 'Physical Recovery', questions: '10 Question', time: '01 Hours 15 mins',
                  iconPath: 'assets/articles/wellness01.png'),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>const PostpartumWellnessStart()));
              },
              child: const WellnessCard(
                  title: 'Support System', questions: '10 Question', time: '01 Hours 15 mins',
                  iconPath: 'assets/articles/wellness02.png'),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30,top: 30),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext('Continue Screening', 16, FontWeight.w600, MyCustomColor().mMainColor())),
            ),

             WellnessCardQuiz(
                title: 'Emotional Well-Being', questions: '6/10 Question', time: '35 mins',
                iconPath: 'assets/articles/wellness03.png', onTap: (){},),
             WellnessCardQuiz(
                title: 'Pelvic Floor Assessment', questions: '6/10 Question', time: '35 mins',
                iconPath: 'assets/articles/wellness04.png', onTap: (){},),
             const SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}


class WellnessCard extends StatelessWidget {
  final String title;
  final String questions;
  final String time;
  final String iconPath;
  const WellnessCard({super.key,
    required this.title, required this.questions, required this.time,
    required this.iconPath
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 110,width: appWidth,
      margin: const EdgeInsets.only(left: 30,right: 30,top: 30),
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 40, offset: const Offset(0, 10)
          )]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Row(
          children: [
            Container(
              height: 70, width: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(iconPath))
              ),
            ),
            const SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextStyleHelper().mytext(title, 16, FontWeight.w600,textColor),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    AppIcon(iconPath: 'assets/icons/folder.png',iconSize: 16,),
                    const SizedBox(width: 8,),
                    TextStyleHelper().mytext(questions, 12, FontWeight.w500,Colors.grey),
                  ],
                ),
                const SizedBox(height: 7,),
                Row(
                  children: [
                    AppIcon(iconPath: 'assets/icons/Clock_.png',iconSize: 16,),
                    const SizedBox(width: 8,),
                    TextStyleHelper().mytext(time, 12, FontWeight.w500,Colors.grey),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WellnessCardQuiz extends StatelessWidget {
  final String title;
  final String questions;
  final String time;
  final String iconPath;
  final VoidCallback onTap;
  const WellnessCardQuiz({super.key,
    required this.title, required this.questions, required this.time,
    required this.iconPath, required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 160,width: appWidth,
      margin: const EdgeInsets.only(left: 30,right: 30,top: 30),
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 40, offset: const Offset(0, 10)
          )]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 70, width: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(iconPath))
                  ),
                ),
                const SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextStyleHelper().mytext(title, 16, FontWeight.w600,textColor),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        AppIcon(iconPath: 'assets/icons/folder.png',iconSize: 16,),
                        const SizedBox(width: 8,),
                        TextStyleHelper().mytext(questions, 12, FontWeight.w500,Colors.grey),
                      ],
                    ),
                    const SizedBox(height: 7,),
                    Row(
                      children: [
                        AppIcon(iconPath: 'assets/icons/Clock_.png',iconSize: 16,),
                        const SizedBox(width: 8,),
                        TextStyleHelper().mytext(time, 12, FontWeight.w500,Colors.grey),
                      ],
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
              child: RoundButton(
                  text: 'Continue Quiz', textSize: 14,
                  textColor: Colors.white,
                  backgroundColor: MyCustomColor().mSecondaryColor(),
                  borderColor: MyCustomColor().mSecondaryColor(),
                  height: 34, width: appWidth, radius: 100,
                  onClick: (){
                    onTap();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
