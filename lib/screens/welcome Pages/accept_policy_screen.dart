import 'dart:io';

import 'package:flutter/material.dart';
import 'package:forpartum/screens/welcome%20Pages/visiting_button.dart';

import '../../helper/mycustombutton.dart';
import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';

class AcceptPolicyScreen extends StatefulWidget {
  const AcceptPolicyScreen({Key? key}) : super(key: key);

  @override
  State<AcceptPolicyScreen> createState() => _AcceptPolicyScreenState();
}

class _AcceptPolicyScreenState extends State<AcceptPolicyScreen> {

 // bool checked =  false;
  final ValueNotifier<bool> checked = ValueNotifier<bool>(false);

  Future<bool> _onWillPop() async {
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure you want to close app?'),
        actions: <Widget>[
          ElevatedButton(

            style:ElevatedButton.styleFrom(backgroundColor: MyCustomColor().mMainColor(),),

            // borderColor: MyCustomColor().mMainColor(),,

            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
          ElevatedButton(
            style:ElevatedButton.styleFrom(backgroundColor: MyCustomColor().mMainColor(),),
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
        ],
      ),
    );

    if (result == true) {
      exit(0); // Close the app
    }

    return false; // Do not allow the user to exit normally
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
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
                  Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(top: 40, left: 20),
                      alignment: AlignmentDirectional.topStart,
                      child: Image.asset('assets/images/back_image.png')),
                ],
              ),
            ),
            TextStyleHelper().mutipleColorTextRow('One last ', textColor,
                22, 'thing', MyCustomColor().mMainColor(), 22, (){
                  //click event
                }),
            const SizedBox(height: 10,),

            TextStyleHelper().mytext(
                'Data that you share with the app is saved', 14, FontWeight.w400, textColor),
            TextStyleHelper().mytext(
                'anonymously. Read and approve the terms', 14, FontWeight.w400, textColor),
            TextStyleHelper().mytext(
                'to continue.', 14, FontWeight.w400, textColor),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      checked.value = !checked.value;
                      print('Click hora hai');
                    },
                    child: checked.value  ?
                    Container(
                      height: 36,
                      width: 36,
                      margin: const EdgeInsets.only(top: 20, left: 20),
                      alignment: AlignmentDirectional.topStart,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: textColor,
                            width: 2
                        ),
                      ),
                    ) : SizedBox(
                        height: 36,
                        width: 36,
                        child: Image.asset('assets/images/blue_check.png')),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleHelper().mutipleColorTextRow(
                          'I have read and accept the', textColor, 14,
                          'terms of', MyCustomColor().mMainColor(), 14,
                              () {}),
                      TextStyleHelper().mutipleColorTextRow(
                          '&', textColor, 14,
                          'privacy policy', MyCustomColor().mMainColor(), 14,
                              () {}),
                    ],
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      checked.value = !checked.value;
                      print('Click hora hai');
                    },
                    child: checked.value  ?
                    Container(
                      height: 36,
                      width: 36,
                      margin: const EdgeInsets.only(top: 20, left: 20),
                      alignment: AlignmentDirectional.topStart,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: Colors.black,
                            width: 2
                        ),
                      ),
                    ) : SizedBox(
                        height: 36,
                        width: 36,
                        child: Image.asset('assets/images/blue_check.png')),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleHelper().mytext(
                          "I'm ok with Postpartum using the", 14, FontWeight.w400, textColor),
                      TextStyleHelper().mytext(
                          'health idea that I share with the app ', 14, FontWeight.w400, textColor),
                      TextStyleHelper().mytext(
                          'to give me a better app experience.', 14, FontWeight.w400, textColor),
                    ],
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      checked.value = !checked.value;
                      print('Click hora hai');
                    },
                    child: checked.value  ?
                    Container(
                      height: 36,
                      width: 36,
                      margin: const EdgeInsets.only(top: 20, left: 20),
                      alignment: AlignmentDirectional.topStart,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: Colors.black,
                            width: 2
                        ),
                      ),
                    ) : SizedBox(
                        height: 36,
                        width: 36,
                        child: Image.asset('assets/images/blue_check.png')),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleHelper().mutipleColorTextRow(
                          'I have read and accept the', textColor, 14,
                          'terms of', MyCustomColor().mMainColor(), 14,
                              () {}),
                      TextStyleHelper().mutipleColorTextRow(
                          '&', textColor, 14,
                          'privacy policy', MyCustomColor().mMainColor(), 14,
                              () {}),
                    ],
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      checked.value = !checked.value;
                      print('Click hora hai');
                    },
                    child: checked.value  ?
                    Container(
                      height: 36,
                      width: 36,
                      margin: const EdgeInsets.only(top: 20, left: 20),
                      alignment: AlignmentDirectional.topStart,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: Colors.black,
                            width: 2
                        ),
                      ),
                    ) : SizedBox(
                        height: 36,
                        width: 36,
                        child: Image.asset('assets/images/blue_check.png')),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleHelper().mytext(
                          "I'm ok with Postpartum using the", 14, FontWeight.w400, textColor),
                      TextStyleHelper().mytext(
                          'health idea that I share with the app ', 14, FontWeight.w400, textColor),
                      TextStyleHelper().mytext(
                          'to give me a better app experience.', 14, FontWeight.w400, textColor),
                    ],
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      checked.value = !checked.value;
                      print('Click hora hai');
                    },
                    child: checked.value  ?
                    Container(
                      height: 36,
                      width: 36,
                      margin: const EdgeInsets.only(top: 20, left: 20),
                      alignment: AlignmentDirectional.topStart,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: Colors.black,
                            width: 2
                        ),
                      ),
                    ) : SizedBox(
                        height: 36,
                        width: 36,
                        child: Image.asset('assets/images/blue_check.png')),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleHelper().mutipleColorTextRow(
                          'I have read and accept the', textColor, 14,
                          'terms of', MyCustomColor().mMainColor(), 14,
                              () {}),
                      TextStyleHelper().mutipleColorTextRow(
                          '&', textColor, 14,
                          'privacy policy', MyCustomColor().mMainColor(), 14,
                              () {}),
                    ],
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      checked.value = !checked.value;
                      print('Click hora hai');
                    },
                    child: checked.value  ?
                    Container(
                      height: 36,
                      width: 36,
                      margin: const EdgeInsets.only(top: 20, left: 20),
                      alignment: AlignmentDirectional.topStart,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: Colors.black,
                            width: 2
                        ),
                      ),
                    ) : SizedBox(
                        height: 36,
                        width: 36,
                        child: Image.asset('assets/images/blue_check.png')),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleHelper().mytext(
                          "I'm ok with Postpartum using the", 14, FontWeight.w400, textColor),
                      TextStyleHelper().mytext(
                          'health idea that I share with the app ', 14, FontWeight.w400, textColor),
                      TextStyleHelper().mytext(
                          'to give me a better app experience.', 14, FontWeight.w400, textColor),
                    ],
                  ),

                ],
              ),
            ),
            const SizedBox(height: 30,),
            // Last Button I Understand & Accept this
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
                      text: "I Understand & Accept this",
                      shadowColor: Colors.black,
                      onClick: () {
                        print("clicked");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VisitingButtons(),
                            ));
                      },
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      radius: 30)),
            ),
          ],
        ),
      ),
    );
  }
}
