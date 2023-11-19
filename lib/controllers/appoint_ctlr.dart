import 'package:doctor_app/db/db_helper.dart';
import 'package:doctor_app/models/appoint.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  // final _dbHelper = DBHelper();
  var appointmentListX = <BookAppointment>[].obs;
  List<BookAppointment> get appointmentList => appointmentListX;

  Future<int> bookAppointment({BookAppointment? bookAppointment}) async {
    return await DBHelper.insert(bookAppointment);
  }

  @override
  void onInit() {
    super.onInit();
    getAppointments();
  }

  Future<void> getAppointments() async {
    final List<Map<String, dynamic>> appointmentData = await DBHelper.query();
    appointmentList.assignAll(
      appointmentData.map((data) => BookAppointment.fromJson(data)).toList(),
    );
  }

  void delete(BookAppointment bookAppointment) {
    DBHelper.delete(bookAppointment);
  }

  void markDone(int id) async {
    await DBHelper.update(id);
    getAppointments();
  }
}
