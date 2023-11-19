import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';

import '../index.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    slides.add(
      Slide(
        title: "",
        description: "We are here to serve and help have a good life ",
        pathImage: "assets/images/doctor.png",
        backgroundColor: const Color(0xff9932CC),
      ),
    );
    slides.add(
      Slide(
          title: "Chat",
          description: "We are here to serve and help have a good life ",
          pathImage: "assets/images/doctors.jpg",
          backgroundColor: Colors.red),
    );
    slides.add(
      Slide(
        title: "Emergency",
        description:
            "We are here to serve and help have a good life, We are here to serve and help have a good life",
        pathImage: "assets/images/doctor.png",
        backgroundColor: const Color(0xff9932CC),
      ),
    );

    super.initState();
  }

  List<Widget> renderListCustomTab() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 10, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    currentSlide.title.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    currentSlide.pathImage.toString(),
                    matchTextDirection: true,
                    height: 300,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    currentSlide.description.toString(),
                    style: const TextStyle(fontSize: 18),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntroSlider(
          // slides: slides,
          backgroundColorAllSlides: Colors.green[700],
          // renderSkipBtn: const Text("Skip"),
          // renderNextBtn: const Text("Next"),
          // renderDoneBtn: const Text("Done"),
          // renderPrevBtn: const Text("Prev"),
          colorActiveDot: Colors.white,
          colorDot: Colors.black,
          showDoneBtn: true,
          // showPrevBtn: true,
          showSkipBtn: true,
          skipButtonStyle: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          doneButtonStyle: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          nextButtonStyle: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          sizeDot: 10,
          typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
          listCustomTabs: renderListCustomTab(),
          scrollPhysics: const BouncingScrollPhysics(),
          onDonePress: () => Get.to(
                () => const IndexPage(),
              )

          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => const IndexPage(),
          //   ),
          // ),
          ),
    );
  }
}
