import 'package:doctor_app/db/db_helper.dart';
import 'package:doctor_app/models/appoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  var appointments = <BookAppointment>[].obs;
  List<BookAppointment> get appointmentList => appointments;

  @override
  void onInit() {
    super.onInit();
    getCompletedAppointment();
  }

  Future<void> getCompletedAppointment() async {
    final List<Map<String, dynamic>> appointmentData =
        await DBHelper.queryCompleted();
    appointmentList.assignAll(
      appointmentData.map((data) => BookAppointment.fromJson(data)).toList(),
    );
    debugPrint("-----$appointmentData----");
  }
}
