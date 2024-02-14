import "package:buttons_tabbar/buttons_tabbar.dart";
import"package:flutter/material.dart";
import "package:forpartum/Dashboard/Dashboasd%20Pages/Postpartum%20Wellness/postpartumWellnessResult.dart";
import "package:forpartum/helper/mycustombutton.dart";
import "package:forpartum/helper/textStyleHelper.dart";

import "../../../helper/mycustomcolor.dart";

class PostpartumWellnessQuiz extends StatefulWidget {
  const PostpartumWellnessQuiz({super.key});

  @override
  State<PostpartumWellnessQuiz> createState() => _PostpartumWellnessQuizState();
}

class _PostpartumWellnessQuizState extends State<PostpartumWellnessQuiz> with
    TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 10, vsync: this);
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Postpartum Wellness',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const PostpartumWellnessResult()));
                  },
                  child: Container(
                      height: 43,
                      width: 43,
                      margin: const EdgeInsets.only(top: 35, left: 20, right: 20),
                      child: Image.asset('assets/icons/check.png',
                        fit: BoxFit.contain,)),
                ),
              ],
            ),

            /// ===== Questions Numbers Bar  ======
            Container(
              height: 64,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 40, bottom: 10,left: 30,right: 30),
              decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: MyCustomColor().mSecondaryColor(),
                  ),
                  boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 30, offset: const Offset(0, 10)
                  )]
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTabController(
                  length: 10,
                  child: Column(
                    children: <Widget>[
                      ButtonsTabBar(
                        controller: tabController,
                        /// >> styles and colors
                        backgroundColor: MyCustomColor().mSecondaryColor(),
                        unselectedBackgroundColor: MyCustomColor().mSecondaryColor().withOpacity(0.5),
                        labelStyle: const TextStyle(
                            color: Colors.white, //Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                        unselectedLabelStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        unselectedBorderColor: MyCustomColor().mSecondaryColor(),
                        contentPadding: const EdgeInsets.only(
                             left: 15, right: 15),
                        buttonMargin:
                        const EdgeInsets.symmetric(horizontal: 10),
                        radius: 100,
                        tabs: const [
                          Tab(text: '1'), Tab(text: '2'),
                          Tab(text: '3'), Tab(text: '4'),
                          Tab(text: '5'), Tab(text: '6'),
                          Tab(text: '7'), Tab(text: '8'),
                          Tab(text: '9'), Tab(text: '10'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// ===== Options Tab Bar View ====
            Column(
              children: [
                SizedBox(
                  height: appHeight*1.1/2,
                  width: appWidth,
                  child: TabBarView(controller: tabController, children: const [
                    SingleChildScrollView(child: QuizOptions01()),
                    SingleChildScrollView(child: QuizOptions02()),
                    SingleChildScrollView(child: QuizOptions03()),
                    SingleChildScrollView(child: QuizOptions04()),
                    SingleChildScrollView(child: QuizOptions05()),
                    SingleChildScrollView(child: QuizOptions06()),
                    SingleChildScrollView(child: QuizOptions07()),
                    SingleChildScrollView(child: QuizOptions08()),
                    SingleChildScrollView(child: QuizOptions09()),
                    SingleChildScrollView(child: QuizOptions10()),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OptionBox extends StatelessWidget {
  String optionNo;
  String answer;
   OptionBox({super.key,
  required this.optionNo, required this.answer
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 80, width: appWidth,
      margin: const EdgeInsets.only(left: 30,right: 30,top: 20),
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey, width: 0.5
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                height: 42, width: 42,
                margin: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      color: Colors.grey
                  ),
                ),
                child: Center(child: TextStyleHelper().mytext(optionNo, 16, FontWeight.w600, textColor)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Text(answer,style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400, color: textColor,
                    fontFamily: 'Poppins'
                ),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class SelectedOptionBox extends StatelessWidget {
  String optionNo;
  String answer;
   SelectedOptionBox({super.key,
     required this.optionNo, required this.answer
   });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 85, width: appWidth,
      margin: const EdgeInsets.only(left: 30,right: 30,top: 20),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: MyCustomColor().mMainColor()
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Row(
              children: [
                Container(
                  height: 50, width: 50,
                  decoration: BoxDecoration(
                    color: MyCustomColor().mMainColor(),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(child: TextStyleHelper().mytext(optionNo, 18, FontWeight.w600, Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 10),
                  child: Text(answer,style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w700, color: textColor,
                    fontFamily: 'Poppins'
                  ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<String> optionsNumber = [
  'A.', 'B.', 'D.', 'C.', 'E.',
];

List<String> quizAnswers = [
  'User Interface and User Experience','User Interface and User Ex',
  'User ID and Using Experience','User Interface and the Experience',
  'Using Interface and Using Experience'
];

class QuizOptions01 extends StatefulWidget {
  const QuizOptions01({super.key});

  @override
  State<QuizOptions01> createState() => _QuizOptions01State();
}

class _QuizOptions01State extends State<QuizOptions01> {

  bool selectedOption = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        
        /// ===== Question ====
        Padding(
          padding: const EdgeInsets.only(left: 30,top: 40,bottom: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextStyleHelper().mytext('What is the meaning of UI UX Design?',
                16,FontWeight.w600,textColor),
          ),
        ),

        Wrap(
          children: List.generate(5, (index) {
            return InkWell(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                  selectedIndex == index? selectedOption = true : selectedOption = false;
                });
              },
              child: selectedIndex != index? OptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index])
                  : SelectedOptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index]),
            );
          }),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 30),
        //   child: RoundButton(text: 'Next Question',
        //       textColor: Colors.white,
        //       backgroundColor: MyCustomColor().mSecondaryColor().withOpacity(0.6),
        //       borderColor: MyCustomColor().mSecondaryColor(), borderWidth: 3,
        //       height: 60, width: appWidth, radius: 100,
        //       onClick: (){
        //           Navigator.pushReplacement(context,
        //               MaterialPageRoute(builder: (context)=> ));
        //       }),
        // )
      ],
    );
  }
}

class QuizOptions02 extends StatefulWidget {
  const QuizOptions02({super.key});

  @override
  State<QuizOptions02> createState() => _QuizOptions02State();
}

class _QuizOptions02State extends State<QuizOptions02> {
  bool selectedOption = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [

        /// ===== Question ====
        Padding(
          padding: const EdgeInsets.only(left: 30,top: 40,bottom: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextStyleHelper().mytext('What is the meaning of UI UX Design?',
                16,FontWeight.w600,textColor),
          ),
        ),

        Wrap(
          children: List.generate(5, (index) {
            return InkWell(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                  selectedIndex == index? selectedOption = true : selectedOption = false;
                });
              },
              child: selectedIndex != index? OptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index])
                  : SelectedOptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index]),
            );
          }),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 30),
        //   child: RoundButton(text: 'Next Question',
        //       textColor: Colors.white,
        //       backgroundColor: MyCustomColor().mSecondaryColor().withOpacity(0.6),
        //       borderColor: MyCustomColor().mSecondaryColor(), borderWidth: 3,
        //       height: 60, width: appWidth, radius: 100,
        //       onClick: (){
        //           Navigator.pushReplacement(context,
        //               MaterialPageRoute(builder: (context)=> ));
        //       }),
        // )
      ],
    );
  }
}

class QuizOptions03 extends StatefulWidget {
  const QuizOptions03({super.key});

  @override
  State<QuizOptions03> createState() => _QuizOptions03State();
}

class _QuizOptions03State extends State<QuizOptions03> {
  bool selectedOption = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [

        /// ===== Question ====
        Padding(
          padding: const EdgeInsets.only(left: 30,top: 40,bottom: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextStyleHelper().mytext('What is the meaning of UI UX Design?',
                16,FontWeight.w600,textColor),
          ),
        ),

        Wrap(
          children: List.generate(5, (index) {
            return InkWell(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                  selectedIndex == index? selectedOption = true : selectedOption = false;
                });
              },
              child: selectedIndex != index? OptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index])
                  : SelectedOptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index]),
            );
          }),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 30),
        //   child: RoundButton(text: 'Next Question',
        //       textColor: Colors.white,
        //       backgroundColor: MyCustomColor().mSecondaryColor().withOpacity(0.6),
        //       borderColor: MyCustomColor().mSecondaryColor(), borderWidth: 3,
        //       height: 60, width: appWidth, radius: 100,
        //       onClick: (){
        //           Navigator.pushReplacement(context,
        //               MaterialPageRoute(builder: (context)=> ));
        //       }),
        // )
      ],
    );
  }
}

class QuizOptions04 extends StatefulWidget {
  const QuizOptions04({super.key});

  @override
  State<QuizOptions04> createState() => _QuizOptions04State();
}

class _QuizOptions04State extends State<QuizOptions04> {
  bool selectedOption = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [

        /// ===== Question ====
        Padding(
          padding: const EdgeInsets.only(left: 30,top: 40,bottom: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextStyleHelper().mytext('What is the meaning of UI UX Design?',
                16,FontWeight.w600,textColor),
          ),
        ),

        Wrap(
          children: List.generate(5, (index) {
            return InkWell(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                  selectedIndex == index? selectedOption = true : selectedOption = false;
                });
              },
              child: selectedIndex != index? OptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index])
                  : SelectedOptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index]),
            );
          }),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 30),
        //   child: RoundButton(text: 'Next Question',
        //       textColor: Colors.white,
        //       backgroundColor: MyCustomColor().mSecondaryColor().withOpacity(0.6),
        //       borderColor: MyCustomColor().mSecondaryColor(), borderWidth: 3,
        //       height: 60, width: appWidth, radius: 100,
        //       onClick: (){
        //           Navigator.pushReplacement(context,
        //               MaterialPageRoute(builder: (context)=> ));
        //       }),
        // )
      ],
    );
  }
}

class QuizOptions05 extends StatefulWidget {
  const QuizOptions05({super.key});

  @override
  State<QuizOptions05> createState() => _QuizOptions05State();
}

class _QuizOptions05State extends State<QuizOptions05> {
  bool selectedOption = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [

        /// ===== Question ====
        Padding(
          padding: const EdgeInsets.only(left: 30,top: 40,bottom: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextStyleHelper().mytext('What is the meaning of UI UX Design?',
                16,FontWeight.w600,textColor),
          ),
        ),

        Wrap(
          children: List.generate(5, (index) {
            return InkWell(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                  selectedIndex == index? selectedOption = true : selectedOption = false;
                });
              },
              child: selectedIndex != index? OptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index])
                  : SelectedOptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index]),
            );
          }),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 30),
        //   child: RoundButton(text: 'Next Question',
        //       textColor: Colors.white,
        //       backgroundColor: MyCustomColor().mSecondaryColor().withOpacity(0.6),
        //       borderColor: MyCustomColor().mSecondaryColor(), borderWidth: 3,
        //       height: 60, width: appWidth, radius: 100,
        //       onClick: (){
        //           Navigator.pushReplacement(context,
        //               MaterialPageRoute(builder: (context)=> ));
        //       }),
        // )
      ],
    );
  }
}

class QuizOptions06 extends StatefulWidget {
  const QuizOptions06({super.key});

  @override
  State<QuizOptions06> createState() => _QuizOptions06State();
}

class _QuizOptions06State extends State<QuizOptions06> {
  bool selectedOption = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [

        /// ===== Question ====
        Padding(
          padding: const EdgeInsets.only(left: 30,top: 40,bottom: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextStyleHelper().mytext('What is the meaning of UI UX Design?',
                16,FontWeight.w600,textColor),
          ),
        ),

        Wrap(
          children: List.generate(5, (index) {
            return InkWell(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                  selectedIndex == index? selectedOption = true : selectedOption = false;
                });
              },
              child: selectedIndex != index? OptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index])
                  : SelectedOptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index]),
            );
          }),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 30),
        //   child: RoundButton(text: 'Next Question',
        //       textColor: Colors.white,
        //       backgroundColor: MyCustomColor().mSecondaryColor().withOpacity(0.6),
        //       borderColor: MyCustomColor().mSecondaryColor(), borderWidth: 3,
        //       height: 60, width: appWidth, radius: 100,
        //       onClick: (){
        //           Navigator.pushReplacement(context,
        //               MaterialPageRoute(builder: (context)=> ));
        //       }),
        // )
      ],
    );
  }
}

class QuizOptions07 extends StatefulWidget {
  const QuizOptions07({super.key});

  @override
  State<QuizOptions07> createState() => _QuizOptions07State();
}

class _QuizOptions07State extends State<QuizOptions07> {
  bool selectedOption = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [

        /// ===== Question ====
        Padding(
          padding: const EdgeInsets.only(left: 30,top: 40,bottom: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextStyleHelper().mytext('What is the meaning of UI UX Design?',
                16,FontWeight.w600,textColor),
          ),
        ),

        Wrap(
          children: List.generate(5, (index) {
            return InkWell(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                  selectedIndex == index? selectedOption = true : selectedOption = false;
                });
              },
              child: selectedIndex != index? OptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index])
                  : SelectedOptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index]),
            );
          }),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 30),
        //   child: RoundButton(text: 'Next Question',
        //       textColor: Colors.white,
        //       backgroundColor: MyCustomColor().mSecondaryColor().withOpacity(0.6),
        //       borderColor: MyCustomColor().mSecondaryColor(), borderWidth: 3,
        //       height: 60, width: appWidth, radius: 100,
        //       onClick: (){
        //           Navigator.pushReplacement(context,
        //               MaterialPageRoute(builder: (context)=> ));
        //       }),
        // )
      ],
    );
  }
}

class QuizOptions08 extends StatefulWidget {
  const QuizOptions08({super.key});

  @override
  State<QuizOptions08> createState() => _QuizOptions08State();
}

class _QuizOptions08State extends State<QuizOptions08> {
  bool selectedOption = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [

        /// ===== Question ====
        Padding(
          padding: const EdgeInsets.only(left: 30,top: 40,bottom: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextStyleHelper().mytext('What is the meaning of UI UX Design?',
                16,FontWeight.w600,textColor),
          ),
        ),

        Wrap(
          children: List.generate(5, (index) {
            return InkWell(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                  selectedIndex == index? selectedOption = true : selectedOption = false;
                });
              },
              child: selectedIndex != index? OptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index])
                  : SelectedOptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index]),
            );
          }),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 30),
        //   child: RoundButton(text: 'Next Question',
        //       textColor: Colors.white,
        //       backgroundColor: MyCustomColor().mSecondaryColor().withOpacity(0.6),
        //       borderColor: MyCustomColor().mSecondaryColor(), borderWidth: 3,
        //       height: 60, width: appWidth, radius: 100,
        //       onClick: (){
        //           Navigator.pushReplacement(context,
        //               MaterialPageRoute(builder: (context)=> ));
        //       }),
        // )
      ],
    );
  }
}

class QuizOptions09 extends StatefulWidget {
  const QuizOptions09({super.key});

  @override
  State<QuizOptions09> createState() => _QuizOptions09State();
}

class _QuizOptions09State extends State<QuizOptions09> {
  bool selectedOption = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [

        /// ===== Question ====
        Padding(
          padding: const EdgeInsets.only(left: 30,top: 40,bottom: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextStyleHelper().mytext('What is the meaning of UI UX Design?',
                16,FontWeight.w600,textColor),
          ),
        ),

        Wrap(
          children: List.generate(5, (index) {
            return InkWell(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                  selectedIndex == index? selectedOption = true : selectedOption = false;
                });
              },
              child: selectedIndex != index? OptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index])
                  : SelectedOptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index]),
            );
          }),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 30),
        //   child: RoundButton(text: 'Next Question',
        //       textColor: Colors.white,
        //       backgroundColor: MyCustomColor().mSecondaryColor().withOpacity(0.6),
        //       borderColor: MyCustomColor().mSecondaryColor(), borderWidth: 3,
        //       height: 60, width: appWidth, radius: 100,
        //       onClick: (){
        //           Navigator.pushReplacement(context,
        //               MaterialPageRoute(builder: (context)=> ));
        //       }),
        // )
      ],
    );
  }
}

class QuizOptions10 extends StatefulWidget {
  const QuizOptions10({super.key});

  @override
  State<QuizOptions10> createState() => _QuizOptions10State();
}

class _QuizOptions10State extends State<QuizOptions10> {
  bool selectedOption = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [

        /// ===== Question ====
        Padding(
          padding: const EdgeInsets.only(left: 30,top: 40,bottom: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextStyleHelper().mytext('What is the meaning of UI UX Design?',
                16,FontWeight.w600,textColor),
          ),
        ),

        Wrap(
          children: List.generate(5, (index) {
            return InkWell(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                  selectedIndex == index? selectedOption = true : selectedOption = false;
                });
              },
              child: selectedIndex != index? OptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index])
                  : SelectedOptionBox(optionNo: optionsNumber[index], answer: quizAnswers[index]),
            );
          }),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 30),
          child: RoundButton(text: 'See Result',
              textColor: Colors.white,
              backgroundColor: MyCustomColor().mSecondaryColor().withOpacity(0.6),
              borderColor: MyCustomColor().mSecondaryColor(), borderWidth: 3,
              height: 60, width: appWidth, radius: 100,
              onClick: (){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context)=> const PostpartumWellnessResult()));
              }),
        )
      ],
    );
  }
}
