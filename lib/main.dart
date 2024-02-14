
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/My%20Pofile%20Pages/app_themes.dart';
import 'package:provider/provider.dart';

import 'Dashboard/navigator_bottom_bar.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

// updates
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ],
      child: Builder(builder: (BuildContext context){
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          title: 'FORPARTUM App',
          debugShowCheckedModeBanner: false,
          themeMode: themeChanger.themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
          home:  NavigatorBarScreen(),
        );
      }),
    );
  }
}
class TimerProvider with ChangeNotifier {
  int _timerCount = 120;
  bool _isButtonEnabled = true;

  int get timerCount => _timerCount;

  bool get isButtonEnabled => _isButtonEnabled;

  void startTimer() {
    _isButtonEnabled = false;
    _timerCount = 120;
    notifyListeners();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerCount > 0) {
        _timerCount--;
        notifyListeners();
      } else {
        timer.cancel();
        _isButtonEnabled = true;
        notifyListeners();
      }
    });
  }

  void resetTimer() {
    _isButtonEnabled = true;
    _timerCount = 0;

    notifyListeners();
  }
}




