import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class UserDataStorage {
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('Users');

  Future<void> storeUserData(
      User currentUser, {
        required String name,
        required String email,
        required String phoneNumber,
        required String city,
        required String country,
        required String type,
        required String profilePicUrl,
        required String password,
        String time = '', // Default value for 'time'

      }) async {
    if (time.isEmpty) {
      final now = DateTime.now().toLocal();
      time = DateFormat('hh:mm a').format(now); // Format time as AM/PM
    }

    try {
      await userCollection.doc(currentUser.uid).set({
        'fullName': name,
        'email': email,
        'type': type,
        'userId': currentUser.uid,
        'phoneNumber': phoneNumber,
        'city': city,
        'country': country,
        'time': time,
        'profilePicUrl':profilePicUrl,
        'password':password,
        'following':[],
        'followers':[],


        // Add other fields as needed...
      }, SetOptions(merge: true));
    } catch (error) {
      print('Error storing user data: $error');
    }
  }

  Future<Map<String, dynamic>> getUserData(User currentUser) async {
    try {
      final userDataDoc = await userCollection.doc(currentUser.uid).get();
      if (userDataDoc.exists) {
        return userDataDoc.data() as Map<String, dynamic>;
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
    return {}; // Return an empty map if data is not found or an error occurs.
  }
}
