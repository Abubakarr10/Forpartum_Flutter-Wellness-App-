import 'package:flutter/material.dart';
import 'package:forpartum/screens/onboard/subscriptions_screen.dart';


import '../../helper/mycustombutton.dart';
import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';

class Freetrialsscreen extends StatefulWidget {
  const Freetrialsscreen({Key? key}) : super(key: key);

  @override
  _FreetrialsscreenState createState() => _FreetrialsscreenState();
}

class _FreetrialsscreenState extends State<Freetrialsscreen> {
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Image.asset(
                  'assets/images/freetrials.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextStyleHelper().mytext('Try our features for 7 days', 20,
                      FontWeight.w800, textColor),
                  const SizedBox(
                    height: 30,
                  ),
                  TextStyleHelper().mytext(
                      'Get tailored symptoms predictions so you’re ',
                      14,
                      FontWeight.w400,
                      textColor),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 40,
                        margin:
                        const EdgeInsets.only(right: 30, left: 30, bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        child: RoundButton(
                            textColor: Colors.white,
                            backgroundColor: MyCustomColor().mMainColor(),
                            borderColor: MyCustomColor().mMainColor(),
                            text: "Next",
                            shadowColor: Colors.black,
                            onClick: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const SubscriptionScreen(),
                                    //  const RegisterScreen(),
                                  ));
                            },
                            height: 40,
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
                      textColor,
                      14,
                      'login',
                      MyCustomColor().mMainColor(),
                      14, () {
                    //click event
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
