import 'package:flutter/material.dart';

import '../Model/PackageModel.dart';

class PackageItem extends StatefulWidget {
  final PackageModel item;
  final Color backgroundColor;
  final Color btnColor;

  PackageItem({required this.item, required this.backgroundColor,required this.btnColor});

  @override
  State<PackageItem> createState() => _PackageItemState();
}

class _PackageItemState extends State<PackageItem> {
  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              color: widget.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Icon(
                            Icons.calendar_month,
                            color: Color(0xFFE36DA6),
                            size: 40,
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle button press
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: widget.btnColor,
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
                                      color: Colors.white, fontSize: 11.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.title.toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '₹ ${item.price.toString()}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF262f71),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.desc.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
