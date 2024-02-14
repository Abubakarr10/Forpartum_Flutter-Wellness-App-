import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/utitls.dart';
import 'package:forpartum/screens/login_screen.dart';

import '../../helper/textStyleHelper.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';





class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {

  File? _file;
  double _uploadProgress = 0.0; // Progress value
  String _profilePicUrl = ''; // Add this line


  bool _uploadingProfilePicture = false; // Add this variable

  Future<void> _pickProfilePicture() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _file = File(pickedFile.path);
        _uploadProgress = 0.0; // Reset progress when selecting a new image
      });

      // Start uploading profile picture
      _uploadProfilePicture();
    }
  }





  Future<void> _uploadProfilePicture() async {
    setState(() {
      _uploadingProfilePicture = true;
    });

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null && _file != null) {
        final storageReference = FirebaseStorage.instance
            .ref()
            .child('profile_pictures/${user.uid}_profile_picture.jpg');

        final UploadTask uploadTask = storageReference.putFile(_file!);

        // Listen to changes in the upload task
        uploadTask.snapshotEvents.listen((event) {
          final progress = event.bytesTransferred / event.totalBytes;
          setState(() {
            _uploadProgress = progress;
          });
        });

        await uploadTask.whenComplete(() {
          setState(() {
            _uploadProgress = 1.0; // Set progress to 100% when completed
            _uploadingProfilePicture = false;
          });
          Utilities().toastMessage('Profile Picture Uploaded Successfully');
        });

        // Get the download URL of the uploaded image
        final String downloadUrl = await storageReference.getDownloadURL();

        // Update the profile picture URL in Firestore
        final userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);
        await userDoc.update({
          'profilePicUrl': downloadUrl,
        });
      }
    } catch (error) {
      print('Error uploading profile picture: $error');
      setState(() {
        _uploadingProfilePicture = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _uploadingProfilePicture;

    // Fetch user data from Firestore and update the text controllers
    fetchUserData();
  }

  TextEditingController fullNameController = TextEditingController();
  // TextEditingController middleNameController = TextEditingController();
  // TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController countryNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _signOut() async {
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure you want to sign out?'),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: MyCustomColor().mMainColor()
            ),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text('Yes',style: TextStyle(color: Colors.white,
                fontFamily: 'Poppins',fontWeight: FontWeight.w700),),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: MyCustomColor().mSecondaryColor().withOpacity(0.6)
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No',style: TextStyle(color: Colors.white,
            fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
          ),
        ],
      ),
    );

    if (result == true) {
      // User confirmed sign out
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  Future<void> fetchUserData() async {
    // Get the current user
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Reference to the user's document in Firestore
      final userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);

      // Fetch data from Firestore and update text controllers
      final userData = await userDoc.get();
      final data = userData.data(); // Retrieve all fields and values as a Map

      if (data != null) {
        setState(() {
          // Update the profile picture URL if available
          _profilePicUrl = data['profilePicUrl'] ?? '';
          fullNameController.text = data['fullName'] ?? '';
          // middleNameController.text = data['middleName'] ?? '';
          // lastNameController.text = data['lastName'] ?? '';
          phoneNoController.text = data['phoneNumber'] ?? '';
          cityNameController.text = data['city'] ?? '';
          countryNameController.text = data['country'] ?? '';
          emailController.text = data['email'] ?? '';
          passwordController.text = data['password'] ?? '';
        });
      }
    }
  }

  Future<void> _updateProfile() async {
    // Get the current user
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        // Reference to the user's document in Firestore
        final userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);

        // Update the fields in Firestore with the values from the text controllers
        await userDoc.update({
          'fullName': fullNameController.text,
          // 'middleName': middleNameController.text,
          // 'lastName': lastNameController.text,
          'phoneNumber': phoneNoController.text,
          'city': cityNameController.text,
          'country': countryNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          // Add more fields here as needed...
        });

        if (_file != null) {
          // Reference to the Firebase Storage location where the image will be stored
          final storageReference = FirebaseStorage.instance.ref().child('profile_pictures/${user.uid}_profile_picture.jpg');

          // Upload the image to Firebase Storage
          final UploadTask uploadTask = storageReference.putFile(_file!);
          await uploadTask.whenComplete(() => null);

          // Get the download URL of the uploaded image
          final String downloadUrl = await storageReference.getDownloadURL();

          // Update the profile picture URL in Firestore
          await userDoc.update({
            'profilePicUrl': downloadUrl,
          });
        }

        // Show a success message or navigate to another screen if needed
        print('Profile updated successfully');
        Utilities().toastMessage('Profile Updated Successfully');
      } catch (error) {
        // Handle any errors that occur during the update
        print('Error updating profile: $error');
      }
    }
  }





  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return  Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ===== Edit Personal Info  Header ======
            Stack(
              children: [
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: TextStyleHelper().mytext('Edit Profile', 20, FontWeight.w600, textColor)
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                          alignment: AlignmentDirectional.center,
                          child: Image.asset('assets/images/back_image.png')),
                    ),
                  ),)
              ],
            ),

            /// ===== Top Divider ======
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child:  Divider(thickness: 2,),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        // Profile picture
                        Container(
                          height: 80,
                          width: 80,
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          alignment: AlignmentDirectional.topEnd,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            image: DecorationImage(
                              image: _file != null
                                  ? FileImage(_file!) // Show the selected image
                                  : _profilePicUrl.isNotEmpty
                                  ? NetworkImage(_profilePicUrl) // Show the profile picture from Firebase Storage
                                  : const AssetImage('assets/images/dummyprofile.jpg') as ImageProvider, // Use a default image or placeholder
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Circular progress indicator when uploading
                        if (_uploadingProfilePicture)
                          CircularProgressIndicator(value: _uploadProgress),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _pickProfilePicture(); // Open the image picker when tapped
                          },
                          child: TextStyleHelper().mytext(
                            "Update Picture",
                            16,
                            FontWeight.w600,
                            textColor,
                          ),
                        ),
                        const SizedBox(height: 5,),
                        TextStyleHelper().mytext(
                          'Upload a photo under 2 MB',
                          12,
                          FontWeight.w500,
                          Colors.grey,
                        )
                      ],
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: (){
                      _signOut();
                    },
                    child: Icon(Icons.logout,
                      color: textColor,size: 28,),
                  ),
                )
              ],
            ),

            /// ===== Bottom Divider ======
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child:  Divider(thickness: 2,),
            ),

            /// >>>> Edit Personal Indo
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextStyleHelper().mytext("Personal Info", 18, FontWeight.w600, textColor)),
                ) ,
                /// ____First Name______
                TextStyleHelper().mInputFields2(
                    fullNameController,
                    TextInputType.text,
                    "Please enter your full Name",
                    "Full Name",
                    "assets/images/Profile.png",
                    appWidth, 50,
                    30, 30, 20),
                // /// ____Middle Name______
                // TextStyleHelper().mInputFields2(
                //     middleNameController,
                //     TextInputType.none,
                //     "Please enter your middle name",
                //     "Middle Name",
                //     "assets/images/Profile.png",
                //     appWidth, 50,
                //     30, 30, 20),
                // /// ____Last Name______
                // TextStyleHelper().mInputFields2(
                //     lastNameController,
                //     TextInputType.none,
                //     "Please enter your last name",
                //     "Last Name",
                //     "assets/images/Profile.png",
                //     appWidth, 50,
                //     30, 30, 20),
                /// ____Phone Number______
                TextStyleHelper().mInputFields2(
                    phoneNoController,
                    TextInputType.phone,
                    "Please enter phone Number",
                    "Phone Number",
                    "assets/images/Call.png",
                    appWidth, 50,
                    30, 30, 20),
                /// ____City Name______
                TextStyleHelper().mInputFields2(
                    cityNameController,
                    TextInputType.text,
                    "Please enter your city",
                    "City",
                    "assets/images/Message.png",
                    appWidth, 50,
                    30, 30, 20),
                /// ____Country Name______
                TextStyleHelper().mInputFields2(
                    countryNameController,
                    TextInputType.text,
                    "Please enter your country",
                    "Country",
                    "assets/images/Message.png",
                    appWidth, 50,
                    30, 30, 20),
              ],
            ),

            /// >>>> Edit Account Info
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30,top: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextStyleHelper().mytext("Account Info", 18, FontWeight.w600, textColor)),
                ) ,
                /// ___Email Address____
                TextStyleHelper().mInputFields2(
                    emailController,
                    TextInputType.emailAddress,
                    "Please enter your email",
                    "Email address",
                    "assets/images/Message.png",
                    appWidth, 50,
                    30, 30, 20),
                ///____User Password_____
                TextStyleHelper().mInputFields2(
                    passwordController,
                    TextInputType.text,
                    "Please enter your password",
                    "Password",
                    "assets/images/Lock.png",
                    appWidth, 50,
                    30, 30, 20),
                /// >>>> Edit Bio
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 30),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextStyleHelper().mytext("Bio", 18, FontWeight.w600, textColor)),
                ),
                ///______Bio_______
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 20),
                  child: TextFormField(
                    maxLines: 25, minLines: 10,
                    //  controller: captionsController,
                    decoration:  InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyCustomColor().mMainColor()
                            ),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        hintText: 'Edit your bio...',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                        hintStyle:  const TextStyle(
                            fontSize: 14,
                            color: Colors.grey
                        )
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
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
                  text: "Update Profile",
                  shadowColor: Colors.black,
                  onClick: () {
                    // Handle button click
                    _updateProfile();
                    print("Button clicked");
                    // Rest of your logic
                  },
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  radius: 30,
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
