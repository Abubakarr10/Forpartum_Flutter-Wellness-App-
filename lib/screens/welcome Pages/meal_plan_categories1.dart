import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/screens/welcome Pages/circular_progress-indicator.dart';

class MealPlanCategories1 extends StatefulWidget {
   const MealPlanCategories1({Key? key,required this.selectedOption1,required this.selectedOption05,required this.selectedOption2,required this.selectedOption3,required this.selectedOption4,required this.selectedAge,required this.babyborndate}) : super(key: key);

  final  String selectedOption4;
  final  String selectedOption1;
  final  String selectedOption2;
  final  String selectedOption3;
  final  String selectedOption05;
  final  int selectedAge;
  final  String babyborndate;

  @override
  State<MealPlanCategories1> createState() => _MealPlanCategories1State();
}

class _MealPlanCategories1State extends State<MealPlanCategories1> {
  List<String> mealCategories = [
    "Traditional",
    "Vegetarian",
    "Keto",
    "Paleo",
    "Pescatarian",
    "Vegan (Plant Based)",
    "Mediterranean",
    "Diabetes Type 1 & 2",
  ];

  List<String> mealCategoryImages = [
    "assets/images/Vegetarian.jpg",
    "assets/images/r2.png",
    "assets/images/r3.png",
    "assets/images/r4.png",
    "assets/images/r5.png",
    "assets/images/Vegan.jpg",
    "assets/images/r7.png",
    "assets/images/r8.png",
  ];

  int selectedCategoryIndex = -1; // Initially no item is selected.
  String selectedMealCategory = ""; // Variable to store the selected category.

  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    var appHeight = MediaQuery.of(context).size.height;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color:textColor), // Use the back arrow icon
          onPressed: () {
            // Handle the back button press (e.g., navigate back)
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Meal Plan ',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: MyCustomColor().mMainColor(),
                      ),
                    ),
                  ],
                ),

                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: boxColor,
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xffBF3316),
                            blurRadius: 0.22,
                            offset: Offset.zero),
                      ]),
                  child: const Icon(Icons.notification_add),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30,right: 30),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Please choose the category given below')),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 30),
              child: ListView.builder(
                itemCount: mealCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  final isSelected = selectedCategoryIndex == index;
                  return ListTile(
                    title: Text(mealCategories[index]),
                    trailing: Container(
                      height: 44,
                      width: 44,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage(mealCategoryImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: isSelected
                          ? Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              color: MyCustomColor().mMainColor(),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                          : null, // Display the checkmark only if selected
                    ),
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                        selectedMealCategory = mealCategories[index]; // Store selected category
                      });

                      // Handle category selection here
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
              width: MediaQuery.of(context).size.width,
              child: RoundButton(
                text: 'Proceed',
                textColor: Colors.white,
                backgroundColor: MyCustomColor().mSecondaryColor(),
                borderColor: MyCustomColor().mSecondaryColor(),
                height: 60,
                width: 315,
                radius: 99,
                onClick: () {
                  if (selectedMealCategory.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CircularProgressIndicatorScreen(
                          selectedOption1: widget.selectedOption1,
                          selectedOption05: widget.selectedOption05,
                          selectedOption2: widget.selectedOption2,
                          selectedOption3: widget.selectedOption3,
                          selectedOption4: widget.selectedOption4,
                          selectedAge: widget.selectedAge,
                          babyborndate: widget.babyborndate,
                          selectedMealCategory: selectedMealCategory,
                        ),
                      ),
                    );
                  } else {
                    print('Please choose a meal category.');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Choose a Meal Category'),
                          content: const Text('Please choose your meal category.'),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK',style: TextStyle(color: textColor),),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
