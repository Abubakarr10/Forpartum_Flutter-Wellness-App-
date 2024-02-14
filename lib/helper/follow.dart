import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> followUser(String followedUserId) async {
  try {
    final currentUserUid = FirebaseAuth.instance.currentUser!.uid;

    // Retrieve the current user's information
    final currentUserData = await _firestore.collection('Users').doc(currentUserUid).get();

    if (currentUserData.exists) {
      final currentUserMap = currentUserData.data() as Map<String, dynamic>;

      // Add the follower's data to the followed user's followers subcollection
      await _firestore.collection('Users').doc(followedUserId).collection('followers').doc(currentUserUid).set({
        'uid': currentUserUid,
        'profilePicUrl': currentUserMap['profilePicUrl'], // Replace with the actual field name
        'name': currentUserMap['fullName'], // Replace with the actual field name
        'timestamp': FieldValue.serverTimestamp(), // Optionally, you can include a timestamp
      });
    } else {
      print('Current user not found');
    }

  } catch (error) {
    print('Error following user: $error');
  }

}

Future<void> unfollowUser(String followedUserId) async {
  try {
    final currentUserUid = FirebaseAuth.instance.currentUser!.uid;

    // Remove the follower's data from the followed user's followers subcollection
    await _firestore.collection('Users').doc(followedUserId).collection('followers').doc(currentUserUid).delete();
  } catch (error) {
    print('Error unfollowing user: $error');
  }
}

