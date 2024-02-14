import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/navigator_bottom_bar.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/screens/forgotpages/forgot_screen.dart';
import 'package:forpartum/screens/register_screen.dart';
import 'package:forpartum/screens/welcome%20Pages/accept_policy_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../helper/mycustombutton.dart';
import '../helper/textStyleHelper.dart';
import '../helper/utitls.dart';

///update

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String userEmail = "";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  bool loading = false;
  final _auth = FirebaseAuth.instance;
  ConnectivityResult _connectivityResult = ConnectivityResult.none;

  @override
  void initState() {
    super.initState();
    initConnectivity();
  }


  Future<void> initConnectivity() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    setState(() {
      _connectivityResult = result;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    _obscurePassword.dispose();
  }
  Future<bool> _onWillPop() async {
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure you want to close app?'),
        actions: <Widget>[
          ElevatedButton(

            style:ElevatedButton.styleFrom(backgroundColor: MyCustomColor().mMainColor(),),

            // borderColor: MyCustomColor().mMainColor(),,

            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
          ElevatedButton(
            style:ElevatedButton.styleFrom(backgroundColor: MyCustomColor().mMainColor(),),
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
        ],
      ),
    );

    if (result == true) {
      exit(0); // Close the app
    }

    return false; // Do not allow the user to exit normally
  }
  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

    try {
      await googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final String email = googleUser.email.toLowerCase();

      final QuerySnapshot<Map<String, dynamic>> userQuery = await FirebaseFirestore.instance
          .collection('Users')
          .where('email', isEqualTo: email)
          .get();

      if (userQuery.size > 0) {
        final DocumentSnapshot<Map<String, dynamic>> userDoc = userQuery.docs.first;
        final String registrationType = userDoc['type'];

        if (registrationType == 'Google') {
          // User registered with Google, proceed with login
          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );

          final UserCredential authResult = await _auth.signInWithCredential(credential);
          final User? currentUser = authResult.user;

          if (currentUser != null) {
            final interestsCollection = FirebaseFirestore.instance.collection('Interests');
            final interestsDoc = await interestsCollection.doc(currentUser.uid).get();

            if (interestsDoc.exists) {
              // User interests exist, navigate to the main screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavigatorBarScreen(),
                ),
              );
            } else {
              // User interests do not exist, navigate to the welcome screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AcceptPolicyScreen(),
                ),
              );
            }
          }
        } else {
          Utilities().toastMessage('You have registered using a different method. Please use that method to log in.');
        }
      } else {
        Utilities().toastMessage('Email does not exist in the Database. Please register first.');
      }
    } catch (error) {
      Utilities().toastMessage(error.toString());
    }
  }






  void login() async {
    setState(() {
      loading = true;
    });

    final String email = emailController.text.toLowerCase(); // Normalize to lowercase
    final String password = passwordController.text.toString();

    initConnectivity();

    try {
      final QuerySnapshot<Map<String, dynamic>> userQuery = await FirebaseFirestore.instance
          .collection('Users')
          .where('email', isEqualTo: email) // Use the normalized email field
          .get();

      if (userQuery.size > 0) {
        final DocumentSnapshot<Map<String, dynamic>> userDoc = userQuery.docs.first;
        final String registrationType = userDoc['type'];

        if (registrationType == 'Random Email & Password') {
          // User registered with email/password, proceed with login
          final UserCredential authResult = await _auth.signInWithEmailAndPassword(
            email: email.toLowerCase(),
            password: password,
          );
          final User? currentUser = authResult.user;

          if (currentUser != null) {
            final interestsCollection = FirebaseFirestore.instance.collection('Interests');
            final interestsDoc = await interestsCollection.doc(currentUser.uid).get();

            if (interestsDoc.exists) {
              // User interests exist, navigate to the main screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavigatorBarScreen(),
                ),
              );
            } else {
              // User interests do not exist, navigate to the welcome screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AcceptPolicyScreen(),
                ),
              );
            }
          }

        } else {
          Utilities().toastMessage('You have registered using a different method. Please use that method to log in.');
        }


      }
      else {
        Utilities().toastMessage('Email does not exist!. Please register first.');
      }
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuth exceptions
      if (e.code == 'user-not-found') {
        Utilities().toastMessage('No user found with this email. Please register first.');
      } else if (e.code == 'wrong-password') {
        Utilities().toastMessage('Incorrect password. Please try again.');
      } else {
        Utilities().toastMessage('An error occurred: ${e.message}');
      }
    } catch (error) {
      // Handle other exceptions
      Utilities().toastMessage('An error occurred: $error');
    } finally {
      setState(() {
        loading = false;
      });
    }
  }





  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  /// ====== Header ======
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=> const RegisterScreen()));
                              },
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  margin: const EdgeInsets.only(top: 40, left: 20),
                                  alignment: AlignmentDirectional.topStart,
                                  child: Image.asset('assets/images/back_image.png')),
                            ),
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(top: 30),
                                alignment: AlignmentDirectional.center,
                                child: Image.asset(
                                  'assets/images/logo_transparent.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          child:  Text(
                            'Hey there,',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child:  Text(
                            'Welcome Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// ===== Text form field =====
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /// ===== email address form =====
                            TextStyleHelper().mInputFields(
                                emailController,
                                TextInputType.emailAddress,
                                'Please enter your email address',
                                "Email",
                                textColor,
                              "Email",
                              "assets/images/Message.png",
                              MediaQuery.of(context).size.width,
                              50.0,
                              30,
                              30,
                              20),

                          /// ===== Password form =====
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            margin:
                            const EdgeInsets.only(left: 30, right: 30, top: 10),
                            child: ValueListenableBuilder(
                                valueListenable: _obscurePassword,
                                builder: (context, value, child) {
                                  return TextFormField(
                                    controller: passwordController,
                                    //   focusNode: passwordFocusNode,
                                    obscureText: _obscurePassword.value,
                                    obscuringCharacter: '*',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.lock_outline,
                                        size: 22,
                                        color: Colors.grey,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyCustomColor().mMainColor()
                                          )
                                      ),
                                      suffixIcon: InkWell(
                                          onTap: () {
                                            _obscurePassword.value =
                                            !_obscurePassword.value;
                                          },
                                          child: _obscurePassword.value? const Icon(
                                                 Icons.visibility_off,
                                            color: Colors.grey,
                                          ) :
                                          Icon( Icons.visibility,
                                            color: MyCustomColor().mSecondaryColor(),
                                          ),),
                                      label: const Text('Password'),
                                      labelStyle:  TextStyle(
                                        color: textColor
                                      ),
                                      hintStyle: const TextStyle(fontSize: 12),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(25.0)),
                                      fillColor: Colors.black,
                                    ),
                                    cursorColor: MyCustomColor().mMainColor(),
                                    );
                                  }),
                            ),

                          /// ===== Forget Screen? =====
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ForgotScreen(),
                                  ));
                            },
                            child: Container(
                                alignment: AlignmentDirectional.centerEnd,
                                margin: const EdgeInsets.only(right: 30, top: 10),
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: MyCustomColor().mMainColor(),
                                      decoration: TextDecoration.underline),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// ===== Login Button & Social Media =====
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            height: 50,
                            margin: const EdgeInsets.only(
                                right: 30, left: 30, bottom: 20, top: 140),
                            width: MediaQuery.of(context).size.width,

                            /// ===== Login Button =====
                            child: RoundButton(
                                loading: loading,
                                textColor: Colors.white,
                                backgroundColor: MyCustomColor().mMainColor(),
                                borderColor: MyCustomColor().mMainColor(),
                                text: "Login",
                                shadowColor: Colors.black,
                                onClick: () {
                                  print("clicked");

                                  if (_formKey.currentState!.validate()) {
                                    login();
                                  }
                                },
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                radius: 30)),
                      ),

                        /// ===== Social Media Buttons =====
                        Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(
                                    flex: 4,
                                    child: Divider(thickness: 1.2,color: Colors.grey,)),
                                Expanded(
                                    flex: 1,
                                    child: Align(
                                        alignment: FractionalOffset.center,
                                        child: TextStyleHelper().mytext('OR', 12, FontWeight.w400, textColor))),
                                const Expanded(
                                    flex: 4,
                                    child: Divider(thickness: 1.2,color: Colors.grey,)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    signInWithGoogle();
                                  },
                                  child: TextStyleHelper()
                                      .socialIconsCard('assets/images/google.png')),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: TextStyleHelper()
                                      .socialIconsCard('assets/images/twitter.png')),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: TextStyleHelper()
                                      .socialIconsCard('assets/images/facebook.png')),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextStyleHelper().mutipleColorTextRow(
                              "Don't have an account?",
                              textColor,
                              14,
                              'Register',
                              MyCustomColor().mMainColor(),
                              14, (() {
                            //click event
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ));
                          })),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
    );
  }
}
