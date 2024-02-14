import 'package:flutter/material.dart';
import 'package:forpartum/Dashboard/My%20Pofile%20Pages/Support%20&%20Privacy/support_privacy_2.dart';
import 'package:forpartum/helper/mycustombutton.dart';

import '../../../helper/mycustomcolor.dart';
import '../../../helper/textStyleHelper.dart';

class SupportAndPrivacyScreen extends StatefulWidget {
  const SupportAndPrivacyScreen({super.key});

  @override
  State<SupportAndPrivacyScreen> createState() => _SupportAndPrivacyScreenState();
}

class _SupportAndPrivacyScreenState extends State<SupportAndPrivacyScreen> {

  TextEditingController searchController = TextEditingController();

  List<String> questionsSupport = [
    'How to delete account?',
    'How do I add a new workout?',
    'How do I delete an exercise?',
    'How do delete my daily routine?',
    'How do I delete a set workout?'
  ];

  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ===== Support Header ====
            Stack(
              children: [
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: TextStyleHelper().mytext('Support', 20, FontWeight.w600, textColor)
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
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/images/back_image.png'))),
                  ),)
              ],
            ),

            /// ===== Search Bar =====
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)
                ),
                child:  ListTile(
                  leading: const Icon(Icons.search_outlined),
                  title: TextField(
                    controller: searchController,
                    cursorColor: MyCustomColor().mMainColor(),
                    decoration: const InputDecoration(
                      hintText: "Search Here...",
                      hintStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,fontFamily: "Poppins"),
                      border: InputBorder.none,
                    ),
                  ),
                  trailing: const SizedBox(
                    height: 40, width: 70,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6,horizontal: 10),
                          child: VerticalDivider(),
                        ),
                        Icon(Icons.mic_none_outlined)
                      ],
                    ),
                  ),
                ),
              ),
            ),

            /// ==== Live Chat Box =====
            Container(
              height: 140, width: appWidth,
              margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              decoration: BoxDecoration(
                color: MyCustomColor().mMainColor(),
                borderRadius: BorderRadius.circular(50)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 145,
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/live_support.png'))
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Barlow Font Family !! need
                        TextStyleHelper().mytext('Live Chat', 30, FontWeight.w600, Colors.white),
                        const SizedBox(height: 3,),
                        TextStyleHelper().mytext('with our support ', 16, FontWeight.w400, Colors.grey.shade300),
                        const SizedBox(height: 20,),
                        CustomButton(
                            title: 'Start',
                            textColor: Colors.white,
                            backgroundColor: const Color(0XFF7168D3),
                            borderColor: const Color(0XFF7168D3)
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
             const SizedBox(height: 20,),

             /// ====== Questions Options =======
             Wrap(
               children: List.generate(questionsSupport.length, (index) {
                 return InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> const SupportAndPrivacyScreen2()));
                   },
                   child: Card(
                     margin: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: ListTile(
                       title: TextStyleHelper().mytext(questionsSupport[index], 18, FontWeight.w500, textColor),
                       trailing: const Icon(Icons.arrow_forward_ios),
                     ),
                   ),
                 );
               }),
             )

          ],
        ),
      ),
    );
  }
}
