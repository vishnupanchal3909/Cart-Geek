import 'package:cartgeektask/Screen/DashboardScreen.dart';
import 'package:flutter/material.dart';

import '../Utils/Styling.dart';
import 'HomeScreen.dart';

class Splashscreen extends StatefulWidget {
  static const screenName = '/splashScreen';

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () async {
      navigateToDashboard();
    });
  }

  void navigateToDashboard() {
    Navigator.pushReplacementNamed(context, Dashboardscreen.screenName,
        arguments: "checkVersion");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/mom_baby.png'),
              const Text(
                "Created By Vishnu Panchal",
              )
            ],
          )
              //child: Text('Logo'),
              ),
        ),
      ),
    );
  }
}
