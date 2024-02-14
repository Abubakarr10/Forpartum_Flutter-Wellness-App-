import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/navigator_bottom_bar.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

class SideMenuTitle extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback buttonOnTap;
  const SideMenuTitle(
      {super.key,
      required this.title,
      required this.iconPath,
      required this.buttonOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
              onTap: () {
                buttonOnTap();
              },
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    //border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(100)),
                child: AppIcon(
                  iconPath: iconPath,
                  iconColor: Colors.white,
                  iconSize: 16,
                ),
              ),
              title: TextStyleHelper()
                  .mytext(title, 16, FontWeight.w500, Colors.white),
            ),
    );
  }
}

class SideMenuTitleSelected extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback buttonOnTap;
  const SideMenuTitleSelected(
      {super.key,
        required this.title,
        required this.iconPath,
        required this.buttonOnTap,
        });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 60,
          width: 270,
          alignment: Alignment.center,
          decoration:  const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(100))),
          child: ListTile(
            onTap: () {
              buttonOnTap();
            },
            leading: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color:  MyCustomColor().mMainColor() ,
                  //border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(100),
                  image:  DecorationImage(
                      image: AssetImage(iconPath),
                      fit: BoxFit.scaleDown)),
            ),
            title: TextStyleHelper()
                .mytext(title, 16, FontWeight.w700,Colors.black ),
          ),
        ),
      ),
    );
  }
}