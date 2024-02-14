import 'package:flutter/material.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';
import 'package:forpartum/screens/onboard/freetrialsscreen.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Onboardscreen1 extends StatefulWidget {
   const Onboardscreen1({super.key});

  @override
  State<Onboardscreen1> createState() => _Onboardscreen1State();
}

class _Onboardscreen1State extends State<Onboardscreen1> {
   final List<String> imagePaths = [
     'assets/images/splash_image.png',
     'assets/images/onboard_2.png',
     'assets/images/onboard_3.png',
     'assets/images/Onboard_4.png',
     'assets/images/Onboard_5.png',
     'assets/images/Onboard_6.png',
     'assets/images/onboard_7.png',
   ];
   final List<String> slideTexts = [
     'Welcome To',
     'A Holistic',
     'Weekly',
     'Milestone',
     'Personalized',
     'Gentle',
     'Professional',
   ];

   final List<String> slideTexts1 = [
     'Forpartum',
     'Approach',
     'Insights',
     'Tracker',
     'Meal Plan',
     'Movement',
     'Guidance',
   ];

   final List<String> whereTexts = [
     'Where postpartum',
     'Embrace a holistic approach to postpartum',
     'Receive weekly postpartum updates,',
     'Celebrate your own milestone as a ',
     'Discover personalized meal plans',
     'Nurture your body and mind with gentle ',
     'Connect with healthcare professionals for ',
   ];

   final List<String> wellnessTexts = [
     'Wellness comes first',
     'Beyond he traditional six weeks',
     'providing helpful insights',
     'parent with our tracker',
     'designed to nourish your body',
     'movements & reconnect with your core.',
     'personalized guidance on postpartum recovery',
   ];




   final PageController _pageController = PageController(
     initialPage: 7000, // A large initial page index
   );

   int _currentPageIndex = 7000;
   // Start at a large index to achieve looping

   final pageIndexNotifier = ValueNotifier<int>(0);

   void _onPageChanged(int index, CarouselPageChangedReason reason) {
     setState(() {
       _currentPageIndex = index;
     });

     // Check if the user reached the first or last page
     if (index == 0) {
       _pageController.jumpToPage(imagePaths.length - 1);
     } else if (index == imagePaths.length + 1) {
       _pageController.jumpToPage(1);
     }
   }


   Widget buildImageSlider() {
     return Column(
       children: [
         Expanded(
           flex: 5,
           child: CarouselSlider.builder(
             itemCount: imagePaths.length,
             options: CarouselOptions(
               initialPage: 7000,
               onPageChanged: _onPageChanged,
               viewportFraction: 1.0, // Full-width carousel
               enableInfiniteScroll: true, // Looping effect
             ),
             itemBuilder: (context, index, realIndex) {
               return Image.asset(
                 imagePaths[index],
                 fit: BoxFit.cover, // Occupies full height
               );
             },
           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 10.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: imagePaths.map((path) {
               int index = imagePaths.indexOf(path);
               return Container(
                 width: 8.0,
                 height: 8.0,
                 margin: const EdgeInsets.symmetric(horizontal: 4.0),
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color:
                   _currentPageIndex == index ? Colors.blue : Colors.grey
                 ),
               );
             }).toList(),
           ),
         ),
       ],
     );
   }

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              //  width: MediaQuery.of(context).size.width,
                              child: SizedBox(
                                height: 100,
                                child: Image.asset(
                                  'assets/images/logo_transparent.png',
                                  fit: BoxFit.fitHeight,
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: 70,
                                      height: 40,

                                  )],
                              )),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    TextStyleHelper().mutipleColorTextRow(
                      slideTexts[_currentPageIndex % slideTexts.length],
                      textColor, // Color for text1
                      22,
                      slideTexts1[_currentPageIndex % slideTexts1.length],
                      MyCustomColor().mMainColor(), // Color for text2
                      22, () {
                      //click event
                    },
                    ),


                    const SizedBox(
                      height: 5,

                    ),




                    TextStyleHelper().mytext(
                      whereTexts[_currentPageIndex % whereTexts.length],
                      14,
                      FontWeight.w400,
                      textColor,
                    ),
                    TextStyleHelper().mytext(
                      wellnessTexts[_currentPageIndex % wellnessTexts.length],
                      14,
                      FontWeight.w400,
                      textColor,
                    )
                  ],
                )),
            const SizedBox(height: 90,),
            Expanded(
              flex: 3,
              child: buildImageSlider(), // Image Slider
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          height: 50,
                          margin:
                          const EdgeInsets.only(right: 30, left: 30, bottom: 20),
                          width: MediaQuery.of(context).size.width,
                          child: RoundButton(
                              textColor: Colors.white,
                              backgroundColor: MyCustomColor().mMainColor(),
                              borderColor: MyCustomColor().mMainColor(),
                              text: "Join Forpartum",
                              shadowColor: Colors.black,
                              onClick: () {
                                print("clicked");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Freetrialsscreen(),
                                    ));
                              },
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              radius: 30)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: TextStyleHelper()
                                .socialIconsCard('assets/images/google.png')),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {},
                            child: TextStyleHelper()
                                .socialIconsCard('assets/images/twitter.png')),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {},
                            child: TextStyleHelper()
                                .socialIconsCard('assets/images/facebook.png')),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextStyleHelper().mutipleColorTextRow(
                        'Already have an account?',
                        Colors.black,
                        14,
                        'login',
                        MyCustomColor().mMainColor(),
                        14, (() {
                      //click event
                    }))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
