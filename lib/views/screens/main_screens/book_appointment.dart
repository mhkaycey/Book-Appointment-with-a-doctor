import 'dart:developer';

import 'package:doctor_app/constant/konst.dart';
import 'package:doctor_app/controllers/appoint_ctlr.dart';
import 'package:doctor_app/models/appoint.dart';
import 'package:doctor_app/services/notification.dart';
import 'package:doctor_app/views/widgets/input_field.dart';
import 'package:doctor_app/views/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookAppointments extends StatefulWidget {
  const BookAppointments({super.key});

  @override
  State<BookAppointments> createState() => _BookAppointmentsState();
}

class _BookAppointmentsState extends State<BookAppointments> {
  final appointmentController = Get.put(AppointmentController());
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  // late TimeOfDay startTime = TimeOfDay.now();
  // late TimeOfDay endTime = TimeOfDay.now();
  String endTime = "9:30 PM";
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int selectedReminder = 5;
  List<int> remindList = [5, 10, 15, 20];
  var notifyHelper;

  int _selectedColor = 0;

  @override
  void initState() {
    super.initState();
    appointmentController.getAppointments();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const TopBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InputField(
                        title: 'Reason ',
                        hint: 'Enter reason',
                        controller: _titleController,
                      ),
                      InputField(
                        hint: 'Describle how you feel',
                        title: 'Note',
                        controller: _noteController,
                      ),
                      InputField(
                        hint: DateFormat.yMd().format(selectedDate),
                        title: 'Date',
                        widget: IconButton(
                          onPressed: () {
                            getDateFromUser();
                          },
                          icon: const Icon(
                            IconlyLight.calendar,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputField(
                              hint: startTime,
                              title: "Start Time",
                              widget: IconButton(
                                  onPressed: () {
                                    getTimeFromUser(isStartTime: true);
                                  },
                                  icon: const Icon(IconlyLight.timeCircle)),
                            ),
                          ),
                          Expanded(
                            child: InputField(
                              hint: endTime,
                              title: "End Time",
                              widget: IconButton(
                                  onPressed: () {
                                    getTimeFromUser(isStartTime: false);
                                  },
                                  icon: const Icon(IconlyLight.timeCircle)),
                            ),
                          ),
                        ],
                      ),
                      InputField(
                        hint: "$selectedReminder minuter early",
                        title: "Remind",
                        widget: DropdownButton(
                          items: remindList
                              .map<DropdownMenuItem<String>>((int value) {
                            return DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text(
                                value.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedReminder = int.parse(newValue!);
                            });
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ),
                          iconSize: 32,
                          elevation: 4,
                          style: subtitleStyle,
                          underline: Container(
                            height: 0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _colorPalette(),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () => _validate(),
                              icon: const Icon(IconlyBroken.plus),
                              label: const Text(
                                "Create",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validate() async {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      //add to datebase
      await addToDatabase();
      notifyHelper.displayNotification(
        title: "Book Appointment",
        body: "Appointment booked successfully",
      );

      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          width: 300,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Please fill the empty fields",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  _colorPalette() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: titleStyle,
        ),
        const SizedBox(height: 5),
        Wrap(
          children: List<Widget>.generate(
            3,
            (int index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0
                      ? primaryClr
                      : index == 1
                          ? pinkClr
                          : yellowClr,
                  child: _selectedColor == index
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 16,
                        )
                      : Container(),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void getDateFromUser() async {
    DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2024));
    if (datePicker != null) {
      setState(() {
        selectedDate = datePicker;
      });
    } else {
      log("Null");
    }
  }

  void getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay.now(),
      // initialTime: TimeOfDay(
      //   hour: int.parse(startTime.split(":")[0]),
      //   minute: int.parse(startTime.split(":")[1].split(" ")[0]),
      // ),
    );
    // ignore: use_build_context_synchronously
    String? formatedTime = pickedTime?.format(context);
    if (pickedTime == null) {
      //log("Cancelled");
    } else if (isStartTime == true) {
      //log(pickedTime.toString());
      setState(() {
        startTime = formatedTime!;
      });
    } else if (isStartTime == false) {
      setState(() {
        endTime = formatedTime!;
      });
    }
  }

  addToDatabase() async {
    int value = await appointmentController.bookAppointment(
      bookAppointment: BookAppointment(
        note: _noteController.text,
        title: _titleController.text,
        date: DateFormat.yMd().format(selectedDate),
        startTime: startTime,
        endTime: endTime,
        remind: selectedReminder,
        color: _selectedColor,
        isCompleted: 0,
      ),
    );

    //notifyHelper.displayNotification();
  }

  // _showTimePicker() {
  //   return showTimePicker(
  //     initialEntryMode: TimePickerEntryMode.input,
  //     context: context,
  //     initialTime: TimeOfDay(
  //       hour: int.parse(startTime.split(":")[0]),
  //       minute: int.parse(startTime.split(":")[1].split(" ")[0]),
  //     ),
  //   );
  // }
}
