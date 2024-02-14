import 'package:flutter/material.dart';
import 'package:forpartum/helper/textStyleHelper.dart';

class DbWeeklyUpdatesScreen extends StatefulWidget {
  const DbWeeklyUpdatesScreen({super.key});

  @override
  State<DbWeeklyUpdatesScreen> createState() => _DbWeeklyUpdatesScreenState();
}

class _DbWeeklyUpdatesScreenState extends State<DbWeeklyUpdatesScreen> {
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ===== Header =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: TextStyleHelper().mytext('Weekly Updates', 20, FontWeight.w600, textColor)
                    ),
                  ],
                ),
                Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                    alignment: AlignmentDirectional.topEnd,
                    child: Image.asset('assets/images/next_image.png')),
              ],
            ),


            //// ====== Image Box Wide ======
            Container(
              height: 200,
              width: double.maxFinite,
              margin: const EdgeInsets.only(top: 20,bottom: 20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/articles/weekly_update.png"),
                    fit: BoxFit.cover),
              ),
            ),

            /// ====== Weeks Postpartum ====
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  TextStyleHelper().mytext('0-4 Weeks Postpartum', 18, FontWeight.w600, textColor),
                  const SizedBox(height: 10,),
                  TextStyleHelper().mytext('Tuesday, May 23', 14, FontWeight.w500, Colors.grey),
                ],
              ),
            ),

            /// ===== Meal Paragraph Text =====
             const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text("when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently.\n\n"

                      "web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web site.\n\n"
                      "web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum'",
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),
                        strutStyle: StrutStyle(
                          height: 2.5
                    ),
                      textAlign: TextAlign.left,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
