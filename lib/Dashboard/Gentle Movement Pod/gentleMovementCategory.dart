import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Gentle%20Movement%20Pod/gentleMovementClasses.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/mycustomcolor.dart';

import '../../helper/textStyleHelper.dart';

class GentleMovementCategory extends StatefulWidget {
  const GentleMovementCategory({super.key});

  @override
  State<GentleMovementCategory> createState() => _GentleMovementCategoryState();
}

class _GentleMovementCategoryState extends State<GentleMovementCategory> {
  bool choose1 = false; bool choose2 = false; bool choose3 = false; bool choose4 = false;
  bool choose5 = false; bool choose6 = false; bool choose7 = false; bool choose8 = false;
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ===== Top Bar ====
            Stack(
              children: [
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Row(
                            children: [
                              TextStyleHelper().mytext(
                                  'Gentle ', 24, FontWeight.w600, textColor),
                              TextStyleHelper().mytext(
                                  'Movement',
                                  24,
                                  FontWeight.w700,
                                  MyCustomColor().mSecondaryColor())
                            ],
                          )),
                    ],
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        height: 50,
                        width: 50,
                        margin:
                            const EdgeInsets.only(top: 40, left: 20),
                        alignment: AlignmentDirectional.center,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/images/back_image.png'))),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext(
                      'Please choose the category given below.',
                      14,
                      FontWeight.w500,
                      Colors.grey)),
            ),

            /// ===== Options row 01 ======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 4,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choose1 = !choose1;
                          });
                        },
                        child: choose1 == true
                            ? const CategoryOption(
                                title: 'Postpartum Yoga',
                                imagePath: "assets/articles/pod01.png")
                            : const CategoryOptionOff(
                                title: 'Postpartum Yoga',
                                imagePath: "assets/articles/pod01.png"),
                      )),
                  Expanded(
                      flex: 4,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choose2 = !choose2;
                          });
                        },
                        child: choose2 == true
                            ? const CategoryOption(
                            title: 'Postpartum Yoga',
                            imagePath: "assets/articles/pod01.png")
                            : const CategoryOptionOff(
                            title: 'Pilates For Postpartum',
                            imagePath: "assets/articles/pod01.png"),
                      )),
                  Expanded(
                      flex: 4,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choose3 = !choose3;
                          });
                        },
                        child: choose3 == true
                            ? const CategoryOption(
                            title: 'Postpartum Stretching',
                            imagePath: "assets/articles/pod01.png")
                            : const CategoryOptionOff(
                            title: 'Postpartum Yoga',
                            imagePath: "assets/articles/pod01.png"),
                      ))
                ],
              ),
            ),

            /// ===== Options row 02 ======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 4,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choose4 = !choose4;
                          });
                        },
                        child: choose4 == true
                            ? const CategoryOption(
                            title: 'You & Baby',
                            imagePath: "assets/articles/pod01.png")
                            : const CategoryOptionOff(
                            title: 'You & Baby',
                            imagePath: "assets/articles/pod01.png"),
                      )),
                  Expanded(
                      flex: 4,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choose5 = !choose5;
                          });
                        },
                        child: choose5 == true
                            ? const CategoryOption(
                            title: 'Core Connection',
                            imagePath: "assets/articles/pod01.png")
                            : const CategoryOptionOff(
                            title: 'Core Connection',
                            imagePath: "assets/articles/pod01.png"),
                      )),
                  Expanded(
                      flex: 4,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choose6 = !choose6;
                          });
                        },
                        child: choose6 == true
                            ? const CategoryOption(
                            title: 'Breathing Exercises',
                            imagePath: "assets/articles/pod01.png")
                            : const CategoryOptionOff(
                            title: 'Breathing Exercises',
                            imagePath: "assets/articles/pod01.png"),
                      ))
                ],
              ),
            ),

            /// ===== Options row 03 ======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 5,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choose7 = !choose7;
                          });
                        },
                        child: choose7 == true
                            ? const CategoryOption(
                            title: 'Somatic Dance',
                            imagePath: "assets/articles/pod01.png")
                            : const CategoryOptionOff(
                            title: 'Somatic Dance',
                            imagePath: "assets/articles/pod01.png"),
                      )),
                  Expanded(
                      flex: 5,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choose8 = !choose8;
                          });
                        },
                        child: choose8 == true
                            ? const CategoryOption(
                            title: 'Tapping',
                            imagePath: "assets/articles/pod01.png")
                            : const CategoryOptionOff(
                            title: 'Tapping',
                            imagePath: "assets/articles/pod01.png"),
                      )),
                ],
              ),
            ),

            /// ===== Proceed Round Button ====
            Padding(
              padding: const EdgeInsets.only(top: 50,bottom: 30,left: 30,right: 30),
              child: RoundButton(
                  text: 'Proceed',
                  textColor: Colors.white,
                  backgroundColor: MyCustomColor().mMainColor(), borderColor: MyCustomColor().mMainColor(),
                  height: 60, width: appWidth, radius: 99,
                  onClick: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const GentleMovementClasses()));
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryOption extends StatelessWidget {
  final String title;
  final String imagePath;
  const CategoryOption({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    bool clicked = false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 88,
            width: 88,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: MyCustomColor().mMainColor(),width: 2.5),
                image: DecorationImage(image: AssetImage(imagePath))),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                        image: AssetImage('assets/icons/done.png'),
                        fit: BoxFit.fitWidth)),
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: textColor),
        ),
      ],
    );
  }
}

class CategoryOptionOff extends StatelessWidget {
  final String title;
  final String imagePath;
  const CategoryOptionOff({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 88,
          width: 88,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(image: AssetImage(imagePath))),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: textColor),
        ),
      ],
    );
  }
}
