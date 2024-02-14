import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

class MealPlanSuggestions extends StatefulWidget {
  const MealPlanSuggestions({super.key});

  @override
  State<MealPlanSuggestions> createState() => _MealPlanSuggestionsState();
}

class _MealPlanSuggestionsState extends State<MealPlanSuggestions> {

bool selectedButton = false;
bool selectedButton2 = false;

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Column(
      children: [
        const SizedBox(height: 20,),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20,left: 30,right: 30),
            child: TextStyleHelper().mytext('Suggestions for nutrient rich foods', 18, FontWeight.w500, MyCustomColor().mMainColor()),
          ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedButton=!selectedButton;
                    });
                  },
                  child: CustomButton(
                      title: 'Unprocessed Food',
                      myColor: selectedButton != false? MyCustomColor().mMainColor() : backgroundColor,
                      textColor: selectedButton != false? Colors.white : MyCustomColor().mMainColor()
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: (){
                    selectedButton2=!selectedButton2;
                  },
                  child: CustomButton(
                      title: 'Chia Seeds',
                      myColor: selectedButton2 != false? MyCustomColor().mMainColor() : backgroundColor,
                      textColor: selectedButton2 != false? Colors.white : MyCustomColor().mMainColor()
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedButton=!selectedButton;
                    });
                  },
                  child: CustomButton(
                      title: 'Bananas',
                      myColor: selectedButton != false? MyCustomColor().mMainColor() : backgroundColor,
                      textColor: selectedButton != false? Colors.white : MyCustomColor().mMainColor()
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedButton=!selectedButton;
                    });
                  },
                  child: CustomButton(
                      title: 'Water',
                      myColor: selectedButton != false? MyCustomColor().mMainColor() : backgroundColor,
                      textColor: selectedButton != false? Colors.white : MyCustomColor().mMainColor()
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: CustomButton(
                    title: 'Nuts',
                    myColor: selectedButton != false? MyCustomColor().mMainColor() : backgroundColor,
                    textColor: selectedButton != false? Colors.white : MyCustomColor().mMainColor()
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedButton=!selectedButton;
                    });
                  },
                  child: CustomButton(
                      title: 'Unprocessed Food',
                      myColor: selectedButton != false? MyCustomColor().mMainColor() : backgroundColor,
                      textColor: selectedButton != false? Colors.white : MyCustomColor().mMainColor()
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: CustomButton(
                    title: 'Chia Seeds',
                    myColor: selectedButton != false? MyCustomColor().mMainColor() : backgroundColor,
                    textColor: selectedButton != false? Colors.white : MyCustomColor().mMainColor()
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedButton=!selectedButton;
                    });
                  },
                  child: CustomButton(
                      title: 'Bananas',
                      myColor: selectedButton != false? MyCustomColor().mMainColor() : backgroundColor,
                      textColor: selectedButton != false? Colors.white : MyCustomColor().mMainColor()
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedButton=!selectedButton;
                    });
                  },
                  child: CustomButton(
                      title: 'Water',
                      myColor: selectedButton != false? MyCustomColor().mMainColor() : backgroundColor,
                      textColor: selectedButton != false? Colors.white : MyCustomColor().mMainColor()
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: CustomButton(
                    title: 'Nuts',
                    myColor: selectedButton != false? MyCustomColor().mMainColor() : backgroundColor,
                    textColor: selectedButton != false? Colors.white : MyCustomColor().mMainColor()
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedButton=!selectedButton;
                    });
                  },
                  child: CustomButton(
                      title: 'Unprocessed Food',
                      myColor: selectedButton != false? MyCustomColor().mMainColor() : backgroundColor,
                      textColor: selectedButton != false? Colors.white : MyCustomColor().mMainColor()
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: CustomButton(
                    title: 'Chia Seeds',
                    myColor: selectedButton != false? MyCustomColor().mMainColor() : backgroundColor,
                    textColor: selectedButton != false? Colors.white : MyCustomColor().mMainColor()
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedButton=!selectedButton;
                    });
                  },
                  child: CustomButton(
                      title: 'Bananas',
                      myColor: selectedButton != false? MyCustomColor().mMainColor() : backgroundColor,
                      textColor: selectedButton != false? Colors.white : MyCustomColor().mMainColor()
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedButton=!selectedButton;
                    });
                  },
                  child: CustomButton(
                      title: 'Water',
                      myColor: selectedButton != false? MyCustomColor().mMainColor() : backgroundColor,
                      textColor: selectedButton != false? Colors.white : MyCustomColor().mMainColor()
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: CustomButton(
                    title: 'Nuts',
                    myColor: selectedButton != false? MyCustomColor().mMainColor() : backgroundColor,
                    textColor: selectedButton != false? Colors.white : MyCustomColor().mMainColor()
                ),
              )
            ],
          ),
        ),

      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final Color myColor;
  final Color textColor;
   const CustomButton({super.key,
  required this.title,
    required this.myColor,
     required this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      decoration: BoxDecoration(
        color: myColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
              color: const Color(0XFFB1AFE9)
          )
      ),
      child:  Center(child: Text(title,
          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: textColor))),
    );
  }
}
