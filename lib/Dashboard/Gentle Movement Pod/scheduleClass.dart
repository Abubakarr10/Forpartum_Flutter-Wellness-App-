import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:forpartum/Dashboard/My%20Pofile%20Pages/app_settings.dart';
import 'package:forpartum/helper/mycustombutton.dart';
import 'package:forpartum/helper/mycustomcolor.dart';
import 'package:forpartum/helper/textStyleHelper.dart';
import '../My Pofile Pages/Notifications/notifications_screen.dart';

class ScheduleClasses extends StatefulWidget {
  const ScheduleClasses({super.key});

  @override
  State<ScheduleClasses> createState() => _ScheduleClassesState();
}

class _ScheduleClassesState extends State<ScheduleClasses> {

  DateTime  selectedDate = DateTime.now();
  bool bottomDialog = false;
  bool turnOnOff = false;

  List<String> timeSlots = [
    '12:00 AM','', '1:00 AM','', '2:00 AM','', '3:00 AM','', '4:00 AM','', '5:00 AM','',
    '6:00 AM','', '7:00 AM','', '8:00 AM','', '9:00 AM','', '10:00 AM','', '11:00 AM','',
    '12:00 PM','', '1:00 PM','', '2:00 PM','', '3:00 PM','', '4:00 PM','', '5:00 PM','',
    '6:00 PM','', '7:00 PM','', '8:00 PM','', '9:00 PM','', '10:00 PM','', '11:00 PM','',
  ];

  List<String> addedSchedules = [
    '','', '','', 'Upperbody Workout, 2am','', '','', '','', '','',
    '','Ab Workout, 6:30am', '','', '','', '','', '','', '','',
    '','', '','', '','', '','', '','', '','',
    '','', '','', '','', '','', '','', '','',
  ];

  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.secondary;
    Color boxColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.background;
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButtonLocation: bottomDialog != true?
      FloatingActionButtonLocation.endFloat : FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: bottomDialog == true? Container(
        height: 230, width: appWidth,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 60,left: 30,right: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleHelper().mytext('Set a Reminder', 18, FontWeight.w500, textColor),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: TextStyleHelper().mytext('You will be notified 15 min before session',
                            14, FontWeight.w500, Colors.grey),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        turnOnOff = !turnOnOff;
                      });
                    },
                    child: SizedBox(
                      child: turnOnOff == true? const OnButton() :
                      const OffedButton(),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: RoundButton(
                    text: 'Done',
                    textColor: Colors.white,
                    backgroundColor: MyCustomColor().mMainColor(),
                    borderColor: MyCustomColor().mMainColor(),
                    height: 60, width: appWidth, radius: 99,
                    onClick: (){}),
              )
            ],
          ),
        ),
      )
          : const Text(''),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10,bottom: 20),
        child: FloatingActionButton(
          backgroundColor: MyCustomColor().mSecondaryColor(),
            child: const Icon(Icons.alarm_add,
            color: Colors.white,
            ),
            onPressed: (){
            setState(() {
              bottomDialog = !bottomDialog;
            });
              print("Bottom :$bottomDialog");
            }
        ),
      ),
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
                      'Schedule A Class',
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationScreen()));
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(top: 35, left: 20, right: 20),
                      child: Image.asset('assets/icons/notification.png',)),
                ),
              ],
            ),

            /// ===== Calender =====
            Container(
              color: boxColor,
              margin: const EdgeInsets.only(top: 40),
              child: DatePicker(
                DateTime.now(),
                height: 100, width: 60,
                initialSelectedDate: DateTime.now(),
                selectionColor: MyCustomColor().mMainColor(),
                selectedTextColor: Colors.white,
                dateTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,fontSize: 16, fontFamily: 'Poppins',
                  color: textColor
                ),
                dayTextStyle: TextStyle(
                    fontWeight: FontWeight.w400,fontSize: 12, fontFamily: 'Poppins',
                  color: textColor
                ),
                monthTextStyle: TextStyle(
                    fontWeight: FontWeight.w400,fontSize: 12, fontFamily: 'Poppins'
                    ,color: textColor
                ),
                onDateChange: (date){
                  selectedDate=date;
                },
              ),
            ),

            /// ==== Time Slots =====
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 20,bottom: 20),
              child: Wrap(
                children: List.generate(timeSlots.length, (index) {
                  final timeSlot = timeSlots[index];
                   if(index.isEven){
                    if(addedSchedules[index]==''){
                      return GestureDetector(
                        onTap: (){
                          print('clicked hora hai Odd');
                          showDialog(
                              context: context,
                              builder: (context)=>AlertDialog(
                                title: Center(
                                  child: TextStyleHelper().mytext('Add your Task',
                                      18, FontWeight.w600, textColor),
                                ),
                                content: SizedBox(
                                  height: 110,
                                  width: appWidth,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      TextStyleHelper().mInputFields(
                                          taskController,
                                          TextInputType.text, '',
                                          'Task', textColor, 'Task',
                                          'assets/icons/plus_orange.png',
                                          appWidth,
                                          60, 20, 20, 10)
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                          MyCustomColor().mMainColor(),
                                        ),
                                        child: TextStyleHelper().mytext(
                                            'Add',
                                            16,
                                            FontWeight.w600,
                                            Colors.white),
                                        onPressed: () {
                                          addedSchedules.insert(index, taskController.toString());
                                          print(addedSchedules[index].toString());
                                          print('clicked');
                                        }
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                          MyCustomColor().mSecondaryColor().withOpacity(0.9),
                                        ),
                                        child: TextStyleHelper().mytext(
                                            'Cancel',
                                            16,
                                            FontWeight.w500,
                                            Colors.white),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }
                                    ),
                                  )
                                ],
                              ));
                        },
                        child: ListTile(
                          leading: Container(
                              width: 60,
                              margin: const EdgeInsets.only(right: 40),
                              alignment: Alignment.center,
                              child: TextStyleHelper().mytext(timeSlot, 14, FontWeight.w400, textColor)),
                        ),
                      );
                    }else{
                      return ListTile(
                        leading: Container(
                            width: 60,
                            margin: const EdgeInsets.only(right: 40),
                            alignment: Alignment.center,
                            child: TextStyleHelper().mytext(timeSlot, 14, FontWeight.w400, textColor)),
                        title: Container(
                            height: 35, width: 150,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 30),
                            decoration: BoxDecoration(
                                color:  MyCustomColor().mMainColor(),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child:
                            Text(addedSchedules[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white,
                              ),)
                        ),
                      );
                    }
                  }else{
                     if(addedSchedules[index]==''){
                       return GestureDetector(
                         onTap:
                               (){
                             print('clicked hora Even wala hai');
                             showDialog(
                                 context: context,
                                 builder: (context)=>AlertDialog(
                                   title: Center(
                                     child: TextStyleHelper().mytext('Add your Task',
                                         18, FontWeight.w600, textColor),
                                   ),
                                   content: SizedBox(
                                     height: 110,
                                     width: appWidth,
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         TextStyleHelper().mInputFields(
                                             taskController,
                                             TextInputType.text, '',
                                             'Task', textColor, 'Task',
                                             'assets/icons/plus_orange.png',
                                             appWidth,
                                             60, 20, 20, 10)
                                       ],
                                     ),
                                   ),
                                   actions: <Widget>[
                                     Padding(
                                       padding: const EdgeInsets.only(right: 10),
                                       child: ElevatedButton(
                                           style: ElevatedButton.styleFrom(
                                             backgroundColor:
                                             MyCustomColor().mMainColor(),
                                           ),
                                           child: TextStyleHelper().mytext(
                                               'Add',
                                               16,
                                               FontWeight.w600,
                                               Colors.white),
                                           onPressed: () {
                                             addedSchedules.insert(index, taskController.toString());
                                             print(addedSchedules[index].toString());
                                             print('clicked');
                                           }
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(right: 10),
                                       child: ElevatedButton(
                                           style: ElevatedButton.styleFrom(
                                             backgroundColor:
                                             MyCustomColor().mSecondaryColor().withOpacity(0.9),
                                           ),
                                           child: TextStyleHelper().mytext(
                                               'Cancel',
                                               16,
                                               FontWeight.w500,
                                               Colors.white),
                                           onPressed: () {
                                             Navigator.pop(context);
                                           }
                                       ),
                                     )
                                   ],
                                 ));
                           },
                         child: ListTile(
                           leading: Container(
                               width: 60,
                               margin: const EdgeInsets.only(right: 40),
                               alignment: Alignment.center,
                               child: TextStyleHelper().mytext(timeSlot, 14, FontWeight.w400, textColor)),
                         ),
                       );
                     }else{
                       return ListTile(
                         leading: Container(
                             width: 60,
                             margin: const EdgeInsets.only(right: 40),
                             alignment: Alignment.center,
                             child: TextStyleHelper().mytext(timeSlot, 14, FontWeight.w400, textColor)),
                         title:  Container(
                             height: 35, width: 150,
                             alignment: Alignment.center,
                             margin: const EdgeInsets.only(right: 30),
                             decoration: BoxDecoration(
                                 color:  MyCustomColor().mSecondaryColor(),
                                 borderRadius: BorderRadius.circular(30)
                             ),
                             child:
                             Text(addedSchedules[index],
                               textAlign: TextAlign.center,
                               style: const TextStyle(
                                 fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white,
                               ),)
                         ),
                       );
                     }
                   }
                })
              ),
            )
          ],
        ),
      ),
    );
  }
}
