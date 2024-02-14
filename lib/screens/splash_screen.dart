import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/navigator_bottom_bar.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/screens/welcome%20Pages/accept_policy_screen.dart';


import '../helper/mycustombutton.dart';
import 'onboard/onboardscreen1.dart';

class SplashScreen extends StatefulWidget {
   const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }


  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = true;

  Future<void> _checkCurrentUser() async {
    final User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      final interestsCollection = FirebaseFirestore.instance.collection('Interests');
      final interestsDoc = await interestsCollection.doc(currentUser.uid).get();

      if (interestsDoc.exists) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NavigatorBarScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AcceptPolicyScreen()
          ),
        );
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: MyCustomColor().mbackgroundColor(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 9,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  //  color: Colors.red,
                  //  height: 300,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/forpartum_logo.png'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(

                //  color: Colors.blue,
                child:_isLoading
                ? const CircularProgressIndicator():

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
                          text: "Get Started",
                          shadowColor: Colors.black,
                          onClick: () {
                            print("clicked");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  const Onboardscreen1(),
                                ));
                          },
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          radius: 30)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
