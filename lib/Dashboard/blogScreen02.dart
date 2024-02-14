import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustomcolor.dart';

import '../helper/textStyleHelper.dart';
import 'My Pofile Pages/Notifications/notifications_screen.dart';
import 'navigator_bottom_bar.dart';

class BlogScreen02 extends StatefulWidget {
  const BlogScreen02({super.key});

  @override
  State<BlogScreen02> createState() => _BlogScreen02State();
}

class _BlogScreen02State extends State<BlogScreen02> {
  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      backgroundColor: const Color(0XFFFFEDE5),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ===== Top Box ======
            Container(
              width: appWidth,
              color: backgroundColor,
              child: Column(
                children: [
                  /// ===== Blog Post Header ====
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
                          child: TextStyleHelper().mytext('Blog Posts', 20, FontWeight.w600, textColor)
                      ),
                      Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                          alignment: AlignmentDirectional.topEnd,
                          child: Container(
                              height: 45,width: 45,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/point.png'),
                                    fit: BoxFit.fitHeight
                                ),
                              ),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=> const NotificationScreen()));
                                },
                                child: Center(
                                  child: Icon(Icons.notifications_outlined,
                                    color: backgroundColor,size: 18,
                                  ),
                                ),
                              ))),
                    ],
                  ),

                  /// ====== Info of Main Page =====
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextStyleHelper().mytext('Dummy Topic', 12, FontWeight.w600, MyCustomColor().mMainColor()),
                        const SizedBox(height: 10,),
                        TextStyleHelper().mytext('Ut enim ad minim veniam, quis\n'
                            'nostrud exercitation ullamco', 18, FontWeight.w600, textColor),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextStyleHelper().mytext('Published by Liza Patel', 12, FontWeight.w500, Colors.grey),
                            TextStyleHelper().mytext('29 May, 2023', 12, FontWeight.w500, Colors.grey),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //// ====== Image Box Wide ======
            Container(
              height: 200,
              width: double.maxFinite,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/baby_mother_sleep.jpg"),
                    fit: BoxFit.cover),
              ),
            ),

             Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text("when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently."

                      "web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web site."
                      "web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum'",
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),
                    strutStyle: StrutStyle(
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
                      AppIcon(iconPath: 'assets/icons/Heart.png',iconSize: 20,
                      iconColor: Colors.black,),
                      const SizedBox(width: 4,),
                      TextStyleHelper().mytext('11.5K', 14, FontWeight.w500, Colors.black),
                      const SizedBox(width: 10),
                      AppIcon(iconPath: 'assets/icons/share.png',iconSize: 20,
                        iconColor: Colors.black,),
                      const SizedBox(width: 4,),
                      TextStyleHelper().mytext('10K', 14, FontWeight.w500, Colors.black),
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
