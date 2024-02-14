import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/navigator_bottom_bar.dart';
import 'package:forpartum/screens/forgotpages/forgot_screen.dart';

import '../../helper/mycustombutton.dart';
import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  _CreateNewPasswordScreenState createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
// Function to update password in Firestore
  Future<void> updatePasswordInFirestore(String phoneNumber) async {
    try {
      // Update the user's password in Firebase Authentication
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        await currentUser.updatePassword(confirmPasswordController.text.toString());
      }

      // Update the user's password in Firestore collection
      if (phoneNumber.isNotEmpty) {
        // Use the phone number to identify the user document in Firestore
        // and update the password field
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('Users')
            .where('phoneNumber', isEqualTo: phoneNumber)
            .get();
        if (snapshot.docs.isNotEmpty) {
          String docId = snapshot.docs[0].id;
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(docId)
              .update({'password': confirmPasswordController.text.toString()});
        }
      }

      // Navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  NavigatorBarScreen(),
        ),
      );
    } catch (e) {
      print("Error updating password: $e");
      // Handle password update error here
    }
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(top: 40, left: 20),
                          alignment: AlignmentDirectional.topStart,
                          child: Image.asset('assets/images/back_image.png')),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 30),
                        alignment: AlignmentDirectional.center,
                        child:
                        Image.asset('assets/images/logo_transparent.png'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child:  Text(
              'Create New Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          /// ===== Password Form =====
          TextStyleHelper().mytext(
              'Please enter new password', 14, FontWeight.w400, Colors.black),
          TextStyleHelper().mInputFields(
              passwordController,
              TextInputType.visiblePassword,
              'Please enter your Password',
              "Password",
              textColor,
              "Password",
              "assets/images/Lock.png",
              MediaQuery.of(context).size.width,
              50.0,
              30,
              30,
              20),

          /// ===== Confirm Password Form =====
          TextStyleHelper().mInputFields(
              confirmPasswordController,
              TextInputType.visiblePassword,
              'Please enter your Password again',
              "Confirm Password",
              textColor,
              "Confirm Password",
              "assets/images/Lock.png",
              MediaQuery.of(context).size.width,
              50.0,
              30,
              30,
              10),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 50,
                margin:
                const EdgeInsets.only(right: 30, left: 30, bottom: 20, top: 50),
                width: MediaQuery.of(context).size.width,
                child: RoundButton(
                    textColor: Colors.white,
                    backgroundColor: MyCustomColor().mMainColor(),
                    borderColor: MyCustomColor().mMainColor(),
                    text: "Change Password",
                    shadowColor: Colors.black,
                    onClick: () {
                      print("clicked");

                      print(ForgotScreen.phoneNumber);
                      updatePasswordInFirestore(ForgotScreen.countryCode+ForgotScreen.phoneNumber);

                    },
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    radius: 30)),
          ),
        ],
      ),
    );
  }
}
