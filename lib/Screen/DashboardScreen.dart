import 'package:cartgeektask/Screen/BookingScreen.dart';
import 'package:cartgeektask/Screen/HomeScreen.dart';
import 'package:cartgeektask/Screen/PackageScreen.dart';
import 'package:cartgeektask/Screen/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../CustomWidget/AppDrawer.dart';
import '../CustomWidget/CustomAppBar.dart';

class Dashboardscreen extends StatefulWidget {
  static const screenName = '/splashScreen';

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Homescreen(),
    Packagescreen(),
    BookingScreen(),
    ProfileScreen()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Appdrawer(),
        appBar: CustomAppBar(),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Container(
            height: 56.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => _onTabTapped(0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: _currentIndex == 0
                            ? Colors.pinkAccent[200]
                            : Colors.grey,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          color: _currentIndex == 0
                              ? Colors.pinkAccent[200]
                              : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _onTabTapped(1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.business,
                        color: _currentIndex == 1
                            ? Colors.pinkAccent[200]
                            : Colors.grey,
                      ),
                      Text(
                        "Package",
                        style: TextStyle(
                          color: _currentIndex == 1
                              ? Colors.pinkAccent[200]
                              : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _onTabTapped(2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark_border,
                        color: _currentIndex == 2
                            ? Colors.pinkAccent[200]
                            : Colors.grey,
                      ),
                      Text(
                        "Booking",
                        style: TextStyle(
                          color: _currentIndex == 2
                              ? Colors.pinkAccent[200]
                              : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _onTabTapped(3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: _currentIndex == 3
                            ? Colors.pinkAccent[200]
                            : Colors.grey,
                      ),
                      Text(
                        "Person",
                        style: TextStyle(
                          color: _currentIndex == 3
                              ? Colors.pinkAccent[200]
                              : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
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
