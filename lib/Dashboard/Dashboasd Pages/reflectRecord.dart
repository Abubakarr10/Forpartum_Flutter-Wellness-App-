import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustombutton.dart';

import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';
import '../navigator_bottom_bar.dart';

class ReflectRecordScreen extends StatefulWidget {
  const ReflectRecordScreen({super.key});

  @override
  State<ReflectRecordScreen> createState() => _ReflectRecordScreenState();
}

class _ReflectRecordScreenState extends State<ReflectRecordScreen> {

  bool checked01 = false; bool checked02 = false;
  bool unSupported = false; bool afraid = false; bool helpless = false;
  bool guilty = false; bool numb = false;

  @override
  Widget build(BuildContext context) {

    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appWidth = MediaQuery.of(context).size.width;
    var appHeight = MediaQuery.of(context).size.height;
    TextEditingController detailController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ==== Top Bar =====
            Stack(
              children: [
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: TextStyleHelper().mytext('Reflect & Record', 20, FontWeight.w600, textColor)
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                        alignment: AlignmentDirectional.center,
                        child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/images/back_image.png'))),
                  ),)
              ],
            ),

            /// =====  Text =====
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 30,bottom: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext('How Did You Feel During Your Birth?', 18, FontWeight.w600, textColor)),
            ),

            /// ===== Buttons =====
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            unSupported = !unSupported;
                          });
                        },
                        child: CustomButton(
                            title: 'Unsupported',
                            textColor: unSupported == true? Colors.white : Colors.grey,
                            backgroundColor: unSupported == true? MyCustomColor().mMainColor() : backgroundColor,
                            borderColor: unSupported == true? MyCustomColor().mMainColor() : Colors.grey,
                          radius: 100, height: 50, width: appWidth, textSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            afraid = !afraid;
                          });
                        },
                        child: CustomButton(
                          title: 'Afraid',
                          textColor: afraid == true? Colors.white : Colors.grey,
                          backgroundColor: afraid == true? MyCustomColor().mMainColor() : backgroundColor,
                          borderColor: afraid == true? MyCustomColor().mMainColor() : Colors.grey,
                          radius: 100, height: 50, width: appWidth, textSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            helpless = !helpless;
                          });
                        },
                        child: CustomButton(
                          title: 'Helpless',
                          textColor: helpless == true? Colors.white : Colors.grey,
                          backgroundColor: helpless == true? MyCustomColor().mMainColor() : backgroundColor,
                          borderColor: helpless == true? MyCustomColor().mMainColor() : Colors.grey,
                          radius: 100, height: 50, width: appWidth, textSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            guilty = !guilty;
                          });
                        },
                        child: CustomButton(
                          title: 'Guilty',
                          textColor: guilty == true? Colors.white : Colors.grey,
                          backgroundColor: guilty == true? MyCustomColor().mMainColor() : backgroundColor,
                          borderColor: guilty == true? MyCustomColor().mMainColor() : Colors.grey,
                          radius: 100, height: 50, width: appWidth, textSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            numb = !numb;
                          });
                        },
                        child: CustomButton(
                          title: 'Numb',
                          textColor: numb == true? Colors.white : Colors.grey,
                          backgroundColor: numb == true? MyCustomColor().mMainColor() : backgroundColor,
                          borderColor: numb == true? MyCustomColor().mMainColor() : Colors.grey,
                          radius: 100, height: 50, width: appWidth, textSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(width: appWidth,),
                    ),
                  ),
                ],
              ),
            ),

            /// =====  Date of birth > Text =====
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 30,bottom: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext('Date of birth', 18, FontWeight.w600, textColor)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
              child: Card(
                color: boxColor,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                  title: TextStyleHelper().mytext('October 20, 2022', 16, FontWeight.w500, textColor),
                  trailing: Icon(Icons.calendar_month_outlined,color: textColor,),
                ),
              ),
            ),

            /// =====  Write In Detail > Text =====
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 10,bottom: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext('Write In Detail', 18, FontWeight.w600, textColor)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Container(
                height: 210, width: appWidth,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade500, blurRadius: 2)
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    cursorColor: MyCustomColor().mMainColor(),
                    controller: detailController,
                    minLines: 10, maxLines: 40,
                    decoration:  InputDecoration(
                      icon: SizedBox(
                          width: 20,
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: AppIcon(iconPath: 'assets/icons/edit.png'))),
                      iconColor: Colors.grey,
                      hintText: 'Tell us about your experience....',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 14,color: Colors.grey,fontFamily: 'Poppins',),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              )
            ),

            /// =====  Offer Referrals to > Text =====
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 30,bottom: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext('Offer Referrals to?', 18, FontWeight.w600, textColor)),
            ),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      checked01 = !checked01;
                    });
                  },
                  child: Container(
                    height: 25,width: 28,
                    margin: const EdgeInsets.only(left: 30,right: 10),
                    decoration: checked01 == true? BoxDecoration(
                      color:  const Color(0XFFB1AFE9),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color(0XFFB1AFE9),
                      ),
                    ):
                    BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey
                      ),
                    ),
                      child: checked01 == true? const Icon(Icons.done_outline,
                        color: Colors.white,size: 20,)
                          : const Icon(Icons.shape_line,
                        size: 1,)
                  ),
                ),
                TextStyleHelper().mytext('Life coaches', 14, FontWeight.w500, textColor),
                 InkWell(
                   onTap: (){
                     setState(() {
                       checked02 = !checked02;
                     });
                   },
                   child: Container(
                    height: 25,width: 28,
                    margin: const EdgeInsets.only(left: 30,right: 10),
                    decoration: checked02 == true? BoxDecoration(
                      color:  const Color(0XFFB1AFE9),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color(0XFFB1AFE9),
                      ),
                    ): BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: Colors.grey
                      ),
                    ),
                    child: checked02 == true? const Icon(Icons.done_outline,
                      color: Colors.white,size: 20,)
                        : const Icon(Icons.shape_line,
                          size: 1,),
                ),
                 ),
                TextStyleHelper().mytext('Midwives', 14, FontWeight.w500, textColor),
              ],
            ),

            /// ======= Last Save it Round Button =====
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
              child: RoundButton(
                  text: 'Save It',
                  textColor: Colors.white,
                  backgroundColor: MyCustomColor().mMainColor(),
                  borderColor: MyCustomColor().mMainColor(),
                  height: 60, width: appWidth, radius: 100,
                  onClick: (){

                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

