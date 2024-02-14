import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustombutton.dart';

import '../../../helper/mycustomcolor.dart';
import '../../../helper/textStyleHelper.dart';

class AddJournalPrompt extends StatefulWidget {
  const AddJournalPrompt({super.key});

  @override
  State<AddJournalPrompt> createState() => _AddJournalPromptState();
}

class _AddJournalPromptState extends State<AddJournalPrompt> {

  final TextEditingController _textEditingController = TextEditingController();
  bool checked01 = false; bool checked02 = false; bool checked03 = false;

  @override
  Widget build(BuildContext context) {
    String boxHintText = "Remember, journaling can be a powerful tool for"
        "self-reflection and personal growth."
        "Take your time and write as much or as little as you'd like...";
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ===== Header =====
            Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                          //  alignment: AlignmentDirectional.topEnd,
                            child: Image.asset('assets/images/back_image.png')),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextStyleHelper().mytext('Birth Story Journal', 22, FontWeight.w600, textColor),
                        ],
                      ),
                    ),
                  ),
                ]
            ),

            /// ===== Calender =====
            Container(
              color: boxColor,
              margin: const EdgeInsets.only(top: 40,bottom: 40),
              child: DatePicker(
                DateTime.now(),
                height: 100, width: 60,
                initialSelectedDate: DateTime.now(),
                selectionColor: MyCustomColor().mSecondaryColor(),
                selectedTextColor: Colors.white,
                dateTextStyle: TextStyle(
                    fontWeight: FontWeight.w700,fontSize: 20, fontFamily: 'Poppins',
                    color: textColor
                ),
                dayTextStyle: TextStyle(
                    fontWeight: FontWeight.w400,fontSize: 12, fontFamily: 'Poppins',
                    color: textColor
                ),
                monthTextStyle: TextStyle(
                    fontWeight: FontWeight.w400,fontSize: 12, fontFamily: 'Poppins'
                    ,color: textColor
                ),
                onDateChange: (date){
                 // selectedDate=date;
                },
              ),
            ),

            /// ==== Text Form Paragraph =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextStyleHelper().mytext('How Did You Feel During Your Birth?',
                    18, FontWeight.w600, textColor),
              ),
            ),
            Container(
              height: 380, width: appWidth,
              margin: const EdgeInsets.only(left: 30,right: 30,top: 20),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  maxLines: 25, minLines: 10,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: boxHintText,
                    border: InputBorder.none,

                  ),
                ),
              ),
            ),

            /// ===== Offer Referrals to? ======
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextStyleHelper().mytext('Offer Referrals to?',
                    18, FontWeight.w600, textColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            checked01 = !checked01;
                          });
                          },
                        child: checked01 == true? const Checked() : const UnChecked(),
                      ),
                      const SizedBox(width: 10,),
                      TextStyleHelper().mytext('Life coaches', 14, FontWeight.w500, textColor),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            checked02 = !checked02;
                          });
                        },
                        child: checked02 == true? const Checked() : const UnChecked(),
                      ),
                      const SizedBox(width: 10,),
                      TextStyleHelper().mytext('Midwives', 14, FontWeight.w500, textColor),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            checked03 = !checked03;
                          });
                        },
                        child: checked03 == true? const Checked() : const UnChecked(),
                      ),
                      const SizedBox(width: 10,),
                      TextStyleHelper().mytext('Therapist', 14, FontWeight.w500, textColor),
                    ],
                  )
                ],
              ),
            ),

            /// ===== Save it Button =====
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
              child: RoundButton(
                  text: 'Save it',
                  textColor: Colors.white,
                  backgroundColor: MyCustomColor().mMainColor(), borderColor: MyCustomColor().mMainColor(),
                  height: 60, width: appWidth, radius: 100,
                  onClick: (){}),
            )

          ],
        ),
      ),
    );
  }
}

class Checked extends StatelessWidget {
  const Checked({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18, width: 18,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: MyCustomColor().mMainColor(),
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
              color: Colors.grey
          )
      ),
      child: const Align(
          alignment: Alignment.center,
          child: Icon(Icons.check,size: 13,
            color: Colors.white,)),
    );
  }
}

class UnChecked extends StatefulWidget {
  const UnChecked({super.key});

  @override
  State<UnChecked> createState() => _UnCheckedState();
}

class _UnCheckedState extends State<UnChecked> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18, width: 18,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
              color: Colors.grey
          )
      ),
    );
  }
}
