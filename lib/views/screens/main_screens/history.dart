import 'package:doctor_app/controllers/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final app = Get.put(HistoryController());
  @override
  void initState() {
    // app.getAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Expanded(
            //   child: Obx(
            //     () => ListView.builder(
            //       shrinkWrap: true,
            //       itemCount: app.appointmentList.length,
            //       itemBuilder: (context, index) {
            //         var appointX = app.appointmentList[index];
            //         print(app.appointmentList.length);
            //         return Container(
            //           width: 100,
            //           height: 70,
            //           color: Colors.amber,
            //           margin: const EdgeInsets.only(bottom: 5),
            //           child: Column(
            //             children: [
            //               Text(appointX.id.toString()),
            //               Text(appointX.startTime.toString()),
            //               Text(appointX.endTime.toString()),
            //             ],
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
