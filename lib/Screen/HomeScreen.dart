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
                      color: Colors.pink[50], // Light pink background color
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
                              ElevatedButton(
                                onPressed: () {
                                  // Handle button press
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pinkAccent[200],
                                  // Button color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: Text('Book Now'),
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
    switch (index % 3) {
      case 0:
        return Colors.red[100]!;
      case 1:
        return Colors.green[100]!;
      case 2:
        return Colors.blue[100]!;
      default:
        return Colors.white;
    }
  }
}
