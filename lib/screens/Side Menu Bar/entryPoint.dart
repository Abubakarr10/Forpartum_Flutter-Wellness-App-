import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/dashboardScreen.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/screens/Side%20Menu%20Bar/side_menu.dart';


class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

bool SideBarOpen = false;

class _EntryPointState extends State<EntryPoint> {
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: MyCustomColor().mSecondaryColor(),
      body: Stack(
        children: [
          AnimatedPositioned(
              height: appHeight, width: 288,
              left: SideBarOpen == false? -288 : 0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              child: const SideMenu()),
          Transform.translate(
            offset:  Offset(SideBarOpen == true? 288 : 0, 0),
            child: Transform.scale(
              scale: SideBarOpen == true? 0.9 : 1,
              child:  ClipRRect(
                borderRadius: SideBarOpen == true? const BorderRadius.all(Radius.circular(90))
                    : BorderRadius.zero,
                child: const DashboardScreen(),
              ),
            ),
          ),
          Padding(
            padding: SideBarOpen == false? const EdgeInsets.only(top: 60,right: 30)
            : const EdgeInsets.only(top: 40,left: 250),
            child: Align(
              alignment: SideBarOpen == false? Alignment.topRight
                  : Alignment.topLeft,
              child: InkWell(
                onTap: (){
                  setState(() {
                    SideBarOpen = !SideBarOpen;
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  alignment: AlignmentDirectional.center,
                  decoration: SideBarOpen == false? const BoxDecoration(image: DecorationImage(image: AssetImage('assets/icons/menu.png')))
                      : const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/next_image.png'))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
