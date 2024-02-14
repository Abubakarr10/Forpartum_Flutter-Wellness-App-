import 'package:flutter/material.dart';

class DietPlanStats extends StatelessWidget {
  const DietPlanStats({super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return  Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            child: Container(
              height: 222, width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: boxColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                  )
                ]
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomRow(myText: 'Proteins', myNum: '500'),
                    SizedBox(height: 10,), Divider(thickness: 1.5,), SizedBox(height: 10,),
                    CustomRow(myText: 'Calories', myNum: '2500'),
                    SizedBox(height: 10,), Divider(thickness: 1.5,), SizedBox(height: 10,),
                    CustomRow(myText: 'Fat', myNum: '300'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  final String myText;
  final String myNum;
   const CustomRow({super.key,
   required this.myText,
     required this.myNum
   });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(myText,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
        Text(myNum,style: const TextStyle(fontSize: 20,fontFamily: 'Poppins',fontWeight: FontWeight.w600,color: Color(0XFFB1AFE9)),)
      ],
    );
  }
}
