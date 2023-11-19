import 'package:doctor_app/models/doctor.dart';
import 'package:doctor_app/views/screens/doctors_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class DoctorList extends StatelessWidget {
  final List speciality;
  final int index;
  const DoctorList({
    super.key,
    required this.speciality,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final spec = speciality[index]["name"].toString();
    List<Doctor> filteredDoctors =
        doctors.where((doc) => doc.spec == spec).toList();

    // final items = List<String>.generate(10, (index) => "Item ${index + 1}");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(IconlyBold.arrowLeftSquare),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Text(
                  speciality[index]["name"].toString().toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // const Text("Swip to right to book an appointment"),
                Expanded(
                  child: SizedBox(
                    //height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      // itemCount: items.length,
                      itemCount: filteredDoctors.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => DoctorsDetails(
                                selectedDoctor: filteredDoctors[index],
                                heroTag:
                                    'doctorHeroTag${filteredDoctors[index].name}$index',
                              ),
                            );
                            // Navigator.push(
                            //   context,
                            //   PageTransition(
                            //     child: const DoctorsDetails(),
                            //     //childCurrent: this,
                            //     type: PageTransitionType.fade,
                            //     // curve: Curves.easeIn,
                            //     // duration: Duration(milliseconds: 1000),
                            //   ),
                            // );
                          },
                          child: Card(
                            child: ListTile(
                              leading: Hero(
                                  tag:
                                      'doctorHeroTag${filteredDoctors[index].name}$index',
                                  child:
                                      Image.asset(filteredDoctors[index].img)),
                              title: Text(filteredDoctors[index].name),
                              subtitle: Text(filteredDoctors[index].spec),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
