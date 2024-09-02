import 'package:cartgeektask/Screen/PackageScreen.dart';
import 'package:cartgeektask/Screen/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'CustomWidget/AppDrawer.dart';
import 'CustomWidget/CustomAppBar.dart';
import 'Screen/BookingScreen.dart';
import 'Screen/DashboardScreen.dart';
import 'Screen/HomeScreen.dart';
import 'Screen/ProfileScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splashscreen(),
      routes: {
        Splashscreen.screenName: (context) => Splashscreen(),
        Dashboardscreen.screenName: (context) => Dashboardscreen(),
        Homescreen.screenName: (context) => Homescreen(),
        Packagescreen.screenName: (context) => Packagescreen(),
        BookingScreen.screenName: (context) => BookingScreen(),
        ProfileScreen.screenName: (context) => ProfileScreen(),
        Appdrawer.screenName: (context) => Appdrawer(),
        CustomAppBar.screenName: (context) => CustomAppBar(),
      },
    );
  }
}
