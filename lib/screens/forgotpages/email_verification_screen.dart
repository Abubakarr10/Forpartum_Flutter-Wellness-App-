import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../../helper/mycustombutton.dart';
import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';
import '../../helper/utitls.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
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
              'Email Verification',
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
          TextStyleHelper().mytext('Please enter your email address', 14,
              FontWeight.w400, Colors.black),
          TextStyleHelper().mytext('You will receive a link to create a', 14,
              FontWeight.w400, Colors.black),
          TextStyleHelper().mytext(
              'new password via email', 14, FontWeight.w400, Colors.black),

          /// ===== Email Form =====
          Form(
            key: _formKey,
            child: Column(
              children: [

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin:
                  const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "Please enter your email address",
                        hintText: "Email",
                        prefixIcon:
                        SizedBox(width: 15, height: 15, child: Image.asset("assets/images/Message.png")),
                        prefixIconColor: Colors.black,
                        hintStyle: const TextStyle(
                          fontSize: 12,
                        ),
                        border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(25.0))),
                  ),
                ),

                /// ===== Submit Button =====
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 50,
                      margin:
                      const EdgeInsets.only(right: 30, left: 30, bottom: 20, top: 150),
                      width: MediaQuery.of(context).size.width,
                      child: RoundButton(
                          textColor: Colors.white,
                          backgroundColor: MyCustomColor().mMainColor(),
                          borderColor: MyCustomColor().mMainColor(),
                          text: "Submit",
                          shadowColor: Colors.black,
                          onClick: () {
                            print("clicked on Submit button");
                            if (_formKey.currentState!.validate()) {
                              _auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value){
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Verify Email"),
                                    content:  SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.email_outlined,
                                            size: 50,color: MyCustomColor().mMainColor(),),
                                          const SizedBox(height: 10,),
                                          const Text("Please check your email inbox"),
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
                              }).onError((error, stackTrace){
                                Utilities().toastMessage(error.toString());
                              });
                            }
                          },
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          radius: 30)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
