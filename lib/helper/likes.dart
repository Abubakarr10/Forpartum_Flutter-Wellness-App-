import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LikeService {
  Future<void> likePost(String postId) async {
    final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
    final postRef = FirebaseFirestore.instance.collection('Posts').doc(postId);
    final likeCollectionRef = postRef.collection('likes');

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = await FirebaseFirestore.instance.collection('Users').doc(user.uid).get();

      await likeCollectionRef.doc(postId).set({
        'userId': currentUserUid,
        'postId' : postId,
        'name': userData['fullName'], // Replace with the appropriate field for user's name
        'profilePicUrl': userData['profilePicUrl'], // Replace with the appropriate field for profile pic URL
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<void> dislikePost(String postId) async {
    final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
    final postRef = FirebaseFirestore.instance.collection('Posts').doc(postId);
    final likeCollectionRef = postRef.collection('likes');

    await likeCollectionRef.doc(postId).delete();
  }
}
