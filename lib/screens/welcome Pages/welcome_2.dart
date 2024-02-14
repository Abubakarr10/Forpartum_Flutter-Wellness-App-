import 'package:flutter/material.dart';
import 'package:forpartum/screens/welcome%20Pages/welcome_1.dart';
import 'package:forpartum/screens/welcome%20pages/welcome_3.dart';

import '../../helper/mycustombutton.dart';
import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';

class WelcomeScreen2 extends StatefulWidget {
  const WelcomeScreen2({Key? key,required this.selectedOption1,required this.selectedOption05,required this.selectedAge,required this.babyborndate}) : super(key: key);

  static String question02 = "";
  final String selectedOption1;
  final String selectedOption05;
  final int selectedAge;
  final String babyborndate;

  @override
  State<WelcomeScreen2> createState() => _WelcomeScreen2State();
}

class _WelcomeScreen2State extends State<WelcomeScreen2> {

  String selectedAns02 = "";

  int selectedIndex = -1;

  var options = {
    "1" : "Vaginal Birth",
    "2" : "C-section Birth",
    "3" : "Both",
    "4" : "None of the above",
  };

  double currentValue = 0;
  double pageNoValue = 0.55;

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 30),
                  alignment: AlignmentDirectional.center,
                  child: Image.asset('assets/images/logo_transparent.png'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Slider(
                activeColor: MyCustomColor().mSecondaryColor(),
                inactiveColor: Colors.grey.shade300,
                thumbColor: MyCustomColor().mMainColor(),
                value: pageNoValue,
                divisions: 7,
                onChanged: (pageNoValue){
                  //currentValue = pageNoValue+0.5;
                }),
          ),
          Container(
              margin: const EdgeInsets.only(top: 5,left: 20),
              child:  TextStyleHelper().mytext('Did you have a vaginal ', 24, FontWeight.bold, textColor)
          ),
          Container(
              margin: const EdgeInsets.only(left: 10),
              child:  TextStyleHelper().mytext('birth or a cesarean section?', 24, FontWeight.bold, textColor)
          ),


          const SizedBox(
            height: 10,
          ),
          TextStyleHelper().mytext('We need this information you provide about', 14,
              FontWeight.w400, textColor),
          TextStyleHelper()
              .mytext('your birth to customize your app experience', 14, FontWeight.w400, textColor),

          const SizedBox(
            height: 30,
          ),


          /// ===== Options for answers ======
          Wrap(
            children: List.generate(4, (index) {
              return InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Column(
                  children: [
                    AnswerBox(answer: options.values.elementAt(index),
                      height: selectedIndex == index? 65 : 60, size: selectedIndex == index? 16 : 14,
                      color: selectedIndex == index? boxColor : backgroundColor,
                      iconPath: selectedIndex == index? 'assets/images/rec.png' : 'assets/images/rec_orange.png',
                      onClick: (){
                        setState(() {
                          selectedIndex = index;
                          selectedAns02 = options.values.elementAt(index);
                        });
                      }
                      ,),
                  ],
                ),
              );
            }),
          ),

          const SizedBox(height: 30,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 50,
                margin: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
                width: MediaQuery.of(context).size.width,
                child: RoundButton(
                    textColor: Colors.white,
                    backgroundColor: MyCustomColor().mMainColor(),
                    borderColor: MyCustomColor().mMainColor(),
                    text: "Next",
                    shadowColor: Colors.black,
                    onClick: () {
                      print("clicked");

                      WelcomeScreen2.question02 = selectedAns02;
                      print(WelcomeScreen2.question02.toString());
                      if(selectedAns02.isNotEmpty){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  WelcomeScreen3(selectedOption1:widget.selectedOption1,selectedOption2:selectedAns02,selectedOption05:widget.selectedOption05,selectedAge:widget.selectedAge,babyborndate:widget.babyborndate),
                            ));
                      }else{
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Select any option"),
                            content: const SizedBox(
                              height: 100,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.question_mark,
                                    size: 50,color: Colors.red,),
                                  SizedBox(height: 10,),
                                  Text("Please select any answer of the giving question"),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child:  Text("OK",style: TextStyle(color: textColor),),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    radius: 30)),
          ),
        ],
      ),
    );
  }
}
