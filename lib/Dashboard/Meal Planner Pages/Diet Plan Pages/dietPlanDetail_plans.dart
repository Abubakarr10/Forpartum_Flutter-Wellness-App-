import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/navigator_bottom_bar.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

class DietPlanDetailPlans extends StatefulWidget {
  const DietPlanDetailPlans({super.key});

  @override
  State<DietPlanDetailPlans> createState() => _DietPlanDetailPlansState();
}

var tips01 = {
  "1" : "2 Vegan Pancakes",
  "2" : "1/4 Cup Blackberries",
  "3" : "1 Tbsp. Peanut Butter",
};

var tips02 = {
  "1" : "3/4 cup edamame pods, seasoned with"
  "a pinch of salt"
};

var tips03= {
  "1" : "1 serving White Bean & Avocado Toast",
  "2" : "1 cup sliced cucumber"
};

var tips04 = {
  "1" : "1 small plum"
};

var tips05 = {
  "1" : "1 serving Falafel Salad with Lemon"
  "Tahini Dressing"
};

var totals = {
  "Calories" : "1,221",
  "Protein" : "50 g",
  "Carbons" : "137 g",
  "Iron" : "116 g",
  "Carbons a" : "137 g",
  "Iron a" : "116 g",
};

class _DietPlanDetailPlansState extends State<DietPlanDetailPlans> {
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Column(
      children: [

        /// === Detail Plan Box =====
        DynamicBox(
            image: "assets/images/breakfast.png",
            boxTitle: 'Breakfast',
            time: '08:00 AM',
            calories: '(296 Calories)',
            tipsName: tips01,
            paragraph: 'Mix peanut butter with 1 tsp. warm water'
                '(or more, as needed, to thin out the peanut'
                'butter). Drizzle over pancakes.'
        ),
        DynamicBox(
          height: 330,
          image : "assets/images/Vegan.jpg",
          boxTitle: 'A.M. Snack',
          time: '10:00 AM',
          calories: '(150 Calories)',
          tipsName: tips02,
          paragraph: '',
        ),
        DynamicBox(
          height: 380,
          image : "assets/images/ZoneDiet.jpg",
          boxTitle: 'Lunch',
          time: '01:30 PM',
          calories: '(150 Calories)',
          tipsName: tips03,
          paragraph: '',
        ),
        DynamicBox(
          height: 330,
          image : "assets/images/PaleoDiet.jpg",
          boxTitle: 'Dinner',
          time: '08:30 PM',
          calories: '(499 Calories)',
          tipsName: tips05,
          paragraph: '',
        ),


        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
          child: Align(
              alignment: Alignment.centerLeft,
              child: TextStyleHelper().mytext('Day 1 Totals', 18, FontWeight.w500, textColor)),
        ),

        Container(
          height: 160, width: double.maxFinite,
          margin: const EdgeInsets.only(left: 20),
          color: backgroundColor,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
                return Padding(
                  padding: const EdgeInsets.only(right: 7,left: 3),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        width: 126,
                        margin: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0XFFf0cdc8),Color(0XFFEF6844)],
                          begin: Alignment.topCenter, end: Alignment.bottomCenter
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.white,
                              width: 1
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Center(
                                child: AppIcon(iconPath: 'assets/icons/calories.png',iconColor: Colors.white,
                                iconSize: 45,)
                              ),
                              const SizedBox(height: 10,),
                              TextStyleHelper().mytext(totals.keys.elementAt(index), 16, FontWeight.w500, Colors.white),
                              const SizedBox(height: 10,),
                              TextStyleHelper().mytext(totals.values.elementAt(index), 18, FontWeight.bold, Colors.white)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 08,),
                    ],
                  ),
                );
              }),
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}

class BorderContainer extends StatelessWidget {
  final String title;
  const BorderContainer({super.key,
  required this.title
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Container(
      height: 42, width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: MyCustomColor().mMainColor()
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Align(
            alignment: Alignment.centerLeft,
            child: TextStyleHelper().mytext(title, 12, FontWeight.w500, textColor)),
      ),
    );
  }
}

class DynamicBox extends StatelessWidget {
  double? height;
  final String image;
  final String boxTitle;
  final String calories;
  final String time;
  int? noOfBoxes;
  var tipsName={};
  final String paragraph;

   DynamicBox({super.key,
     this.height=500,
     required this.image,
    required this.boxTitle,
    required this.time,
    required this.calories,
    required this.tipsName,
    required this.paragraph,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: boxColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          /// ===== Image Box ======
          Container(
            height: 170, width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
              ),
              color: boxColor,
              image:  DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
              ),
            ),
          ),

          /// ==== Heading Row =====
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextStyleHelper().mytext(boxTitle, 18, FontWeight.w500, textColor),
                    Row(
                      children: [
                        Icon(Icons.alarm,color: MyCustomColor().mMainColor(),size: 20,),
                        const SizedBox(width: 8,),
                        TextStyleHelper().mytext(time, 12, FontWeight.w500, MyCustomColor().mMainColor())
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: TextStyleHelper().mytext(calories, 12, FontWeight.w500, MyCustomColor().mMainColor())),
                const SizedBox(height: 10,),
                /// ==== Text Boxes ====
                Wrap(
                  children: List.generate(tipsName.values.length, (index) {
                    return  BorderContainer(title: tipsName.values.elementAt(index));
                  }),
                ),
                const SizedBox(height: 10,),

                /// ===== Paragraph =====
                 Text(paragraph,style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Color(0XFF7B6F72), letterSpacing: 1.2
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
