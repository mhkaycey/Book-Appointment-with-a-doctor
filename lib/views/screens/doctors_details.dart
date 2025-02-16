// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor_app/constant/konst.dart';
import 'package:doctor_app/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:doctor_app/views/screens/main_screens/book_appointment.dart';

import '../widgets/top_bar.dart';

class DoctorsDetails extends StatelessWidget {
  final Doctor selectedDoctor;
  final String heroTag;

  const DoctorsDetails({
    super.key,
    required this.selectedDoctor,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 220,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  elevation: 8,
                                  child: ClipPath(
                                    child: Hero(
                                      tag: heroTag,
                                      child: Image.asset(
                                        selectedDoctor.img,
                                        fit: BoxFit.cover,
                                        height: 229,
                                        width: 150,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          selectedDoctor.name,
                                          // "Dr. Wellbeing",
                                          style: GoogleFonts.acme(fontSize: 20),
                                        ),
                                        subtitle: Text(selectedDoctor.spec),
                                      ),
                                      ListTile(
                                        leading: const Card(
                                          elevation: 0,
                                          child: Icon(
                                            IconlyBold.star,
                                            color: Colors.amber,
                                            size: 40,
                                          ),
                                        ),
                                        title: Text(
                                          "Rating",
                                          style: GoogleFonts.acme(fontSize: 20),
                                        ),
                                        subtitle: const Text("4.3 out of 5"),
                                      ),
                                      ListTile(
                                        leading: const Card(
                                          elevation: 0,
                                          child: Icon(
                                            IconlyBold.user3,
                                            size: 40,
                                            color: Colors.green,
                                          ),
                                          // child: Image.asset("assets/images/doctor.png"),
                                        ),
                                        title: Text(
                                          "Patients",
                                          style: GoogleFonts.acme(fontSize: 20),
                                        ),
                                        subtitle: const Text("1000+"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  "Biography",
                                  style: GoogleFonts.acme(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text:
                                      "Dr. Wellbeing is a Nigerian born doctor school and trained in Ukraine, having worked in the said country he came back to Nigeria to help booste the health sector... ",
                                  style: textStyleSmall.copyWith(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                  // TextStyle(
                                  //   fontSize: 16,
                                  //   color: Colors.black,
                                  // ),
                                  children: const [
                                    TextSpan(
                                      text: "Read more",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Reviews..",
                                      style: GoogleFonts.acme(fontSize: 20),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "See all",
                                      style: GoogleFonts.acme(
                                          fontSize: 20,
                                          color: Colors.greenAccent),
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      leading: Image.asset(
                                        "assets/images/doctor.png",
                                      ),
                                      title: const Text("Mrs. Adebayo"),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.to(() => const BookAppointments());
            // Navigator.push(
            //     context,
            //     PageTransition(
            //         child: const BookAppointments(),
            //         childCurrent: widget,
            //         type: PageTransitionType.topToBottomJoined));
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 70,
              width: size.width * 0.5,
              //width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 107, 198, 110),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Book Appointment",
                    style: GoogleFonts.acme(fontSize: 25),
                  ),
                  //  Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
