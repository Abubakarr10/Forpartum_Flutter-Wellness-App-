import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/textStyleHelper.dart';
import 'package:forpartum/screens/welcome%20Pages/welcome_1.dart';
import '../../helper/mycustomcolor.dart';


class AgeSliderScreen extends StatefulWidget {
  const AgeSliderScreen({Key? key}) : super(key: key);

  @override
  _AgeSliderScreenState createState() => _AgeSliderScreenState();
}

class _AgeSliderScreenState extends State<AgeSliderScreen> {
  List<int> ageValues = List.generate(100, (index) => index + 1); // Start from 1
  int selectedAge1 = 25; // Default selected age
  bool isAgeSelected = false; // Flag to track if an age is selected
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    // Calculate the index of the selected age based on scroll position
    double itemHeight = 40;
    int selectedIndex = (_scrollController.offset / itemHeight).round();

    if (selectedIndex >= 0 && selectedIndex < ageValues.length) {
      int ageToSelect = ageValues[selectedIndex];

      // Check if the age with the desired text color is within a certain range
      if (ageToSelect >= 0 && ageToSelect <= 100) {
        setState(() {
          selectedAge1 = ageToSelect;
          isAgeSelected = true;
        });
      } else {
        // Age not within the desired range, reset the flag
        setState(() {
          isAgeSelected = false;
        });
      }
    }
  }


double currentValue = 0;
  double pageNoValue = 5.0;

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
        children: [
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
                value: currentValue,
                divisions: 7,
                onChanged: (pageNoValue){
                  currentValue = pageNoValue;
                }),
          ),

          const Padding(padding: EdgeInsets.only(top: 70)),
          Container(
            child: TextStyleHelper().mytext('How old are you?', 24, FontWeight.bold, textColor)
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            child: TextStyleHelper().mytext('Let’s start with the basics', 14, FontWeight.normal, textColor)
          ),
          const Padding(padding: EdgeInsets.only(top: 40)),
          SizedBox(
            height: 200,
            child: ListView.builder(
              controller:_scrollController,
              scrollDirection: Axis.vertical,
              itemCount: ageValues.length,
              itemBuilder: (context, index) {
                int currentAge = ageValues[index];
                bool isCenter = currentAge == selectedAge1;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAge1 = currentAge;
                      isAgeSelected = true; // Set the flag to true when an age is selected
                    });
                  },
                  child: Container(
                    decoration: const BoxDecoration(),
                    height: 40,
                    alignment: Alignment.center,
                    child: Opacity(
                      opacity: isCenter ? 1.0 : 0.7, // Adjust opacity for non-center numbers
                      child: Text(
                        '$currentAge',
                        style: TextStyle(
                          color: isCenter ? const Color(0xffEF6844) : const Color(0xff536F56),
                          fontSize: isCenter ? 35 : 20, // Adjust font size for non-center numbers
                          fontWeight: isCenter ? FontWeight.bold : FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
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
                  if (isAgeSelected) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen1(selectedAge: selectedAge1),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Select an age"),
                        content: const SizedBox(
                          height: 100,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.warning,
                                size: 50,
                                color: Colors.red,
                              ),
                              SizedBox(height: 10,),
                              Text("Please select your age."),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: TextStyleHelper().mytext('OK', 14, FontWeight.normal, textColor)
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
