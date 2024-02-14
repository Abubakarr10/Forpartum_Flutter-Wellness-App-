import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';

class ThemeChanger with ChangeNotifier  {

  var appThemeMode = ThemeMode.light;
  ThemeMode get themeMode => appThemeMode;

  void setTheme(themeMode){
    appThemeMode = themeMode;
    notifyListeners();
  }
}
ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.grey.shade50,
    shadowColor: Colors.grey.withOpacity(0.3),
    colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        background: Colors.grey.shade50,
        primary: Colors.white,
        secondary: Colors.black
    )
);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.black,
    shadowColor: Colors.black,
    cardTheme: CardTheme(
      shadowColor: Colors.grey.shade600,
      color: Colors.grey.shade900,
    ),
    colorScheme:  ColorScheme.dark(
      background: Colors.black,
      primary: Colors.grey.shade900,
      secondary: Colors.white,
    )
);

class AppThemesSettings extends StatefulWidget {
  const AppThemesSettings({super.key});

  static bool activeDarkTheme = false;

  @override
  State<AppThemesSettings> createState() => _AppThemesSettingsState();
}

class _AppThemesSettingsState extends State<AppThemesSettings> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return  Scaffold(
     backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [

          /// ===== Header Theme Settings =====
          Stack(
            children: [
              Positioned(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: TextStyleHelper().mytext('Settings', 20, FontWeight.w600, Theme.of(context).colorScheme.secondary)
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

          /// ====== Theme Settings =====
          Padding(
            padding: const EdgeInsets.only(left: 30,top: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: TextStyleHelper().mytext("Themes", 18, FontWeight.w600, Theme.of(context).colorScheme.secondary)),
          ) ,
          /// ===== Top Divider ======
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            child:  Divider(thickness: 2,),
          ),

          // ===== Themes Options ====
          Wrap(
            children: List.generate(1, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    ThemeCardLeft(title: "Light Mode", iconPath: Icons.light_mode_outlined,
                      onClick: (){
                      setState(() {
                        AppThemesSettings.activeDarkTheme = false;
                      });
                      },
                    ),
                    ThemeCardRight(title: "Dark Mode", iconPath: Icons.dark_mode_outlined,
                      onClick: (){
                      setState(() {
                        AppThemesSettings.activeDarkTheme = true;
                      });
                      },
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

class ThemeCardLeft extends StatelessWidget {
  final String title;
  dynamic iconPath;
  final VoidCallback onClick;
  ThemeCardLeft({super.key,
    required this.title,
    required this.iconPath,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 30,right: 10),
        child: InkWell(
          onTap: (){
            onClick();
          },
          child: Container(
            height: 170,
            width: appWidth,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary, //const Color(0XFFB1AFE9),
                borderRadius: BorderRadius.circular(30),
                boxShadow:  [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0,2),
                      blurRadius: 2
                  )
                ]
            ),
            child: RadioMenuButton<ThemeMode>(
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Icon Circle
                  Container(
                    height: 65, width: 65,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow:  [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0,2),
                              blurRadius: 2
                          )
                        ]
                    ),
                    child: Icon(iconPath,size: 40,
                      color: MyCustomColor().mMainColor(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: TextStyleHelper().mytext(title, 15, FontWeight.w600, Theme.of(context).colorScheme.secondary),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ThemeCardRight extends StatelessWidget {
  final String title;
  dynamic iconPath;
  final VoidCallback onClick;
  ThemeCardRight({super.key,
    required this.title,
    required this.iconPath,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    final themeChanger = Provider.of<ThemeChanger>(context);
    return  Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 30),
        child: InkWell(
          onTap: (){
            onClick();
          },
          child: Container(
            height: 170,
            width: appWidth,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(30),
                boxShadow:  [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0,2),
                      blurRadius: 2
                  )
                ]

            ),
            child: RadioMenuButton<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icons Circle
                  Container(
                    height: 65, width: 65,
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow:  [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0,2),
                              blurRadius: 2
                          )
                        ]
                    ),
                    child:  Icon(iconPath,size: 40,
                      color: MyCustomColor().mMainColor(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: TextStyleHelper().mytext(title, 16, FontWeight.w600, Theme.of(context).colorScheme.secondary),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
