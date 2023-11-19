import 'package:doctor_app/db/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'views/screens/main_screens/intro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.iniDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor:
        //     const Color.fromARGB(255, 254, 254, 254).withOpacity(1),
        // primaryColor: const Color.fromARGB(255, 248, 249, 248),
        primarySwatch: Colors.green,
      ),
      home: const IntroScreen(),
    );
  }
}
