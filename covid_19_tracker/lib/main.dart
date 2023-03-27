import 'package:covid_19_tracker/pages/home.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const TrackerApp());

class TrackerApp extends StatelessWidget {
  const TrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: EasySplashScreen(
          logo: Image.asset("assets/images/splash_screen.png"),
          title: const Text(
            "Covid-19 Tracker",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.grey.shade400,
          navigator: const Home(),
          showLoader: false,
          durationInSeconds: 2,
        ));
  }
}
