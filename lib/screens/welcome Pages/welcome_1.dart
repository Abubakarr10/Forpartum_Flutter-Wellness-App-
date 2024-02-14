import 'package:flutter/material.dart';
import 'package:forpartum/screens/welcome%20Pages/new_welcome_screen_1.dart';
import '../../helper/mycustombutton.dart';
import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';

class WelcomeScreen1 extends StatefulWidget {
  const WelcomeScreen1({Key? key,required this.selectedAge}) : super(key: key);

  static String question01 = "";
  final int selectedAge;

  @override
  State<WelcomeScreen1> createState() => _WelcomeScreen1State();
}

class _WelcomeScreen1State extends State<WelcomeScreen1> {
  String selectedAns01 = "";
  int selectedIndex = -1;

  var options = {
    "1": "Third trimester ",
    "2": "1-12 months postpartum",
    "3": "12-24 months postpartum",
    "4": "3+ years postpartum",
  };

  double currentValue = 0;
  double pageNoValue = 0.10;


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
          Text('Are you pregnant or \nhave you given birth?',style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24, color: textColor,
            fontFamily: 'Poppins'
          ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(
            height: 10,
          ),
          TextStyleHelper().mytext('We need this information to tailor', 14,
              FontWeight.w400, textColor),
          TextStyleHelper()
              .mytext('your home screen. If you’re couple days', 14, FontWeight.w400, textColor),
          TextStyleHelper()
              .mytext('postpartum , select  “1-12 months."', 14, FontWeight.w400, textColor),
          const SizedBox(
            height: 30,
          ),

          Wrap(
            children: List.generate(4, (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    selectedAns01 = options.values.elementAt(index);
                  });
                },
                child: Column(
                  children: [
                    AnswerBox(
                      answer: options.values.elementAt(index),
                      height: selectedIndex == index ? 65 : 60,
                      size: selectedIndex == index ? 16 : 14,
                      color: selectedIndex == index ? boxColor : backgroundColor,
                      iconPath: selectedIndex == index ? 'assets/images/rec.png' : 'assets/images/rec_orange.png',
                      onClick: () {
                        setState(() {
                          selectedIndex = index;
                          selectedAns01 = options.values.elementAt(index);
                        });
                      },
                    ),
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
                  if (selectedAns01.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>NewWelcomeScreen1(question01:selectedAns01, selectedage: widget.selectedAge)
                      ),
                    );
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
                              SizedBox(height: 10,),
                              Text("Please select any answer of the given question"),
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
                radius: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnswerBox extends StatelessWidget {
  final String answer;
  final String iconPath;
  final Color color;
  double? height;
  double? size;
  final VoidCallback onClick;

  AnswerBox({
    Key? key,
    required this.answer,
    required this.iconPath,
    required this.color,
    this.height = 60,
    this.size = 14,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        return onClick();
      },
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 30, offset: const Offset(0, 6)
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                answer,
                style: TextStyle(fontSize: size, fontWeight: FontWeight.w500, color: textColor, fontFamily: 'Poppins'),
              ),
            ),
            Container(
              height: 24,
              width: 24,
              margin: const EdgeInsets.only(right: 20),
              alignment: AlignmentDirectional.center,
              child: Image.asset(iconPath),
            ),
          ],
        ),
      ),
    );
  }
}
