import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Meal%20Planner%20Pages/Diet%20Plan%20Pages/dietPlanDetail_screen.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

class DietPlanInfo extends StatelessWidget {
   DietPlanInfo({super.key});

  var info = {
    "1" : "Promote weight loss.",
    "2" : "Reduce your risk of heart disease",
    "3" : "Lower your chances of getting certain types\nof cancer",
    "4" : "Manage diabetes by lowering A1C levels.",
  };

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return  SingleChildScrollView(
      child: Column(
        children: [

          /// ==== Top Container (10 Days Plan) =====
          Container(
            height: 60, width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0X50B1AFE9),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: TextStyleHelper().mytext('10 Days Plan', 14, FontWeight.w600, textColor),
                ),
                Container(
                  height: 30, width: 90,
                  margin: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyCustomColor().mMainColor()
                  ),
                  child: Center(child: TextStyleHelper().mytext('Schedule', 12, FontWeight.w500, Colors.white)),
                ),
              ],
            ),
          ),

          /// ==== Heading =====
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30,bottom: 20,right: 30),
              child: TextStyleHelper().mytext('Vegan Diet can help do the Following:', 18, FontWeight.w500, textColor),
            ),
          ),

          Wrap(
            children: List.generate(4, (index) {
              return Column(
                children: [
                  Container(
                      height: 60, width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: boxColor
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextStyleHelper().mytext
                            (info.values.elementAt(index), 14, FontWeight.w500, textColor),
                        ),
                      )
                  )
                ],
              );
            }),
          ),

         Padding(
           padding: const EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 40),
           child: RoundButton(
               text: 'Start Plan',
               textColor: Colors.white,
               backgroundColor: MyCustomColor().mMainColor(),
               borderColor: MyCustomColor().mMainColor(),
               height: 60,
               width: MediaQuery.of(context).size.width,
               radius: 99,
               onClick: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                 const DietPlanDetailScreen()
                 ));
               }),
         )
        ],
      ),
    );
  }
}
