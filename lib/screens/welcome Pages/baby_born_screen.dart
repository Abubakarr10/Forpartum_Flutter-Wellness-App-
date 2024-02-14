import 'package:flutter/material.dart';
import 'package:forpartum/screens/welcome%20Pages/welcome_2.dart';
import 'package:intl/intl.dart'; // Import for date formatting
import '../../helper/mycustombutton.dart';
import '../../helper/mycustomcolor.dart';
import '../../helper/textStyleHelper.dart';


class BabyBornScreen extends StatefulWidget {
  const BabyBornScreen(
      {Key? key,
        required this.selectedOption1,
        required this.selectedOption05,
        required this.selectedAge})
      : super(key: key);

  final String selectedOption1;
  final String selectedOption05;
  final int selectedAge;

  @override
  State<BabyBornScreen> createState() => _BabyBornScreenState();
}

class _BabyBornScreenState extends State<BabyBornScreen> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  double currentValue = 0;
  double pageNoValue = 0.40;

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
  Future<void> _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    final ThemeData lightTheme = ThemeData.light();
    final ThemeData darkTheme = ThemeData.dark();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: theme.brightness == Brightness.light ? lightTheme : darkTheme,
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('MM-dd-yyyy').format(pickedDate);
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    var appWidth = MediaQuery.of(context).size.width;
    var appHeight = MediaQuery.of(context).size.height;
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            
            child: Stack(
              children: [

                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 30),
                  alignment: AlignmentDirectional.center,
                  child: Image.asset('assets/images/logo_transparent.png'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Slider(
                activeColor: MyCustomColor().mSecondaryColor(),
                inactiveColor: Colors.grey.shade300,
                thumbColor: MyCustomColor().mMainColor(),
                value: pageNoValue,
                divisions: 7,
                onChanged: (pageNoValue){
                  //currentValue = pageNoValue+0.5;
                }),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child:  TextStyleHelper().mytext('When was your baby born', 24, FontWeight.bold, textColor)

          ),
           const SizedBox(
            height: 20,
          ),
          TextStyleHelper().mytext('We use this information to customize', 14,
              FontWeight.w400, textColor),
          TextStyleHelper().mytext('your app experience', 14, FontWeight.w400, textColor),
          const SizedBox(height: 100,),
          // Text input field with calendar picker
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      hintText: 'MM-DD-YYYY',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_month_outlined),
                        color: textColor,
                        onPressed: () => _selectDate(context),
                      ),
                    ),
                    readOnly: true, // Make the field non-editable
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 150,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
              width: MediaQuery.of(context).size.width,
              child: RoundButton(
                textColor: Colors.white,
                backgroundColor: MyCustomColor().mMainColor(),
                borderColor: MyCustomColor().mMainColor(),
                text: "Next",
                shadowColor: Colors.black,
                onClick: () {
                  if (_dateController.text.isNotEmpty && widget.selectedOption05!='None of the above') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen2(
                          selectedOption1: widget.selectedOption1,
                          selectedOption05: widget.selectedOption05,
                          selectedAge: widget.selectedAge,
                          babyborndate: _dateController.text, // Pass the date from the controller
                        ),
                      ),
                    );
                    print("Next button clicked");
                    // Add any logic you need when the "Next" button is clicked
                  }
                  else if(widget.selectedOption05=='None of the above'){

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen2(
                          selectedOption1: widget.selectedOption1,
                          selectedOption05: widget.selectedOption05,
                          selectedAge: widget.selectedAge,
                          babyborndate: 'null' // Pass the date from the controller
                        ),
                      ),
                    );

                  }
                  else {
                    print('Please select a date.');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Select a Date'),
                          content: const Text('Please select a date.'),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK',style: TextStyle(color: textColor),),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                height: 50,
                width: MediaQuery.of(context).size.width,
                radius: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


