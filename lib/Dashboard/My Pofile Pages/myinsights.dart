import 'package:flutter/material.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

class MyInsightsScreen1 extends StatefulWidget {
  const MyInsightsScreen1({Key? key}) : super(key: key);

  @override
  State<MyInsightsScreen1> createState() => _MyInsightsScreen1State();
}

class _MyInsightsScreen1State extends State<MyInsightsScreen1> {
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
                                  'My Insights ', 20, FontWeight.w600, textColor),

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
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width:350,
                    height: 350,
                    child: Image.asset(
                      'assets/images/myinsights2.png', // Replace with your image asset

                    ),
                  ),
                  const SizedBox(height: 10),
                  TextStyleHelper().mytext('No Insights Found', 20, FontWeight.bold, textColor)
                ],
              ),
            ),
          ],
        )
    );
  }
}
