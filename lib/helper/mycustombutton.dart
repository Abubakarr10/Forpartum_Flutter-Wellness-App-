import 'package:flutter/material.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

import 'mycustomcolor.dart';

/// Update

class RoundButton extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  Color? shadowColor;
  final String text;
  double? textSize;
  final VoidCallback onClick;
  IconData? iconData;
  double? iconSize;
  Color? iconColor;
  double borderWidth;
  double height;
  double width;
  double radius;
  bool isIcon;
  final bool loading;

  RoundButton(
      {Key? key,
      required this.text,
        this.textSize=16,
      required this.textColor,
      required this.backgroundColor,
      required this.borderColor,
        this.borderWidth=1.0,
      this.shadowColor,
      this.iconData,
        this.iconSize=16,
        this.iconColor=Colors.white,
      required this.height,
      required this.width,
      required this.radius,
      required this.onClick, 
        this.loading = false,
      this.isIcon = false
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        return onClick();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.pink.withOpacity(0.2),
                blurRadius: 40,
                offset: const Offset(0, 10),
              )
            ],
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            )),
        child: Center(
          child: loading?  const CircularProgressIndicator(color: Colors.white,strokeWidth: 3,) :
          Text(text, style:  TextStyle(color: textColor,fontSize: textSize,fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}

class ShowCustomButton extends StatelessWidget {
  final String title;
  final String subtitle;
  bool openDialog;
  final VoidCallback onClick;
   ShowCustomButton({super.key,
  required this.title,
    required this.subtitle,
    this.openDialog=false,
     required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: (){
          onClick();
          print('CLick hora hai');
        },
        child: openDialog == false? CustomButton(title: title, textColor: MyCustomColor().mMainColor(), backgroundColor: Colors.white,
          borderColor: Colors.white,withShadow: true,height: 50,) :
        Container(
          height: 100, width: 165,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: MyCustomColor().mMainColor(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextStyleHelper().mytext(title, 12, FontWeight.w600, Colors.white),
                const SizedBox(height: 5,),
                TextStyleHelper().mytext(subtitle,
                    8, FontWeight.w400, Colors.white)
              ],
            ),
          ),
        ),
      );
  }
}


class CustomButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  Color? borderColor;
  double? radius;
  double? height;
  double? width;
  double? textSize;
  bool? withShadow;
   CustomButton({super.key,
  required this.title,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    this.radius=50,
     this.height=35,
     this.width=100,
     this.textSize=12,
     this.withShadow=false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
     // margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius!),
        border: Border.all(
          color: borderColor!,
          width: 1
        ),
          boxShadow: withShadow == true? [
            const BoxShadow(color: Colors.black,blurRadius: 0.5,offset: Offset(0, 0.5))
          ] : []
      ),
      child: Center(
        child: Text(title,style: TextStyle(fontSize:textSize!,fontWeight: FontWeight.w600,color: textColor),
            textAlign: TextAlign.center),
      )
    );
  }
}
