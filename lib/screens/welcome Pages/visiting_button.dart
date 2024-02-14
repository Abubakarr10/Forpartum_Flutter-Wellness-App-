import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/textStyleHelper.dart';
import 'package:forpartum/screens/welcome%20Pages/age_slider.dart';
import '../../helper/mycustomcolor.dart';
class VisitingButtons extends StatefulWidget {
  const VisitingButtons({Key? key}) : super(key: key);

  @override
  State<VisitingButtons> createState() => _VisitingButtonsState();
}

class _VisitingButtonsState extends State<VisitingButtons> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Create an animation controller with a duration
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Adjust the duration as needed
      vsync: this,
    );

    // Create a color animation with three different colors
    _colorAnimation = ColorTween(
        begin:MyCustomColor().mMainColor(),
        end: MyCustomColor().mSecondaryColor()
    ).animate(_controller);

    // Start the animation
    _controller.repeat();
   // _saveDataToFirestore();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:  AppBar(
        title: TextStyleHelper().mytext('Sign Up', 20, FontWeight.bold, textColor),
        backgroundColor: Colors.transparent, // Make the app bar transparent
        elevation: 0, // Remove shadow
        centerTitle: true, // Center the title
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(
            flex: 3,
            child: SizedBox(
              height: appHeight,
            ),
          ),

          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  width: appWidth,
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/icons/appIcon.png'),
                        fit: BoxFit.fitHeight),
                  ),
                  child:  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(
                          child: SizedBox(
                            width: 210, // Adjust the width as needed
                            height: 210, // Adjust the height as needed
                            child: CircularProgressIndicator(
                              //color: MyCustomColor().mSecondaryColor(),
                              valueColor: _colorAnimation, // Use the color animation here
                              strokeWidth: 7, // Adjust the stroke width as needed
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 240),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Transform.rotate(
                                  angle: -40 * 3.14159265359 / 180,
                                  child: TextStyleHelper().mytext('Mental Health', 16, FontWeight.w500, MyCustomColor().mSecondaryColor()),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60,right: 80),
                              child: Align(
                                alignment: Alignment.center,
                                child: Transform.rotate(
                                  angle: -90 * 3.14159265359 / 180,
                                  child: TextStyleHelper().mytext('Nutrition', 16, FontWeight.w500, MyCustomColor().mMainColor()),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60,right: 30),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Transform.rotate(
                                  angle: -120 * 3.14159265359 / 180,
                                  child: TextStyleHelper().mytext('Sleep', 16, FontWeight.w500, MyCustomColor().mSecondaryColor()),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: TextStyleHelper().mytext('Community', 16, FontWeight.w500, MyCustomColor().mMainColor()),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 60,left: 50),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Transform.rotate(
                                    angle: 45 * 3.14159265359 / 180,
                                    child: TextStyleHelper().mytext('Physical Recovery', 16, FontWeight.w500, MyCustomColor().mSecondaryColor())),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 90,left: 80),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Transform.rotate(
                                    angle: 110 * 3.14159265359 / 180,
                                    child: TextStyleHelper().mytext('Nervous System', 16, FontWeight.w500, MyCustomColor().mMainColor())),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleHelper().mytext("You're almost there.", 18, FontWeight.bold, textColor),
                      const SizedBox(height: 10), // Add space between the texts
                      TextStyleHelper().mytext("We'll need to gather some information from you We use your information to customize your app experience.", 14, FontWeight.normal, textColor),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
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
                          text: "Start visit",
                          shadowColor: Colors.black,
                          onClick: () {
                            print("clicked");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AgeSliderScreen(),
                                ));
                          },
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          radius: 30)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
