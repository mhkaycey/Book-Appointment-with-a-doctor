import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:profile_photo/profile_photo.dart';

import '../doctor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> speciality = [
      {"name": "Dentist"},
      {"name": "Dietician"},
      {"name": "Pediatrics"},
      {"name": "Oncology"},
      {"name": "Neurology"},
      {"name": "cardiology"},
      {"name": "demertalogist"},
      {"name": "Radiology"},
      {"name": "General Surgery"}
    ];
    String dateTime =
        DateFormat("E, d MMM, yyyy - h:mm a").format(DateTime.now());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ProfilePhoto(
                      totalWidth: 40,
                      cornerRadius: 50,
                      color: Colors.white,
                      image: const AssetImage("assets/images/doctor.png"),
                    ),
                    const Spacer(),
                    const Icon(
                      CupertinoIcons.bell,
                      size: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome,",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                          fontFamily: ''),
                    ),
                    Text(
                      "Mark Henry",
                      style: GoogleFonts.acme(fontSize: 30),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 70,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Search for a doctor or health issues',
                            suffixIcon: Icon(
                              CupertinoIcons.search,
                              color: Colors.black,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 250, 250, 250),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Upcoming Appointment",
                            style: GoogleFonts.acme(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 34, 32, 26)),
                          ),
                          const Spacer(),
                          Text(
                            "See all",
                            style: GoogleFonts.acme(
                              fontSize: 18,
                              color: const Color.fromARGB(255, 125, 203, 156),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 10.0),
                        child: SizedBox(
                          height: 170,
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            color: Colors.green[200],
                            elevation: 24,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: ListTile(
                                          leading: ProfilePhoto(
                                            totalWidth: 50,
                                            cornerRadius: 10,
                                            color: const Color.fromARGB(
                                              255,
                                              250,
                                              246,
                                              249,
                                            ),
                                            image: const AssetImage(
                                              "assets/images/doctor.png",
                                            ),
                                          ),
                                          title: Text(
                                            "Dr. Mark Henry",
                                            style: GoogleFonts.acme(
                                              fontSize: 20,
                                              // color: Colors.black,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "Destist",
                                            style: GoogleFonts.abel(
                                                fontSize: 18,
                                                //  color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          trailing: const Icon(
                                              FontAwesomeIcons.video),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 15,
                                        sigmaY: 15,
                                      ),
                                      child: Container(
                                        width: double.maxFinite,
                                        height: 70,
                                        decoration: const BoxDecoration(
                                          color: Colors.black12,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const Icon(
                                                CupertinoIcons.clock_solid,
                                              ),
                                              Text(
                                                dateTime,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Text(
                              "Which Doctor do you want to see?",
                              style: GoogleFonts.acme(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                          childAspectRatio: 0.9,
                        ),
                        itemCount: speciality.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                () => DoctorList(
                                  speciality: speciality,
                                  index: index,
                                ),
                                transition: Transition.zoom,
                                duration: const Duration(
                                  milliseconds: 600,
                                ),
                              );
                              // Navigator.push(
                              //   context,
                              //   PageTransition(
                              //     child: DoctorList(
                              //       speciality: speciality,
                              //       index: index,
                              //     ),
                              //     type: PageTransitionType.fade,
                              //     duration: const Duration(milliseconds: 1000),
                              //   ),
                              // );
                            },
                            child: Card(
                              elevation: 1,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child:
                                        Image.asset("assets/images/doctor.png"),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      speciality[index]['name'].toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.green,
                                        backgroundColor:
                                            Colors.greenAccent.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
