import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustombutton.dart';

import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';

class DbPostpartumBodyChanges extends StatefulWidget {
  const DbPostpartumBodyChanges({super.key});

  @override
  State<DbPostpartumBodyChanges> createState() => _DbPostpartumBodyChangesState();
}

class _DbPostpartumBodyChangesState extends State<DbPostpartumBodyChanges> {


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch article data from Firestore
  Future<List<Map<String, dynamic>>> fetchArticles() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection("Articles").get();

      // Convert query snapshot to a list of maps
      return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (error) {
      print("Error fetching articles: $error");
      return [];
    }
  }




  bool openButton = false;
  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    var appHeight = MediaQuery.of(context).size.height;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ===== Header =====
            Stack(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                          alignment: AlignmentDirectional.topEnd,
                          child: Image.asset('assets/images/back_image.png')),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextStyleHelper().mytext('Postpartum', 20, FontWeight.w600, textColor),
                        TextStyleHelper().mytext('Body Changes', 20, FontWeight.w600, textColor)
                      ],
                    ),
                  ),
                ),
              ]
            ),
            
            /// ==== Note =====
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                  child: TextStyleHelper().mytext("Click where you're experiencing\nsymptoms", 12, FontWeight.w400, Colors.grey)),
            ),

            /// ==== Postpartum Body =====
            Container(
              height: 670,
              width: appWidth,
              margin: const EdgeInsets.only(top: 20,bottom: 20),
              decoration:  const BoxDecoration(
                  color: Colors.white,
              ),
              child: Stack(
                children: [
                  /// >>> Body Image
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 200,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/full_body.png'))
                      ),
                    ),
                  ),
                  /// >>> Hair & Skin #1
                   Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ShowCustomButton(title: "Hair & Skin", subtitle: "web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web site",
                          onClick: (){
                        setState(() {
                          openButton = !openButton;
                        });
                          },openDialog: openButton,)
                    ),

                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 100,bottom: 20),
                                child: CustomButton(title: 'Breasts', textColor: MyCustomColor().mMainColor(), backgroundColor: Colors.white,
                                  borderColor: Colors.white,withShadow: true,height: 50,),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 220,bottom: 40,top: 10),
                                child: CustomButton(title: 'Uterus', textColor: MyCustomColor().mMainColor(), backgroundColor: Colors.white,
                                  borderColor: Colors.white,withShadow: true,height: 50,),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 240),
                                child: CustomButton(title: 'Lochia', textColor: MyCustomColor().mMainColor(), backgroundColor: Colors.white,
                                  borderColor: Colors.white,withShadow: true,height: 50,),
                              ),
                            ],
                          ),
                          const SizedBox(height: 100,),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 320,),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 210,top: 40),
                                child: CustomButton(title: 'Pain', textColor: MyCustomColor().mMainColor(), backgroundColor: Colors.white,
                                  borderColor: Colors.white,withShadow: true,height: 50,),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 210,top: 30),
                                child: CustomButton(title: 'Fluids', textColor: MyCustomColor().mMainColor(), backgroundColor: Colors.white,
                                  borderColor: Colors.white,withShadow: true,height: 50),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 200,top: 20),
                                child: CustomButton(title: 'Feet', textColor: MyCustomColor().mMainColor(), backgroundColor: Colors.white,
                                  borderColor: Colors.white,withShadow: true,height: 50),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 220,bottom: 20),
                                child: CustomButton(title: 'Pain', textColor: MyCustomColor().mMainColor(), backgroundColor: Colors.white,
                                  borderColor: Colors.white,withShadow: true,height: 50,),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 250,bottom: 40,top: 10),
                                child: CustomButton(title: 'Cervix', textColor: MyCustomColor().mMainColor(), backgroundColor: Colors.white,
                                  borderColor: Colors.white,withShadow: true,height: 50,),
                              ),
                            ],
                          ),
                          const SizedBox(height: 100,),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 380,),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 210,top: 40),
                                child: CustomButton(title: 'Gi/ Rectal', textColor: MyCustomColor().mMainColor(), backgroundColor: Colors.white,
                                  borderColor: Colors.white,withShadow: true,height: 50,),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 210,top: 30),
                                child: CustomButton(title: 'Hematology', textColor: MyCustomColor().mMainColor(), backgroundColor: Colors.white,
                                    borderColor: Colors.white,withShadow: true,height: 50),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 150,top: 40),
                                child: CustomButton(title: 'Hot Flashes', textColor: MyCustomColor().mMainColor(), backgroundColor: Colors.white,
                                    borderColor: Colors.white,withShadow: true,height: 50),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),


            /// ===== Proceed =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
              child: RoundButton(
                  text: "Proceed",
                  textColor: Colors.white,
                  backgroundColor: MyCustomColor().mMainColor(),
                  borderColor: MyCustomColor().mMainColor(),
                  height: 60, width: appWidth, radius: 99,
                  onClick: (){

                  }),
            )
          ],
        ),
      ),
    );
  }
}
