import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustomcolor.dart';

import '../../../helper/textStyleHelper.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    var appHeight = MediaQuery.of(context).size.height;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ===== Header Notification =====
            Stack(
              children: [
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: TextStyleHelper().mytext('Notification', 20, FontWeight.w600, textColor)
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
            
            /// ===== New Notify =======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child: Row(
                children: [
                  TextStyleHelper().mytext('New', 18, FontWeight.w500, textColor),
                  const SizedBox(width: 10,),
                  Container(
                    height: 20, width: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: MyCustomColor().mMainColor(),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: MyCustomColor().mMainColor(),
                              blurRadius: 3
                          )
                        ]
                    ),
                    child: Center(child: TextStyleHelper().mytext('3', 10, FontWeight.w600, Colors.white)),
                  ),
                ],
              ),
            ),

            /// ==== Card Notify =====
            Wrap(
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,bottom: 10),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
                        leading: Container(
                          height: 50, width: 50,
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.only(right: 20),
                          decoration:  BoxDecoration(
                            color: const Color(0XFFB1AFE9),
                            borderRadius: BorderRadius.circular(100),
                            //  image: const DecorationImage(image: AssetImage('assets/images/notify_bell.png',))
                          ),
                          child: Container(
                              height: 30, width: 30,
                              margin: const EdgeInsets.only(top: 3,right: 3),
                              child: Image.asset('assets/images/notify_bell.png',)),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextStyleHelper().mytext('Congratulation', 16, FontWeight.w600, textColor),
                            TextStyleHelper().mytext('8:24 AM', 12, FontWeight.w600, const Color(0X80EF6844)),
                          ],
                        ),
                        subtitle: Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: TextStyleHelper().mytext(
                              "Ipsum has been the industry's stand dummy text ever since the 1500s",
                              13,FontWeight.w500 , Colors.grey),
                        ),
                      )
                  ),
                );
              }),
            ),

            /// ===== Earlier Notify ======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child: Row(
                children: [
                  TextStyleHelper().mytext('Earlier', 18, FontWeight.w500, textColor),
                  const SizedBox(width: 10,),
                  Container(
                    height: 20, width: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: MyCustomColor().mMainColor(),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: MyCustomColor().mMainColor(),
                              blurRadius: 3
                          )
                        ]
                    ),
                    child: Center(child: TextStyleHelper().mytext('8', 10, FontWeight.w600, Colors.white)),
                  ),
                ],
              ),
            ),

            /// ==== Card Notify =====
            Wrap(
              children: List.generate(8, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,bottom: 10),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
                        leading: Container(
                          height: 50, width: 50,
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.only(right: 20),
                          decoration:  BoxDecoration(
                            color: const Color(0XFFB1AFE9),
                            borderRadius: BorderRadius.circular(100),
                            //  image: const DecorationImage(image: AssetImage('assets/images/notify_bell.png',))
                          ),
                          child: Container(
                              height: 30, width: 30,
                              margin: const EdgeInsets.only(top: 3,right: 3),
                              child: Image.asset('assets/images/notify_bell.png',)),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextStyleHelper().mytext('Congratulation', 16, FontWeight.w600, textColor),
                            TextStyleHelper().mytext('8:24 AM', 12, FontWeight.w600, const Color(0X80EF6844)),
                          ],
                        ),
                        subtitle: Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: TextStyleHelper().mytext(
                              "Ipsum has been the industry's stand dummy text ever since the 1500s",
                              13,FontWeight.w500 , Colors.grey),
                        ),
                      )
                  ),
                );
              }),
            ),

            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
