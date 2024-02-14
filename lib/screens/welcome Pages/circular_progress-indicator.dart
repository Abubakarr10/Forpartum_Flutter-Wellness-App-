import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forpartum/Dashboard/navigator_bottom_bar.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

class CircularProgressIndicatorScreen extends StatefulWidget {
  const CircularProgressIndicatorScreen({
    Key? key,
    required this.selectedOption1,
    required this.selectedOption05,
    required this.selectedOption2,
    required this.selectedOption3,
    required this.selectedOption4,
    required this.selectedAge,
    required this.babyborndate,
    required this.selectedMealCategory,
  }) : super(key: key);

  final String selectedOption4;
  final String selectedOption1;
  final String selectedOption2;
  final String selectedOption3;
  final String selectedOption05;
  final int selectedAge;
  final String babyborndate;
  final String selectedMealCategory;

  @override
  State<CircularProgressIndicatorScreen> createState() =>
      _CircularProgressIndicatorScreenState();
}

class _CircularProgressIndicatorScreenState
    extends State<CircularProgressIndicatorScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Create an animation controller with a duration
    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Adjust the duration as needed
      vsync: this,
    );

    // Create a color animation with three different colors
    _colorAnimation = ColorTween(
      begin:MyCustomColor().mMainColor(),
      end: MyCustomColor().mSecondaryColor()
    ).animate(_controller);

    // Start the animation
    _controller.repeat();
    _saveDataToFirestore();
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

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                  child: SizedBox(
                    width: 166, // Adjust the width as needed
                    height: 166, // Adjust the height as needed
                    child: CircularProgressIndicator(
                      valueColor: _colorAnimation, // Use the color animation here
                      strokeWidth: 5, // Adjust the stroke width as needed
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                Center(
                  child: TextStyleHelper().mytext('Loading your Personalized Feed', 16, FontWeight.normal, textColor)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _saveDataToFirestore() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        var userId = user.uid;

        // Create a new collection of interests with the document ID as user ID
        await FirebaseFirestore.instance.collection('Interests').doc(userId).set({
          'userId': userId,
          'interest1': widget.selectedOption1,
          'interest2': widget.selectedOption05,
          'interest3': widget.selectedOption2,
          'interest4': widget.selectedOption3,
          'interest5': widget.selectedOption4,
          'age': widget.selectedAge,
          'babyBornDate': widget.babyborndate,
          'mealCategory': widget.selectedMealCategory,
        });

        // Data saved successfully, you can navigate to the next screen or perform any other actions here.
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => NavigatorBarScreen(), // Replace with your next screen
          ),
        );
      }
    } catch (error) {
      print("Error: $error");
      // Handle the error as needed
    }
  }
}
