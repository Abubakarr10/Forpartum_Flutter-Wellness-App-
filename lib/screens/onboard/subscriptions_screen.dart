import 'package:flutter/material.dart';
import 'package:forpartum/screens/register_screen.dart';

import '../../helper/mycustombutton.dart';
import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {

  String headText1 = '\$ 2.5 / per month';
  String headText2 = '\$ 2.5 / per month';
  String headText3 = '\$ 2.5 / per month';
  String mainText1 = '\$ 29.99 / year';
  String mainText2 = '\$ 29.99 / year';
  String mainText3 = '\$ 29.99 / year';
  String subText = '7 days free trial';
  String icSubscription = 'assets/images/ic_subscription.png';
  var backGroundColor1 = MyCustomColor().transparent();
  var backGroundColor2 = MyCustomColor().transparent();
  var backGroundColor3 = MyCustomColor().transparent();
  var borderColor1 = Colors.grey;
  var borderColor2 = Colors.grey;
  var borderColor3 = Colors.grey;



  @override
  Widget build(BuildContext context) {

    var whiteColor = Theme.of(context).colorScheme.primary;

    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      alignment: AlignmentDirectional.center,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/images/logo_transparent.png')),
                  TextStyleHelper()
                      .mytext('Subscription', 18, FontWeight.w800, textColor),
                  const SizedBox(
                    height: 5,
                  ),
                  TextStyleHelper().mytext('please choose a subscription', 14,
                      FontWeight.w400, textColor),
                  TextStyleHelper().mytext(
                      'plan that suits you', 14, FontWeight.w400, textColor),
                  const SizedBox(
                    height: 10,
                  ),
                ]
            ),

            //Subscription box
            Expanded(
              flex: 5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          backGroundColor1 = backgroundColor;
                          borderColor1 = Colors.orange;

                          backGroundColor2 = boxColor;
                          borderColor2 = Colors.grey;

                          backGroundColor3 = boxColor;
                          borderColor3 = Colors.grey;
                        });
                      },
                      child: TextStyleHelper().subscriptionBox(
                          MediaQuery.of(context).size.width,
                          headText1,
                          mainText1,
                          subText,
                          icSubscription,
                          backGroundColor1,
                          borderColor1),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    InkWell(
                      onTap: () {
                        setState(() {
                          backGroundColor1 = boxColor;
                          borderColor1 = Colors.grey;

                          backGroundColor2 = backgroundColor;
                          borderColor2 = Colors.orange;

                          backGroundColor3 = boxColor;
                          borderColor3 = Colors.grey;
                        });
                      },
                      child: TextStyleHelper().subscriptionBox(
                          MediaQuery.of(context).size.width,
                          headText2,
                          mainText2,
                          subText,
                          icSubscription,
                          backGroundColor2,
                          borderColor2),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    InkWell(
                      onTap: () {
                        setState(() {
                          backGroundColor1 = boxColor;
                          borderColor1 = Colors.grey;

                          backGroundColor2 = boxColor;
                          borderColor2 = Colors.grey;

                          backGroundColor3 = backgroundColor;
                          borderColor3 = Colors.orange;
                        });
                      },
                      child: TextStyleHelper().subscriptionBox(
                          MediaQuery.of(context).size.width,
                          headText3,
                          mainText3,
                          subText,
                          icSubscription,
                          backGroundColor3,
                          borderColor3),
                    ),
                  ]
              ),
            ),

            // Last button with promo code<<<
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 5,
                  ),

                  TextStyleHelper().mytext('I have a promo Code', 14, FontWeight.w600,
                      MyCustomColor().mMainColor()),

                  const SizedBox(
                    height: 20,
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
                            text: "Start a Free Trial",
                            shadowColor: Colors.black,
                            onClick: () {
                              print("clicked");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterScreen(),
                                  ));
                            },
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            radius: 30)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
