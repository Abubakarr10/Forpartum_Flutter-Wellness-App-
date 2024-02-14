import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

class MyHabitsScreen extends StatefulWidget {
  const MyHabitsScreen({Key? key}) : super(key: key);

  @override
  State<MyHabitsScreen> createState() => _MyHabitsScreenState();
}

class _MyHabitsScreenState extends State<MyHabitsScreen> {
  Future<DocumentSnapshot<Map<String, dynamic>>>? _userData;

  @override
  void initState() {
    super.initState();
    _userData = fetchUserData();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Replace 'users' with the actual name of your Firestore collection
      return FirebaseFirestore.instance
          .collection('Interests')
          .doc(user.uid)
          .get();
    } else {
      throw Exception("User not authenticated");
    }
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color backgroundColor = Theme.of(context).colorScheme.background;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ====Header Settings=====
            Stack(
              children: [
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: TextStyleHelper().mytext('My Habits', 20, FontWeight.w600, Theme.of(context).colorScheme.secondary),
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
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/images/back_image.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextStyleHelper().mytext("Interests", 18, FontWeight.w600, Theme.of(context).colorScheme.secondary),
              ),
            ),
            /// ===== Top Divider ======
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Divider(thickness: 2),
            ),
            FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: _userData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(color: textColor,),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || !snapshot.data!.exists) {
                  return const Center(
                    child: Text('No user data available.'),
                  );
                } else {
                  final userData = snapshot.data!.data() as Map<String, dynamic>;
                  final interests = [
                    userData['interest1'],
                    userData['interest2'],
                    userData['interest3'],
                    userData['interest4'],
                    userData['interest5'],
                  ];
                  final babyBornDate = userData['babyBornDate'];
                  final age = userData['age'];
                  final mealCategory = userData['mealCategory'];

                  return Column(
                    children: [
                      for (int i = 0; i < interests.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: ListTile(
                                  title: Text(
                                    'Interest ${i + 1}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).colorScheme.secondary,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      // You can add actions here when tapping on an interest.
                                    },
                                    contentPadding: const EdgeInsets.all(10),
                                    title: Text(
                                      interests[i],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).colorScheme.secondary,
                                      ),
                                    ),
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: const Color(0XFFB1AFE9),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(Icons.interests, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextStyleHelper().mytext("Age", 18, FontWeight.w600, Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      /// ===== Top Divider ======
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Divider(thickness: 2),
                      ),
                Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Wrap(
                children: [

                Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text(
                age.toString(),
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.secondary,
                ),
                ),
                leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                color: const Color(0XFFB1AFE9),
                borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.accessibility, color: Colors.white),
                )))),



                    ],
                )
                ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextStyleHelper().mytext("Baby Born Date MM-DD-YYYY", 18, FontWeight.w600, Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      /// ===== Top Divider ======
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Divider(thickness: 2),
                      ),

                Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Wrap(
                children: [

                Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text(
                babyBornDate.toString(),
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.secondary,
                ),
                ),
                leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                color: const Color(0XFFB1AFE9),
                borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.child_friendly, color: Colors.white),
                ))))])),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextStyleHelper().mytext("Meal Category", 18, FontWeight.w600, Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      /// ===== Top Divider ======
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Divider(thickness: 2),
                      ),

                      Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Wrap(
                              children: [

                                Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: ListTile(
                                            contentPadding: const EdgeInsets.all(10),
                                            title: Text(
                                              mealCategory.toString(),
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                            leading: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: const Color(0XFFB1AFE9),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Icon(Icons.restaurant, color: Colors.white),
                                            ))))])),

                    ]
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInterestContainer(String text) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 35,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: boxColor,
            border: Border.all(color: Colors.grey)
          // Change the color as needed
        ),

        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Padding(

          padding: const EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(color: textColor), // Change the text color as needed
            ),
          ),
        ),
      ),
    );
  }
}
