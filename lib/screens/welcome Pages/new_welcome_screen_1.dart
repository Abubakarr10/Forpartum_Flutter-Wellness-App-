import 'package:flutter/material.dart';
import 'package:forpartum/screens/welcome%20Pages/baby_born_screen.dart';
import 'package:forpartum/screens/welcome%20Pages/welcome_1.dart';

import '../../helper/mycustombutton.dart';
import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';

class NewWelcomeScreen1 extends StatefulWidget {
   const NewWelcomeScreen1({Key? key, required this.question01,required this.selectedage}) : super(key: key);

  final String question01;
  static String question05= "";
  final int selectedage;
  @override
  _NewWelcomeScreen1State createState() => _NewWelcomeScreen1State();
}

class _NewWelcomeScreen1State extends State<NewWelcomeScreen1> {

  String selectedAns05 = "";

  int selectedIndex = -1;

  var options = {
    "1": "First Child",
    "2": "Second Child",
    "3": "More than two",
    "4": "None of the above",
  };

  double currentValue = 0;
  double pageNoValue = 0.25;

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
            margin: const EdgeInsets.only(top: 5),
            child:  TextStyleHelper().mytext('Is this your first child?', 24, FontWeight.bold, textColor)
          ),

          const SizedBox(
            height: 10,
          ),
          TextStyleHelper().mytext('Or do you have other children as well.', 14,
              FontWeight.w400, textColor),
          TextStyleHelper()
              .mytext('We use this information to customize', 14, FontWeight.w400, textColor),
          TextStyleHelper()
              .mytext('your app experience', 14, FontWeight.w400, textColor),
          const SizedBox(
            height: 30,
          ),

          /// ===== Options for Answer =====
          Wrap(
            children: List.generate(4, (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Column(
                  children: [
                    AnswerBox(
                      answer: options.values.elementAt(index),
                      height: selectedIndex == index ? 65 : 60,
                      size: selectedIndex == index ? 16 : 14,
                      color: selectedIndex == index
                          ? boxColor
                          : backgroundColor,
                      iconPath: selectedIndex == index
                          ? 'assets/images/rec.png'
                          : 'assets/images/rec_orange.png',
                      onClick: () {
                        setState(() {
                          selectedIndex = index;
                          selectedAns05 = options.values.elementAt(index);
                        });
                      },
                    ),
                  ],
                ),
              );
            }),
          ),

          const SizedBox(
            height: 30,
          ),
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

                     NewWelcomeScreen1.question05= selectedAns05;
                      print(NewWelcomeScreen1.question05.toString());
                      if(NewWelcomeScreen1.question05 != "") {
                        Navigator.push(context, MaterialPageRoute(builder:(context) => BabyBornScreen(selectedOption1: widget.question01, selectedOption05: selectedAns05, selectedAge: widget.selectedage),));
                      } else {
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
                                    size: 50,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      "Please select any answer of the giving question"),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child:  Text("OK",style: TextStyle(color: textColor)),
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