import 'package:flutter/material.dart';

import '../Model/CurrentBooking.dart';

class CurrentBookingItem extends StatefulWidget {
  final CurrentBooking item;
  final Color backgroundColor;

  CurrentBookingItem({required this.item, required this.backgroundColor});

  @override
  State<CurrentBookingItem> createState() => _CurrentBookingItemState();
}

class _CurrentBookingItemState extends State<CurrentBookingItem> {
  @override
  Widget build(BuildContext context) {
    var value = widget.item;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Your Current Booking',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'One Day Package',
                          style: TextStyle(fontSize: 18, color: Colors.pink),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {
                              // Book package
                            },
                            child: Text('Start'),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('From', style: TextStyle(fontSize: 16)),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    color: Colors.pinkAccent,
                                  ),
                                  Text(value.from_date.toString(),
                                      style: TextStyle(fontSize: 16)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.watch_later_outlined,
                                    color: Colors.pinkAccent,
                                  ),
                                  Text(value.from_time.toString(),
                                      style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('To', style: TextStyle(fontSize: 16)),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    color: Colors.pinkAccent,
                                  ),
                                  Text(value.to_date.toString(),
                                      style: TextStyle(fontSize: 16)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.watch_later_outlined,
                                    color: Colors.pinkAccent,
                                  ),
                                  Text(value.to_time.toString(),
                                      style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
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
                        ),
                        Container(
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
                                Icons.location_on,
                                color: Colors.white,
                                size: 15.0,
                              ),
                              Text(
                                'Geolocations',
                                style: TextStyle(
                                  color: Colors.white, // Text color
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
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
                                Icons.two_wheeler,
                                color: Colors.white,
                                size: 15.0,
                              ),
                              Text(
                                'Survilence',
                                style: TextStyle(
                                  color: Colors.white, // Text color
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
