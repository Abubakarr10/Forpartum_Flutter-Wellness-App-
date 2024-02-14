import 'package:flutter/material.dart';

import 'mycustomcolor.dart';

class TextStyleHelper {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextStyle myTextStyle(double fontSize, var fontWeight, var Color) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: Color,
    );
  }

  Container myTextButton(String title) {
    return Container(
      height: 42,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              color: Colors.grey,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Text mytext(String title, double fontSize, var fontWeight, Color color) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: 'Popphins',
      ),
    );
  }

  Row mutipleColorTextRow(String text1, var color1, double size1, String text2,
      var color2, double size2, VoidCallback onclick) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(right: 5),
            child: TextStyleHelper()
                .mytext(text1, size1, FontWeight.w900, color1)),
        InkWell(
          onTap: () {
            return onclick();
          },
          child: Container(
            child:
            TextStyleHelper().mytext(text2, size2, FontWeight.w900, color2),
          ),
        )
      ],
    );
  }

  Container mInputFields(
      final ctrl,
      var keyType,
      String returnMessage,
      String labelText,
      Color mainColor,
      String hintText,
      String iconPath,
      double width,
      double height,
      double marginLeft,
      double marginRight,
      double marginTop) {
    return Container(
      width: width,
      height: height,
      margin:
      EdgeInsets.only(left: marginLeft, right: marginRight, top: marginTop),
      child: TextFormField(
        controller: ctrl,
        cursorColor: MyCustomColor().mMainColor(),
        keyboardType: keyType,
        validator: (value) {
          if (value!.isEmpty) {
            return returnMessage;
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              color: mainColor
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyCustomColor().mMainColor()
              )
            ),
            prefixIcon:
            SizedBox(width: 15, height: 15, child: Image.asset(iconPath)),
            prefixIconColor: mainColor,
            hintStyle:  TextStyle(
              fontSize: 12,
              color: mainColor
            ),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }

  Container mInputFields2(
      final ctrl,
      var keyType,
      String returnMessage,
      String hintText,
      String iconPath,
      double width,
      double height,
      double marginLeft,
      double marginRight,
      double marginTop) {
    return Container(
      width: width,
      height: height,
      margin:
      EdgeInsets.only(left: marginLeft, right: marginRight, top: marginTop),
      child: TextFormField(
        controller: ctrl,
        keyboardType: keyType,
        validator: (value) {
          if (value!.isEmpty) {
            return returnMessage;
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: MyCustomColor().mMainColor()
                )
            ),
            prefixIcon:
            SizedBox(width: 15, height: 15, child: Image.asset(iconPath)),
            prefixIconColor: Colors.black,
            hintStyle: const TextStyle(
              fontSize: 12,
            ),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }


  Container mInputFieldsWithSuffix(
      final ctrl,
      String returnMessage,
      String labelText,
      Color mainColor,
      String hintText,
      String iconPath,
      String suffixPath,
      double width,
      double height,
      double marginLeft,
      double marginRight,
      double marginTop,
      final VoidCallback callback) {
    return Container(
      width: width,
      height: height,
      margin:
      EdgeInsets.only(left: marginLeft, right: marginRight, top: marginTop),
      child: ValueListenableBuilder(
        valueListenable: _obscurePassword,
        builder: (context, value, child) {
          return TextFormField(
            controller: ctrl,
            obscureText: _obscurePassword.value,
            obscuringCharacter: '*',
            validator: (value) {
              if (value!.isEmpty) {
                return returnMessage;
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(
                  color: mainColor
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: MyCustomColor().mMainColor()
                    )
                ),
                //    hintText: hintText,
                prefixIcon: SizedBox(
                    width: 15, height: 15, child: Image.asset(iconPath)),
                prefixIconColor: mainColor,
                suffixIcon: InkWell(
                    onTap: () {
                      callback;
                    },
                    child: Icon((_obscurePassword.value
                        ? Icons.visibility_off
                        : Icons.visibility))),
                suffixIconColor: Colors.black,
                hintStyle: const TextStyle(
                  fontSize: 12,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0))),
          );
        },
      ),
    );
  }

  Container socialIconsCard(String imagePath) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.0,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(imagePath),
      ),
    );
  }

  Container subscriptionBox(
      double width,
      String headText,
      String mainText,
      String subText,
      String imagePath,
      var activeColor,
      var activeBorderColor) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: activeColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: activeBorderColor,
            width: 2.0,
          )),
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        margin: const EdgeInsets.only(left: 20),
                        child: TextStyleHelper().mytext(headText, 14,
                            FontWeight.w500, MyCustomColor().mMainColor()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        margin: const EdgeInsets.only(left: 20),
                        child: TextStyleHelper().mytext(mainText, 24,
                            FontWeight.w800, MyCustomColor().mMainColor()),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        margin: const EdgeInsets.only(left: 20),
                        child: TextStyleHelper().mytext(subText, 18,
                            FontWeight.w600, MyCustomColor().mMainColor()),
                      ),
                    ],
                  )),
              Expanded(
                child: Container(
                  height: 80,
                  alignment: AlignmentDirectional.topEnd,
                  margin: const EdgeInsets.only(left: 20),
                  child: Image.asset('assets/images/ic_subscription.png'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
