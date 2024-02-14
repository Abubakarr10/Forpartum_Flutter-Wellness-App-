import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

import 'onboardscreen3.dart';

class Onboardscreen2 extends StatelessWidget {
  const Onboardscreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                              )),
                          Expanded(
                            flex: 6,
                            child: Container(
                              //  width: MediaQuery.of(context).size.width,
                              child: SizedBox(
                                height: 80,
                                child: Image.asset(
                                  'assets/images/logo_transparent.png',
                                  fit: BoxFit.fitHeight,
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: 70,
                                      height: 40,
                                      child: RoundButton(
                                          text: "Skip",
                                          textColor: Colors.white,
                                          backgroundColor:
                                          MyCustomColor().mMainColor(),
                                          borderColor:
                                          MyCustomColor().mMainColor(),
                                          shadowColor: Colors.black,
                                          height: 70,
                                          width: 50,
                                          radius: 20,
                                          onClick: () {})),
                                ],
                              )),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    TextStyleHelper().mutipleColorTextRow(
                        'A Holistic',
                        Colors.black,
                        22,
                        'Approach',
                        MyCustomColor().mMainColor(),
                        22, () {
                      //click event
                    }),
                    const SizedBox(
                      height: 5,
                    ),
                    TextStyleHelper().mytext(
                        'Embrace a holistic approach to postpartum',
                        14,
                        FontWeight.w400,
                        Colors.black),
                    TextStyleHelper().mytext(
                        'beyond the traditional six weeks.',
                        14,
                        FontWeight.w400,
                        Colors.black),
                  ],
                )),
            Expanded(
              flex: 5,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Image.asset(
                  'assets/images/onboard_2.png',
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // Join Forpartum Button
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          height: 50,
                          margin:
                          const EdgeInsets.only(right: 30, left: 30, bottom: 20),
                          width: MediaQuery.of(context).size.width,
                          child: RoundButton(
                              textColor: Colors.white,
                              backgroundColor: MyCustomColor().mMainColor(),
                              borderColor: MyCustomColor().mMainColor(),
                              text: "Join Forpartum",
                              shadowColor: Colors.black,
                              onClick: () {
                                print("clicked");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Onboardscreen3(),
                                    ));
                              },
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              radius: 30)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: TextStyleHelper()
                                .socialIconsCard('assets/images/google.png')),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {},
                            child: TextStyleHelper()
                                .socialIconsCard('assets/images/twitter.png')),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {},
                            child: TextStyleHelper()
                                .socialIconsCard('assets/images/facebook.png')),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextStyleHelper().mutipleColorTextRow(
                        'Already have an account?',
                        Colors.black,
                        14,
                        'login',
                        MyCustomColor().mMainColor(),
                        14, (() {
                      //click event
                    }))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
