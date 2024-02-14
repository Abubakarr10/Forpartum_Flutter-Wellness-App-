import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Dashboasd%20Pages/Postpartum%20Wellness/postpartumWellnessQuiz.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/mycustomcolor.dart';

import '../../../helper/textStyleHelper.dart';

class PostpartumWellnessStart extends StatefulWidget {
  const PostpartumWellnessStart({super.key});

  @override
  State<PostpartumWellnessStart> createState() => _PostpartumWellnessStartState();
}

class _PostpartumWellnessStartState extends State<PostpartumWellnessStart> {
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

            Padding(
              padding: const EdgeInsets.only(left: 30,top: 30,right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextStyleHelper().mytext('Postpartum Wellness Screening', 16, FontWeight.w600,
                      MyCustomColor().mMainColor()),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      TextStyleHelper().mytext('Hi, ', 26, FontWeight.w500,
                          textColor),
                      TextStyleHelper().mytext('Stefani', 26, FontWeight.w600,
                          MyCustomColor().mMainColor()),
                    ],
                  ),
                  const SizedBox(height: 6,),
                  TextStyleHelper().mytext('Last assessment: 02/03/23', 14, FontWeight.w600,
                      textColor),
                  const SizedBox(height: 40,),
                  TextStyleHelper().mytext('Each assessment consists of a series of questions,'
                      'which should be answered honestly and in one sitting.', 16, FontWeight.w500,
                      Colors.grey),
                  const SizedBox(height: 60,),
                  TextStyleHelper().mytext('Please read the text below carefully so you can understand it',
                      16, FontWeight.w600,
                      MyCustomColor().mMainColor()),
                  Container(
                    height: 210, width: appWidth,
                    margin: const EdgeInsets.only(top: 10,),
                    decoration: BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 40, offset: const Offset(0, 10),
                      )]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextStyleHelper().mytext('▫   While these results aren’t a diagnosis,'
                              'they can help you and your provider make a plan to help you.'
                              'feel your best.\n', 12, FontWeight.w400, Colors.grey),
                          TextStyleHelper().mytext('▫   Tap on options to select the correct answer\n',
                              12, FontWeight.w400, Colors.grey),
                          TextStyleHelper().mytext('▫   Tap on the bookmark icon to save interesting questions\n'
                              , 12, FontWeight.w400, Colors.grey),
                          TextStyleHelper().mytext('▫   Remember, journaling can be a powerful tool'
                              'for self-reflection and personal growth. Take your time and write'
                              "as much or as little as you'd like...",
                              12, FontWeight.w400, Colors.grey),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 40),
              child: RoundButton(
                  text: 'Got it', textColor: Colors.white,
                  backgroundColor: MyCustomColor().mMainColor(),
                  borderColor: MyCustomColor().mMainColor(),
                  height: 60, width: appWidth, radius: 100,
                  onClick:(){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> const PostpartumWellnessQuiz()));
                  }),
            )

          ],
        ),
      ),
    );
  }
}
