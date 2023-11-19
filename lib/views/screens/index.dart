import 'package:doctor_app/views/screens/appointments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'main_screens/history.dart';
import 'main_screens/home.dart';
import 'main_screens/profile.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int selectedPage = 0;
  static final List<Widget> pages = <Widget>[
    //const HomeWidget(themeState: themeState, size: size),
    const HomePage(),
    const AppointmentPage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  void onPageClicked(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.withOpacity(0.1),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: pages[selectedPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: selectedPage,
        onTap: onPageClicked,
        //  elevation: 1,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.green.withOpacity(0.5),
        unselectedItemColor: Colors.blueGrey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.home),
              activeIcon: Icon(IconlyBold.home),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.calendar),
              activeIcon: Icon(IconlyBold.calendar),
              label: "Appointments"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.chart),
              activeIcon: Icon(IconlyBold.chart),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.profile),
              activeIcon: Icon(IconlyBold.profile),
              label: "Profile"),
        ],
      ),
    );
  }
}
