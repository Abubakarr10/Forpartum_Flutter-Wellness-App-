import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/My%20Pofile%20Pages/Notifications/notifications_screen.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

class MealPlanDetailScreen extends StatefulWidget {
  const MealPlanDetailScreen({super.key});

  @override
  State<MealPlanDetailScreen> createState() => _MealPlanDetailScreenState();
}

class _MealPlanDetailScreenState extends State<MealPlanDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return  Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
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
                    'Day 1 Meal Plan',
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationScreen()));
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

            /// ===== Heading =====
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                  child: TextStyleHelper().mytext('Ut Enim Ad Minim Veniam,\nQuis Nosturd',
                      18, FontWeight.w600, textColor)),
            ),

            //// ====== Image Box Wide ======
            Container(
              height: 200,
              width: double.maxFinite,
              margin: const EdgeInsets.only(top: 20,bottom: 20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Veganism.jpg"),
                    fit: BoxFit.cover),
              ),
            ),

            /// ===== Meal Paragraph Text =====
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text("when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently."

                      "web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web site."
                      "web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum'",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: textColor),
                    strutStyle: const StrutStyle(
                      height: 2.5
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),

                /// ==== Likes & Share =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Center(
                        child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Colors.grey, // Change this color to the desired color
                              BlendMode.srcIn,
                            ),
                            child: ImageIcon(AssetImage('assets/icons/Heart.png'),size: 24,)),
                      ),
                      const SizedBox(width: 8,),
                      Text('11.4k',style: TextStyle(color: textColor),),
                      const SizedBox(width: 15),
                      Container(
                        height: 24,width: 24,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/icons/share.png'))
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Text('10k',style: TextStyle(color: textColor),),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
