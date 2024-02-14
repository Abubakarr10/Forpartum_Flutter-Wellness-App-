import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../helper/textStyleHelper.dart';
import '../../helper/utitls.dart';
import '../../screens/register_screen.dart';

class SubmitPost extends StatefulWidget {
  const SubmitPost({super.key});

  static String downloadUrl = '';

  @override
  State<SubmitPost> createState() => _SubmitPostState();
}

class _SubmitPostState extends State<SubmitPost> {


  TextEditingController titleController = TextEditingController();
  TextEditingController captionsController = TextEditingController();

   File? postImage;
   final picker = ImagePicker();
   bool loading = false;



   Future getGalleryImage()async{
     final pickedFile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 100);
     setState(() {
       if(pickedFile!=null){
         postImage = File(pickedFile.path);
       }else{
         debugPrint('No image selected');
       }
     });
   }
   
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ===== Top Bar =====
            Stack(
              children: [
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: TextStyleHelper().mytext('New Post', 20, FontWeight.w600, Theme.of(context).colorScheme.secondary)
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

            Padding(
              padding: const EdgeInsets.only(top: 20,left: 30,right: 30,bottom: 30),
              child: Text('That thing you’ve been thinking about,we promise you’re not alone',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',fontSize: 16,fontWeight: FontWeight.w600,
                  color: MyCustomColor().mMainColor(),
                ),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30,right: 30,bottom: 30),
              child: Text('Submit a question or topic that you want the community to discuss.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',fontSize: 16,fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
              child: TextFormField(
                controller: titleController,
                cursorColor: MyCustomColor().mMainColor(),
              //  keyboardType: keyType,
                validator: (value) {
                  if (value!.isEmpty) {
               //     return returnMessage;
                  }
                  return null;
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: MyCustomColor().mMainColor()
                        ),
                      borderRadius: BorderRadius.circular(25)
                    ),
                    hintText: 'Topic title',
                    hintStyle:  const TextStyle(
                        fontSize: 14,
                        color: Colors.grey
                    ),
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(25.0))),
              ),
            ),

            /// ==== Text Form Paragraph =====
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 20),
              child: TextFormField(
                maxLines: 25, minLines: 10,
                controller: captionsController,
                decoration:  InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: MyCustomColor().mMainColor()
                        ),
                        borderRadius: BorderRadius.circular(25)
                    ),
                  hintText: 'Your thoughts on the topic...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                  hintStyle:  const TextStyle(
                      fontSize: 14,
                      color: Colors.grey
                  )
                ),
              ),
            ),

            /// ==== Linked Files Icon ====
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 45, width: 45,
                margin: const EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 30,offset: const Offset(0, 6)
                  )]
                ),
                child: InkWell(
                  onTap: ()async{

                     onUploadImageButtonPressed();

                    


                    // Get the download URL of the uploaded image

                     print('While uploading');
                     print(SubmitPost.downloadUrl);
                  },
                  child: Transform.rotate(
                    angle: 45 * 3.14159265359 / 180, // Rotate by 45 degrees (in radians)
                    child: Icon(Icons.attach_file_outlined,
                      color: MyCustomColor().mSecondaryColor(),
                    ),
                  ),
                )
              ),
            ),
            
            /// ==== Displaying Selected Image =====
            Container(
              height: 250, width: appWidth,
              margin: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: MyCustomColor().mMainColor(),
                  width: 2
                )
              ),
              child: postImage!=null? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(postImage!.absolute,fit: BoxFit.cover,),
              )
                  : const Text(''),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 40),
              child: RoundButton(text: 'Publish Post',
                  textColor: Colors.white,
                  loading: loading,
                  backgroundColor: MyCustomColor().mSecondaryColor(),
                  borderColor: MyCustomColor().mSecondaryColor(),
                  height: 60, width: appWidth, radius: 100,
                  onClick: ()async{
                try{
                  var user = FirebaseAuth.instance.currentUser;
                  if(user != null){
                    publishPostFireStore();
                    setState(() {
                      loading = true;
                    });
                  }else{
                    Utilities().toastMessage('Please check your network');
                  }
                } catch (error) {
                  Utilities().toastMessage(error.toString());
                }
                  }),
            )
          ],
        ),
      ),
    );
  }


  // Assuming this function is called when a button is tapped
  void onUploadImageButtonPressed() async {
    File? imageFile = await getGalleryImage(); // You should implement this function to get the image from the gallery or camera
    if (imageFile != null) {
      String? downloadUrl = await uploadImageToStorage(imageFile);
      if (downloadUrl != null) {
        // Image was uploaded successfully, you can now use the downloadUrl
        // Do something with downloadUrl, like displaying the image or saving it along with other data.
      } else {
        // Handle the case where image upload failed
        Utilities().toastMessage('Image upload failed');
      }
    } else {
      // Handle the case where the user canceled image selection
    }
  }

  // Function to upload the image to Firebase Storage
  Future<String?> uploadImageToStorage(File imageFile) async {
    final path = DateTime.now().millisecondsSinceEpoch.toString();
    final storageReference = FirebaseStorage.instance
        .ref()
        .child('post_pictures/${path}_post_pic.jpg');

    try {
      final UploadTask uploadTask = storageReference.putFile(imageFile);
      await uploadTask.whenComplete(() => null);

      if (uploadTask.snapshot.state == TaskState.success) {
        final String downloadUrl = await storageReference.getDownloadURL();
        return downloadUrl;
      } else {
        // Handle the case where the upload task fails
        return null;
      }
    } catch (e) {
      // Handle any errors that occur during the upload process
      print('Error uploading image: $e');
      return null;
    }
  }

// Function to save post data in Firestore
  Future<void> savePostData(String downloadUrl) async {
    var user = FirebaseAuth.instance.currentUser;
    var uuid = const Uuid();
    var postId = uuid.v1();

    // Reference to the user's document in Firestore
    final userDoc = FirebaseFirestore.instance.collection('Users').doc(user!.uid);

    // Fetch data from Firestore and update text controllers
    final userData = await userDoc.get();

    /// user data
    var userId = userData.get('userId');
    var profileImage = userData.get('profilePicUrl');
    var userName = userData.get('fullName');

    /// time data
    DateTime currentTime = DateTime.now();
    String formattedTime = formatTimeWithPeriod(currentTime.hour, currentTime.minute);
    var day = DateTime.now().day;
    var month = DateTime.now().month;
    var year = DateTime.now().year;

    // Create a new collection of interests with the document ID as user ID
    await FirebaseFirestore.instance.collection('Posts').doc(postId).set({
      'postId': postId,
      'userId': userId,
      'title': titleController.text.toString(),
      'captions': captionsController.text.toString(),
      'postImage': downloadUrl,
      'userName': userName.toString(),
      'profileImage': profileImage,
      'time': formattedTime.toString(),
      'day': day, 'month': month, 'year': year,
    }).then((value) {
      Utilities().toastMessage('Post Published Successfully');
    }).onError((error, stackTrace) {
      Utilities().toastMessage(error.toString());
      print('Post error: ');
      print(error.toString());
    });
    // update

    newScreen();
  }

// Function to publish the post
  void publishPostFireStore() async {

    String? downloadUrl = await uploadImageToStorage(postImage!);

    if (downloadUrl != null) {
      // Image upload was successful, now save post data
      await savePostData(downloadUrl);
      setState(() {
        loading = false;
      });
    } else {
      Utilities().toastMessage('Image upload failed');
    }
  }

  void newScreen(){
    Navigator.pop(context);
  }
}