import 'dart:convert';

import 'package:cartgeektask/Item/PackageItem.dart';
import 'package:cartgeektask/Model/PackageModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Item/CurrentBootkinItem.dart';
import '../Model/CurrentBooking.dart';
import '../Utils/Constant.dart';

class Homescreen extends StatefulWidget {
  static const screenName = '/homeScreen';

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<CurrentBooking> curBooking = [];
  List<PackageModel> packageList = [];
  bool isCurrent = true;
  bool isPackage = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () async {
      await getCurrentBookingDetails();
      await getPackageDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                clipBehavior: Clip.none, // Allows overflow for the image
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF5B5CF), // Light pink background color
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        // Text and Button Column
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Nanny And Babysitting Services',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 10),
                              /*Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color(0xFF262f71),
                                  // Hex color with full opacity
                                  borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 15.0,
                                    ),
                                    Text(
                                      'Rate Us',
                                      style: TextStyle(
                                        color: Colors.white, // Text color
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),*/
                              Container(
                                width: 100,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle button press
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF262f71),
                                    // Button color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Book Now',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        // Spacer to adjust content alignment
                        Spacer(flex: 1),
                      ],
                    ),
                  ),
                  // Positioned image
                  Positioned(
                    right: -10,
                    // Adjust this value to move the image horizontally
                    top: 10,
                    // Adjust this value to move the image vertically
                    child: Image.asset(
                      'assets/images/mom_baby.png',
                      // Replace with your image path
                      width: 120, // Adjust the size as needed
                      height: 120,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isCurrent)
            SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = curBooking[index];
                  return CurrentBookingItem(
                    item: item,
                    backgroundColor: Colors.white,
                  );
                },
                childCount: curBooking.length,
              ),
            ),
          if (isPackage)
            SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = packageList[index];
                  return PackageItem(
                    item: item,
                    backgroundColor: _getCardColor(index),
                    btnColor: _getButtonColor(index),
                  );
                },
                childCount: packageList.length,
              ),
            ),
        ],
      ),
    );
  }

  Future<void> getCurrentBookingDetails() async {
    try {
      Response response = await get(
        Uri.parse(Constant.currentBookingList),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['response'];
        setState(() {
          curBooking =
              data.map((item) => CurrentBooking.fromJson(item)).toList();
          isCurrent = false;
        });
      } else {
        throw Exception('Failed to load current bookings');
      }
    } catch (error) {
      debugPrint('###currentBookingList Exception $error');
    }
  }

  Future<void> getPackageDetails() async {
    try {
      Response response = await get(
        Uri.parse(Constant.packageList),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['response'];
        setState(() {
          packageList =
              data.map((item) => PackageModel.fromJson(item)).toList();
          isPackage = false;
        });
      } else {
        throw Exception('Failed to load package details');
      }
    } catch (error) {
      debugPrint('###packageList Exception $error');
    }
  }

  Color _getCardColor(int index) {
    // Alternate card colors Red, Green, Blue
    switch (index % 2) {
      case 0:
        return const Color(0xFFF0B3CD)!;
      case 1:
        return const Color(0xFF80ABDB)!;
      default:
        return const Color(0xFFF0B3CD)!;
    }
  }

  Color _getButtonColor(int index) {
    // Alternate card colors Red, Green, Blue
    switch (index % 2) {
      case 0:
        return const Color(0xFFE36DA6)!;
      case 1:
        return const Color(0xFF0098D0)!;
      default:
        return const Color(0xFFF0B3CD)!;
    }
  }
}
