import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addCommentToPost(String postId, String userId, String commentText) async {
  try {
    final Timestamp timestamp = Timestamp.now();

    // Create a reference to the comments subcollection within the post document
    final postCommentsCollection = FirebaseFirestore.instance.collection('Posts').doc(postId).collection('comments');

    // Add a new comment document within the subcollection
    await postCommentsCollection.add({
      'userId': userId,
      'text': commentText,
      'timestamp': timestamp,
    });
  } catch (error) {
    print('Error adding comment: $error');
  }
}
