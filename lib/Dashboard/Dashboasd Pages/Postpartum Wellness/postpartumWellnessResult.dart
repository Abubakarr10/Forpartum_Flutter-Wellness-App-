import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Dashboasd%20Pages/Postpartum%20Wellness/postpartumWellnessMain.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

class PostpartumWellnessResult extends StatefulWidget {
  const PostpartumWellnessResult({super.key});

  @override
  State<PostpartumWellnessResult> createState() => _PostpartumWellnessResultState();
}

class _PostpartumWellnessResultState extends State<PostpartumWellnessResult> {
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Results',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context)=> const PostpartumWellnessScreening()));
                },
                child: Container(
                    height: 43,
                    width: 43,
                    margin: const EdgeInsets.only(top: 35, left: 20, right: 20),
                    child: Image.asset('assets/icons/check.png',
                      fit: BoxFit.contain,)),
              ),
            ],
          ),

          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextStyleHelper().mytext('Moderate ', 22, FontWeight.w600, textColor),
              TextStyleHelper().mytext('Anxiety ', 22, FontWeight.w600, MyCustomColor().mMainColor()),
            ],
          ),
          const SizedBox(height: 20,),
          TextStyleHelper().mytext('Understand Your Results', 16, FontWeight.w500,Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            child: Text('Your results indicate that you mav be'
                'experiencing symptoms of moderate'
                'anxiety. Based on your answers, living'
                'with these symptoms could be causing'
                'difficulty managing relationships and'
                'even the tasks of everyday life. These'
                'results do not mean that you have'
                'anxiety, but it may be time to start a'
                'conversation with a mental health'
                'professional.',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontFamily: 'Poppins', fontSize: 16,fontWeight: FontWeight.w500,
              color: textColor,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
            child: RoundButton(
                text: 'Done', textColor: Colors.white,
                backgroundColor: MyCustomColor().mMainColor(),
                borderColor: MyCustomColor().mMainColor(),
                height: 60, width: appWidth, radius: 100, onClick: (){}
            ),
          ),
          Text('Share with a therapist',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins', fontSize: 14,fontWeight: FontWeight.w700,
              color: MyCustomColor().mMainColor(), decoration: TextDecoration.underline
            ),)
        ],
      ),
    );
  }
}
