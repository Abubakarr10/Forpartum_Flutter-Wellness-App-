
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/screens/forgotpages/phone_verification_Screen.dart';

import '../../helper/mycustombutton.dart';
import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';
import 'email_verification_screen.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  static String verifiy = "";
  static String countryCode = "";
  static String phoneNumber = "";

  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {


  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  var phoneNo = "";



  @override
  Widget build(BuildContext context) {

    /// ==== Verify Phone Number Screen ======
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: const Text(
              'Verify Phone Number',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextStyleHelper().mytext('We have sent you on SMS with a code ', 14,
              FontWeight.w400, Colors.black),
          TextStyleHelper().mytext(
              'to your phone number', 14, FontWeight.w400, Colors.black),

          /// ===== PhoneNumber Form ======
          Form(
            key: _formKey,
            child: mChangeInputFields(
                phoneNumberController,
                countryCodeController,
                TextInputType.phone,
                phoneNo,
                'Please enter your phone number',
                "Phone Number",
                "Phone Number",
                "assets/images/Call.png",
                MediaQuery.of(context).size.width,
                50.0,
                30,
                30,
                20),
          ),

          /// ===== Try another way Link -> Email Verification Page =====
          Container(
              alignment: AlignmentDirectional.centerEnd,
              margin: const EdgeInsets.only(right: 30, top: 10),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EmailVerificationScreen(),
                      ));
                },
                child: Text(
                  "try another way",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: MyCustomColor().mMainColor(),
                      decoration: TextDecoration.underline),
                ),
              )),

          /// ==== Button -> OTP Screen (Phone Verification Screen) =====

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(right: 30, left: 30, bottom: 20, top: 50),
              width: MediaQuery.of(context).size.width,
              child: RoundButton(
                textColor: Colors.white,
                backgroundColor: MyCustomColor().mMainColor(),
                borderColor: MyCustomColor().mMainColor(),
                text: "Next",
                shadowColor: Colors.black,
                onClick: () async {
                  print("clicked");

                  ForgotScreen.countryCode = countryCodeController.text.toString();
                  ForgotScreen.phoneNumber = phoneNumberController.text.toString();

                  // Check if the user exists with the provided phone number
                  QuerySnapshot snapshot = await FirebaseFirestore.instance
                      .collection('Users')
                      .where('phoneNumber', isEqualTo: countryCodeController.text.toString() + phoneNumberController.text.toString())
                      .get();

                  if (snapshot.docs.isNotEmpty) {
                    // User exists, navigate to OTP verification screen
                    await _auth.verifyPhoneNumber(
                      phoneNumber: countryCodeController.text.toString() + phoneNumberController.text.toString(),
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException error) {},
                      codeSent: (String verificationId, int? resendToken) {
                        ForgotScreen.verifiy = verificationId;
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PhoneVerificationScreen()),
                    );
                  } else {
                    // User doesn't exist, show error message
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("User Not Found"),
                        content: const Text("There is no user with this phone number."),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                height: 50,
                width: MediaQuery.of(context).size.width,
                radius: 30,
              ),
            ),
          ),

        ],
      ),
    );
  }
}

Container mChangeInputFields(
    final ctrl,
    final countryCodeController,
    var keyType,
    var myValue,
    String returnMessage,
    String labelText,
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
    child: Row(
      children: [
        SizedBox(
          width: 60,

          /// ===== Country Code Field =====
          child: TextField(
            controller: countryCodeController,
            //  maxLength: 3,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: "+92",
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25.0))),
          ),
        ),
        const SizedBox(width: 8,),

        /// ===== Phone Number Field =====
        Expanded(
          child: TextFormField(
            controller: ctrl,
            onChanged: (value){
              myValue = value;
            },
            keyboardType: keyType,
            validator: (value){
              if(value!.isEmpty){
                return returnMessage;
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: labelText,
                hintText: '3001234567',
                prefixIcon:
                SizedBox(width: 15, height: 15, child: Image.asset(iconPath)),
                prefixIconColor: Colors.black,
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25.0))),
          ),
        ),
      ],
    ),
  );
}