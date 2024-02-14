import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/Post%20and%20Blog%20Pages/Detail%20Pages/fullViewImage.dart';
import 'package:forpartum/helper/likes.dart';

import '../../../helper/mycustombutton.dart';
import '../../../helper/mycustomcolor.dart';
import '../../../helper/textStyleHelper.dart';
import '../../My Pofile Pages/Notifications/notifications_screen.dart';
import '../../navigator_bottom_bar.dart';

class PostDetailsScreen extends StatefulWidget {
  final String title;
  final String username;
  final Widget postChild;
  final String postImageURL;
  final String profileImageURL;
  final String time;
  final String postId;
   const PostDetailsScreen({super.key,
    required this.postChild,
     required this.postId,
     required this.title, required this.username, required this.postImageURL, required this.profileImageURL, required this.time
  });


  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {

  @override
  void initState() {
    super.initState();
    // Fetch the initial like status from Firestore here and update the state accordingly
    fetchInitialLikeStatus();
  }



  Future<void> fetchInitialLikeStatus() async {
    // Query FireStore to check if the user has liked this post
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final likeDoc = await FirebaseFirestore.instance
          .collection('Posts')
          .doc(widget.postId)
          .collection('likes')
          .doc(widget.postId)
          .get();

      setState(() {
        // Update the likedPost and likedPostTap states based on the fetched like status
        likedPost = likeDoc.exists;

      });
    }
  }

  bool likedPost = false;
  bool likedPostTap = false;

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
            /// ===== Top App Bar  ====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      margin:
                      const EdgeInsets.only(top: 40, left: 20, right: 20),
                      alignment: AlignmentDirectional.topEnd,
                      child: Image.asset('assets/icons/back.png')),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: TextStyleHelper().mytext(
                        "${widget.username.split(' ').first}'s Posts" , 20, FontWeight.w600, textColor)),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const NotificationScreen()));
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(top: 40,left: 20, right: 20),
                    alignment: AlignmentDirectional.center,
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/icons/notification.png'))
                    ),
                  ),
                ),
              ],
            ),

            /// ==== Posts =====
            DynamicPostDetail(
              isLiked: likedPost,
                title: widget.title,
                name: widget.username,
                postChild: widget.postChild,
                postImageUrl: widget.postImageURL,
                postId: widget.postId,
                imageFullView: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  FullViewImage(
                      postTitle: widget.title,
                      postImageURL: widget.postImageURL)
                  ));
                },
                timeAgo: widget.time,
                profileImageUrl: widget.profileImageURL,
              likeTap: (){
                  setState(() {
                    likedPost = !likedPost;
                  });
                  // Update FireStore here to store the like status
              },
              likedImageDoubleTap: (){
                setState(() {
                  likedPost = true;
                  likedPostTap = true;
                });

                // Start a timer to hide the liked icon after 3 seconds
                Timer(const Duration(seconds: 1), () {
                  setState(() {
                    likedPostTap = false;
                  });
                });
              },
              doubleTapLike: likedPostTap,
              likeButton: likedPost == false? 'assets/icons/Heart.png' : 'assets/icons/sweetHeart.png',
              likeColor: likedPost == false? textColor : Colors.red,
              commentTap: (){

              },
            )
          ],
        ),
      ),
    );
  }
}

class DynamicPostDetail extends StatefulWidget {
  bool isLiked; // Add this parameter
  final String title;
  final String postId;
  final String name;
  final Widget postChild;
  final String postImageUrl; // URL for the post image
  final String profileImageUrl; // URL for the profile image
  final String timeAgo;
  final VoidCallback imageFullView;
  final VoidCallback likeTap;
  final String likeButton;
  final Color likeColor;
  final VoidCallback likedImageDoubleTap; //done
  final bool doubleTapLike; //done
  final VoidCallback commentTap;

  DynamicPostDetail({super.key,
    required this.title,
    required this.name,
    required this.postChild,
    required this.postImageUrl,
    required this.imageFullView,
    required this.profileImageUrl,
    required this.timeAgo,
    required this.isLiked,
    required this.postId,

    required this.likeTap, required this.likeButton, required this.likeColor, required this.commentTap, required this.likedImageDoubleTap, required this.doubleTapLike,
  });

  @override
  State<DynamicPostDetail> createState() => _DynamicPostDetailState();
}

class _DynamicPostDetailState extends State<DynamicPostDetail> {

  // Function to fetch the user's like status for the post from FireStore

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;

    return  Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextStyleHelper().mytext(widget.title, 16, FontWeight.w600, MyCustomColor().mMainColor()),
                CustomButton(
                  title: 'Follow',
                  textColor: Colors.grey,
                  backgroundColor: boxColor,
                  borderColor: Colors.grey,
                  radius: 10,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(widget.profileImageUrl), // Use NetworkImage to load the profile image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    TextStyleHelper().mytext(widget.name, 14, FontWeight.w600, textColor),
                    const SizedBox(height: 8),
                    TextStyleHelper().mytext(widget.timeAgo, 10, FontWeight.w500, Colors.grey),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10,bottom: 10),
               child: widget.postChild,
            ),
            widget.postImageUrl != ""? InkWell(
              onDoubleTap: ()async{
                widget.likedImageDoubleTap();
                // Call the toggleLike function with the post ID and isLiked status
                await LikeService().likePost(widget.postId);
                // Toggle the like status
                setState(() {
                  widget.isLiked = !widget.isLiked;
                });
              },
              onTap: (){
                widget.imageFullView();
              },
              child: Container(
                height: 270,
                width: appWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(widget.postImageUrl), // Use NetworkImage to load the post image
                    fit: BoxFit.cover,
                  ),
                ),
                 child: widget.doubleTapLike==true? Icon(Icons.favorite, size: 180,
                  color: MyCustomColor().mMainColor().withOpacity(0.7),)
                    : const SizedBox(width: 1,),
              ),
            ) :
            const SizedBox(width: 1,),
            const SizedBox(height: 10),
            const Divider(thickness: 2,color: Colors.grey,),
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 20,),
                InkWell(
                  onTap: () async {
                    // Call the toggleLike function with the post ID and isLiked status
                    if (widget.isLiked) {
                      // If the post is already liked, dislike it
                      await LikeService().dislikePost(widget.postId);
                    } else {
                      // If the post is not liked, like it
                      await LikeService().likePost(widget.postId);
                    }

                    // Toggle the like status
                    setState(() {
                      widget.isLiked = !widget.isLiked;
                    });

                    // Call the likeTap function to handle any other actions related to liking
                    widget.likeTap();
                  },
                  child: AppIcon(iconPath: widget.likeButton, iconColor: widget.likeColor, iconSize: 25),
                ),

                const SizedBox(width: 10),
                InkWell(
                    onTap: (){
                      widget.commentTap();
                    },
                    child: AppIcon(iconPath: 'assets/icons/chat.png', iconColor: textColor, iconSize: 22)),
                const SizedBox(width: 10),
                AppIcon(iconPath: 'assets/icons/send.png', iconColor: textColor, iconSize: 22),
              ],
            ),
          ],
        ),
      );
  }
}