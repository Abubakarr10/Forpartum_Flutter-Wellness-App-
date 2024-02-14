
import 'package:forpartum/helper/user_data_storage.dart';


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/screens/login_screen.dart';
import 'package:forpartum/helper/notify.dart';
import 'package:forpartum/screens/welcome%20Pages/accept_policy_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../helper/mycustombutton.dart';
import '../helper/textStyleHelper.dart';
import '../helper/utitls.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:math';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/mailer.dart' as mailer;
import 'package:mailer/smtp_server/gmail.dart';





class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();


  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  List<String> notifications = [];











  @override
  void dispose() {
    // Dispose of your controllers to free up resources
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;




  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _obscurePassword2 = ValueNotifier<bool>(true);
  bool isChecked = false;
  bool loading = false;
  String otp = "";
  int otpTimestamp = 0;
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool passwordsMatch = true; // New state variable for password match validation

  final _formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  /// >>> FireBase <<<
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final fireStore = FirebaseFirestore.instance.collection('Users');
  Future<void> sendOTP(String email) async {
    int otpInt = Random().nextInt(999999);
    otp = otpInt.toString().padLeft(6, '0');
    otpTimestamp = DateTime.now().millisecondsSinceEpoch;

    final smtpServer = gmail("forpartum", "ijfijxezfxjtpxkw");
    final message = mailer.Message()
      ..from = const mailer.Address("forpartum@gmail.com")
      ..recipients.add(email)
      ..subject = "OTP Verification Code"
      ..text = "Your OTP code is $otp.";

    await mailer.send(message, smtpServer);

    Utilities().toastMessage("OTP code sent to your email address.");
  }

  @override
  void initState() {
    super.initState();
    initConnectivity();
    notify.initialize(_flutterLocalNotificationsPlugin);
  }

  Future<void> initConnectivity() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    setState(() {
      _connectivityResult = result;
    });
  }

  @override
  Future<void> signUpWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);



    try {
      // Sign out from any previously signed-in accounts
      await googleSignIn.signOut();

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // User cancelled the sign-in process
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCollection = FirebaseFirestore.instance.collection('Users');

      // Fetch user information from GoogleSignInAccount
      final name = googleUser.displayName ?? ''; // Use display name from Google
      final email = googleUser.email ?? '';

      // Check if the email already exists in the Firestore collection
      final querySnapshot = await userCollection.where('email', isEqualTo: email).get();
      if (querySnapshot.docs.isNotEmpty) {
        // Email already exists, show an error message or handle this case as needed
        Utilities().toastMessage("An account with this email already exists. Please log in.");
        return;
      }

      DateTime currentTime = DateTime.now();
      String formattedTime = formatTimeWithPeriod(currentTime.hour, currentTime.minute);

      // Create a new Firebase user with Google credentials
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      String userId = userCredential.user!.uid;

      // Get the new user's ID
      final currentUser = userCredential.user;
        // Update user's display name
        await currentUser!.updateDisplayName(name);

      // Store user data in Firestore with the 'time' field
      UserDataStorage().storeUserData(currentUser, name: name, email: email, phoneNumber:'', city:'', country: '',type: 'Google',profilePicUrl: '',password: '');
      Map<String, dynamic> userData = await UserDataStorage().getUserData(currentUser);
      notify.showAndStoreNotification(id: 0, title: 'Account created', body: 'Congrats! Account created successfully', fln: _flutterLocalNotificationsPlugin, userId: userId, firestore: _firestore, userData: userData);


      // Navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  const AcceptPolicyScreen(),
        ),
      );
    } catch (error) {
      // Handle errors using Firebase exceptions
      if (error is FirebaseAuthException) {
        if (error.code == 'user-canceled') {
          // User canceled the sign-in process
          Utilities().toastMessage("Sign-in process canceled.");
        } else {
          // Handle other Firebase exceptions
          Utilities().toastMessage("An error occurred: ${error.message}");
        }
      } else {
        // Handle other non-Firebase exceptions (e.g., no internet)
        Utilities().toastMessage("An error occurred: $error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //  FirebaseAuth _auth = FirebaseAuth.instance;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Header with logo <<<
                Expanded(
                  flex: 2,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          margin: const EdgeInsets.only(top: 25),
                          alignment: AlignmentDirectional.topCenter,
                          child: Image.asset(
                            'assets/images/logo_transparent.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'Hey there,',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Create an Account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ]),
                ),

                /// Text Field Forms <<<
                Expanded(
                  flex: 5,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// Full Name Form <<<
                        TextStyleHelper().mInputFields(
                          fullNameController,
                          TextInputType.name,
                          'Please enter your full name',
                          "Full Name",
                          textColor,
                          "Full Name",
                          "assets/images/Profile.png",
                          MediaQuery.of(context).size.width,
                          55,
                          30,
                          30,
                          20,
                        ),

                        /// Email Form <<<
                        TextStyleHelper().mInputFields(
                            emailController,
                            TextInputType.emailAddress,
                            'Please enter your email address',
                            "Email",
                            textColor,
                            "Email",
                            "assets/images/Message.png",
                            MediaQuery.of(context).size.width,
                            55,
                            30,
                            30,
                            10),

                        /// Phone Number Form <<<
                        TextStyleHelper().mInputFields(
                            phoneNumberController,
                            TextInputType.phone,
                            'Please enter your phone number',
                            "Phone Number",
                            textColor,
                            "Phone Number",
                            "assets/images/Call.png",
                            MediaQuery.of(context).size.width,
                            55,
                            30,
                            30,
                            10),

                        /// Password Form <<<
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          margin: const EdgeInsets.only(
                              left: 30, right: 30, top: 10),
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
                                            color:
                                                MyCustomColor().mMainColor())),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        _obscurePassword.value =
                                            !_obscurePassword.value;
                                      },
                                      child: _obscurePassword.value
                                          ? const Icon(
                                              Icons.visibility_off,
                                              color: Colors.grey,
                                            )
                                          : Icon(
                                              Icons.visibility,
                                              color: MyCustomColor()
                                                  .mSecondaryColor(),
                                            ),
                                    ),
                                    label: const Text('Password'),
                                    labelStyle: TextStyle(color: textColor),
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

                        /// Confirm Password Form <<<
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          margin: const EdgeInsets.only(
                              left: 30, right: 30, top: 10),
                          child: ValueListenableBuilder(
                              valueListenable: _obscurePassword2,
                              builder: (context, value, child) {
                                return TextFormField(
                                  controller: confirmPasswordController,
                                  //   focusNode: passwordFocusNode,
                                  obscureText: _obscurePassword2.value,
                                  obscuringCharacter: '*',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    else if (value != passwordController.text) {
                                      return 'Passwords do not match';
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
                                            color:
                                                MyCustomColor().mMainColor())),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        _obscurePassword2.value =
                                            !_obscurePassword2.value;
                                      },
                                      child: _obscurePassword2.value
                                          ? const Icon(
                                              Icons.visibility_off,
                                              color: Colors.grey,
                                            )
                                          : Icon(
                                              Icons.visibility,
                                              color: MyCustomColor()
                                                  .mSecondaryColor(),
                                            ),
                                    ),
                                    label: const Text('Confirm Password'),
                                    labelStyle: TextStyle(color: textColor),
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

                        /// Privacy Policy <<<
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          margin: const EdgeInsets.only(
                              left: 30, right: 30, top: 10),
                          child: Row(
                            children: [
                              Checkbox(
                                  value: isChecked,
                                  activeColor: MyCustomColor().mMainColor(),

                                  onChanged: (newBol) {
                                    setState(() {
                                      isChecked = newBol!;
                                    });
                                  }),
                              const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'By continuing you accept our',
                                      style: TextStyle(
                                          color: Color(0xFF7B6F72),
                                          fontSize: 11,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    TextSpan(
                                      text: ' ',
                                      style: TextStyle(
                                        color: Color(0xFFACA3A5),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        color: Color(0xFFEF6844),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' ',
                                      style: TextStyle(
                                        color: Color(0xFFACA3A5),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'and \n',
                                      style: TextStyle(
                                        color: Color(0xFF7B6F72),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Term of Use',
                                      style: TextStyle(
                                        color: Color(0xFFEF6844),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// ====== Register Button ======
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.only(
                                right: 30, left: 30, bottom: 20, top: 10),
                            width: MediaQuery.of(context).size.width,
                            child: RoundButton(
                              textColor: Colors.white,
                              loading: loading,
                              backgroundColor: MyCustomColor().mMainColor(),
                              borderColor: MyCustomColor().mMainColor(),
                              text: "Register",
                              shadowColor: Colors.black,
                              onClick: () async {
                                if (_formKey.currentState!.validate() & isChecked) {
                                  try {
                                    setState(() {
                                      loading = true;
                                    });

                                    // Send OTP to the provided email
                                    await sendOTP(emailController.text.trim().toLowerCase());

                                    // Show a dialog to collect the OTP from the user
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        String enteredOTP = "";
                                       // New variable to store user-entered OTP

                                        return AlertDialog(
                                          title: const Text("Enter OTP"),
                                          content: TextFormField(
                                            cursorColor: MyCustomColor().mMainColor(),
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                  borderSide: BorderSide(
                                                  color: MyCustomColor().mMainColor()
                                                )
                                              )
                                            ),
                                            onChanged: (value) {
                                              enteredOTP = value; // Store user-entered OTP
                                            },
                                          ),
                                          actions: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right: 10),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      MyCustomColor().mMainColor(),
                                                ),
                                                child: TextStyleHelper().mytext(
                                                    'Verify',
                                                    16,
                                                    FontWeight.w600,
                                                    Colors.white),
                                                onPressed: () async {
                                                  // Close the dialog

                                                  // Verify the entered OTP outside of the try block
                                                  if (enteredOTP == otp) {
                                                    Utilities().toastMessage(
                                                        'Otp verified successfully');
                                                    try {
                                                      setState(() {
                                                      loading = true;
                                                            });  // Proceed with registration
                                                      DateTime currentTime =
                                                          DateTime.now();
                                                      String formattedTime =
                                                          formatTimeWithPeriod(
                                                              currentTime.hour,
                                                              currentTime.minute);


                                                    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                                                      email: emailController.text.trim().toLowerCase(),
                                                      password: passwordController.text.trim(),
                                                    );



                                                    if (userCredential.user != null) {
                                                      String userId = userCredential.user!.uid;
                                                      final currentUser = userCredential.user;

                                                      UserDataStorage().storeUserData(currentUser!, name: fullNameController.text, email: emailController.text, phoneNumber: phoneNumberController.text, city: '', country: '', type:'Random Email & Password',profilePicUrl: '',password: passwordController.text);
                                                      // Assuming that getUserData returns a Future<Map<String, dynamic>>
                                                      Map<String, dynamic> userData = await UserDataStorage().getUserData(currentUser);













                                                      notify.showAndStoreNotification(id: 0, title:'Account created', body: 'Congrats! Your Account has been created sucessfully', fln: _flutterLocalNotificationsPlugin, userId: userId, firestore: _firestore, userData: userData);



                                                      // ElevatedButton(onPressed: (){
                                                      //   notify.showNotification(title: 'Account created', body: 'Congratulations! Your account has been created', fln:flutterlocalnotificationplugin);
                                                      //
                                                      // }, child: Text('Notify me',style: TextStyle(color: textColor),));









                                                      // Utilities().toastMessage('Account created Successfully');


                                                      // Navigate to the next screen
                                                      Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => const AcceptPolicyScreen(),
                                                        ));

                                                    //   );
                                                    //
                                                    }
                                                  } catch (error) {
                                                    Utilities().toastMessage(error.toString());
                                                    Navigator.pop(context);
                                                  } finally {
                                                    setState(() {
                                                      loading = false;
                                                    });
                                                  }
                                                } else {
                                                  Utilities().toastMessage("Invalid OTP entered.");
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    loading = false;
                                                  });
                                                }
                                              },
                                            ),
                                            )],
                                        );
                                      },
                                    );
                                  } catch (error) {
                                    Utilities().toastMessage(error.toString());
                                    setState(() {
                                      loading = false;
                                    });
                                  }
                                } else {
                                  // Display an error message or prevent registration if the checkbox is not checked
                                  Utilities().toastMessage("Please complete all the fields and accept the Privacy Policy to register.");
                                }

                              },
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              radius: 30,
                            ),
                          ),
                        ),

                        /// Social Media Buttons <<<
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Expanded(
                                      flex: 4,
                                      child: Divider(
                                        thickness: 1.2,
                                        color: Colors.grey,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Align(
                                          alignment: FractionalOffset.center,
                                          child: TextStyleHelper().mytext('OR',
                                              12, FontWeight.w400, textColor))),
                                  const Expanded(
                                      flex: 4,
                                      child: Divider(
                                        thickness: 1.2,
                                        color: Colors.grey,
                                      )),
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
                                      signUpWithGoogle();
                                    },
                                    child: TextStyleHelper().socialIconsCard(
                                        'assets/images/google.png')),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: TextStyleHelper().socialIconsCard(
                                        'assets/images/twitter.png')),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: TextStyleHelper().socialIconsCard(
                                        'assets/images/facebook.png')),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextStyleHelper().mutipleColorTextRow(
                                'Already have an account?',
                                textColor,
                                14,
                                'login',
                                MyCustomColor().mMainColor(),
                                14, (() {
                              //click event
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ));
                            })),
                          ],
                        ),

                      ],
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

String formatTimeWithPeriod(int hour, int minute) {
  String period = (hour < 12) ? 'AM' : 'PM';
  hour = hour % 12;
  hour = (hour == 0) ? 12 : hour;

  String formattedTime =
      "${_formatTwoDigits(hour)}:${_formatTwoDigits(minute)} $period";
  return formattedTime;
}

String _formatTwoDigits(int value) {
  return value.toString().padLeft(2, '0');
}

