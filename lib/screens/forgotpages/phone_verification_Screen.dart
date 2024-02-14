
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/screens/forgotpages/create_new_password_Screen.dart';
import 'package:pinput/pinput.dart';

import '../../helper/mycustombutton.dart';
import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';
import 'forgot_screen.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  static var code = "";

  @override
  _PhoneVerificationScreenState createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {


  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<String> pinValidator = ValueNotifier<String>('');

  String sumbit = "";

  /// OTP SCREEN

  @override
  Widget build(BuildContext context) {


    final defaultPinTheme = PinTheme(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: MyCustomColor().mMainColor(),width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.blue,width: 2),
      borderRadius: BorderRadius.circular(20),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,

      ),
    );

    void verifyOTP() async {
      String enteredOTP = PhoneVerificationScreen.code;
      if (enteredOTP == PhoneVerificationScreen.code) {
        try {
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: ForgotScreen.verifiy,
              smsCode: PhoneVerificationScreen.code);

          // Sign in with the credential
          UserCredential authResult = await _auth.signInWithCredential(credential);

          if (authResult.user != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const CreateNewPasswordScreen()),
            );
          }
        } catch (e) {
          print("Error verifying OTP: $e");
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Invalid OTP"),
              content: const Text("Please enter the correct OTP."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Invalid OTP"),
            content: const SizedBox(
              height: 100,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    size: 50,
                    color: Colors.red,
                  ),
                  SizedBox(height: 10,),
                  Text("Please enter the correct OTP."),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    }


    /// ====== OTP Screen ======
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
              'Phone Verification',
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
          TextStyleHelper().mytext(
              'Please Enter your OTP Here', 14, FontWeight.w400, Colors.black),
          const SizedBox(
            height: 30,
          ),

          /// ===== OTP Pin Code =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ValueListenableBuilder(
              valueListenable: pinValidator,
              builder: (context, value, child) {
                return Pinput(
                  // validator: (sumbit) {
                  //   return sumbit == PhoneVerificationScreen.code
                  //       ? 'Pin is correct'
                  //       : 'Pin is incorrect';
                  // },
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  onChanged: (value){
                    PhoneVerificationScreen.code = value;

                  },
                  length: 6,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                );
              },
            ),
          ),

          /// ====== Verify Code Button =====
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
                    text: "Verify Code",
                    shadowColor: Colors.black,
                    onClick: () {
                      print("clicked");

                      verifyOTP();

                    },
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    radius: 30)),
          ),
          const SizedBox(
            height: 10,
          ),


          /// ===== Resend Code =====
          TextStyleHelper().mytext("Didn't received any code yet?", 12,
              FontWeight.normal, Colors.black),
          Container(
              alignment: AlignmentDirectional.center,
              margin: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: ()async{
                  print("clicked");

                  await _auth.verifyPhoneNumber(
                      phoneNumber: ForgotScreen.countryCode+ForgotScreen.phoneNumber,
                      verificationCompleted: (PhoneAuthCredential credential){},
                      verificationFailed: (FirebaseAuthException error){},
                      codeSent: (String verificationId, int? resendToken){
                        ForgotScreen.verifiy = verificationId;
                      },
                      codeAutoRetrievalTimeout: (String verificationId){}
                  );
                },
                child: Text(
                  "Re-Send Code",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: MyCustomColor().mMainColor(),
                      decoration: TextDecoration.underline),
                ),
              )),
        ],
      ),
    );
  }
}
