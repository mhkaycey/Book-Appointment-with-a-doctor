import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:doctor_app/constant/konst.dart';
import 'package:doctor_app/controllers/appoint_ctlr.dart';
import 'package:doctor_app/models/appoint.dart';
import 'package:doctor_app/services/notification.dart';
import 'package:doctor_app/views/widgets/appointmentTiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final appCtlr = Get.put(AppointmentController());
  final DatePickerController _controller = DatePickerController();

  late DateTime selectedValue = DateTime.now();
  TimeOfDay timeSelected = TimeOfDay.now();
  var notifyHelper;

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: timeSelected,
    );
    if (selected != null) {
      setState(() {
        timeSelected = selected;
      });
    }
  }

  @override
  void initState() {
    appCtlr.getAppointments();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // const TopBar(),

            dateBooking(context),
            topDate(),

            const SizedBox(height: 5),
            _showAppointment(),
          ],
        ),
      ),
    );
  }

  topDate() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
      ),
      child: DatePicker(
        DateTime.now(),
        height: 90,
        // width: 100,
        controller: _controller,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.green.shade200,
        selectedTextColor: Colors.black,
        // inactiveDates: [
        //   DateTime.now().add(const Duration(days: 3)),
        //   DateTime.now().add(const Duration(days: 4)),
        //   DateTime.now().add(const Duration(days: 7))
        // ],
        onDateChange: (date) {
          // New date selected
          setState(() {
            selectedValue = date;
          });
        },
      ),
    );
  }

  dateBooking(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today",
                style: textStyle,
              ),
              Text(
                DateFormat("d MMMM, yyyy").format(DateTime.now()),
                style: subtitleStyle,
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const AppointmentPage(),
                  childCurrent: widget,
                  type: PageTransitionType.topToBottomJoined,
                ),
              );
            },
            icon: const Icon(IconlyBroken.plus),
            label: Text(
              "Book",
              style: textStyleSmall,
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.green.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showAppointment() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: appCtlr.appointmentList.length,
          itemBuilder: (_, index) {
            BookAppointment appointmentList = appCtlr.appointmentList[index];

            return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                child: FadeInAnimation(
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            _showBottomBar(context, appointmentList);
                            //print("Tapped $index");
                          },
                          child: AppointmentTile(appointmentList)),
                    ],
                  ),
                ),
              ),
            );
            // } else {
            //   return Container();
            // }
          },
        );
      }),
    );
  }

  void _showBottomBar(BuildContext context, BookAppointment bookAppointment) {
    Get.bottomSheet(
      Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 4,
        ),
        height: bookAppointment.isCompleted == 1
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.32,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
            ),
            const Spacer(),
            bookAppointment.isCompleted == 1
                ? Container()
                : _bottomSheetBotton(
                    label: "Completed",
                    onTap: () {
                      appCtlr.markDone(bookAppointment.id!);

                      Get.back();
                    },
                    clr: primaryClr,
                    context: context),
            const SizedBox(height: 0),
            // Cancel Option
            _bottomSheetBotton(
                label: "Cancel and Delete",
                onTap: () {
                  appCtlr.delete(bookAppointment);
                  appCtlr.getAppointments();
                  Get.back();
                },
                clr: Colors.red.shade600,
                context: context),
            const SizedBox(
              height: 30,
            ),
            _bottomSheetBotton(
                label: "Close",
                onTap: () {
                  Get.back();
                },
                clr: Colors.white,
                isClosed: true,
                context: context),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }

  _bottomSheetBotton({
    required String label,
    required Function() onTap,
    required Color clr,
    bool isClosed = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        height: MediaQuery.of(context).size.width * 0.45,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: isClosed == true ? Colors.transparent : clr,
          border: Border.all(
            width: 2,
            color: isClosed == true ? Colors.black12 : clr,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: isClosed
                ? titleStyle
                : titleStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
