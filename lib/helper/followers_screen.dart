import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forpartum/helper/textStyleHelper.dart';
import 'package:intl/intl.dart';

class FollowingsScreen extends StatelessWidget {
  FollowingsScreen({super.key});

  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final currentUserUid = FirebaseAuth.instance.currentUser!.uid;

    if (currentUserUid.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('My Followers'), // Update the title
        ),
        body: const Center(
          child: Text('User not authenticated or user ID is empty.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: TextStyleHelper().mytext('My Followers', 16, FontWeight.bold, Colors.black), // Update the title
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getFollowersDataStream(currentUserUid), // Use the updated stream
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text('You have no followers.'); // Update the message
          } else {
            final followersDocs = snapshot.data!.docs;

            return ListView.builder(
              itemCount: followersDocs.length,
              itemBuilder: (context, index) {
                final followerData = followersDocs[index].data() as Map<String, dynamic>;
                final timestamp = followerData['timestamp'] as Timestamp;
                final dateTime = timestamp.toDate();

                final formattedTime = DateFormat.jm().format(dateTime);

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(followerData['profilePicUrl']),
                  ),
                  title: Text(followerData['name']), // Change to 'name' as per your data
                  subtitle: Text(formattedTime),
                  // You can add more details or actions here
                );
              },
            );
          }
        },
      ),
    );
  }

  // Function to fetch the followers' subcollection for the current user
  Stream<QuerySnapshot> getFollowersDataStream(String currentUserUid) {
    return _firestore.collection('Users').doc(currentUserUid).collection('followers').snapshots();
  }
}
