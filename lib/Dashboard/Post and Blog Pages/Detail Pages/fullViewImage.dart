import 'package:flutter/material.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

class FullViewImage extends StatefulWidget {
  final String postTitle;
  final String postImageURL;
  const FullViewImage({super.key,
    required this.postTitle, required this.postImageURL
  });

  @override
  State<FullViewImage> createState() => _FullViewImageState();
}

class _FullViewImageState extends State<FullViewImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              height: 35,
              width: 35,
              margin: const EdgeInsets.only(left: 10),
              alignment: AlignmentDirectional.center,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/point.png'))
              ),
              child: const Center(child: Icon(Icons.clear,color: Colors.black,)),
          )),
        title: TextStyleHelper().mytext(widget.postTitle, 20, FontWeight.w500, Colors.white),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(widget.postImageURL))
        ),
      ),
    );
  }
}
